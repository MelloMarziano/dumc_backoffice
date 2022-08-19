import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dumc_backoffice/models/camporee.model.dart';
import 'package:dumc_backoffice/models/disciplina.model.dart';
import 'package:dumc_backoffice/reports/disciplina.report.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:html' as html;

import '../themes/colores.dart';
import '../widgets/new_disciplina_modal.dart';

class DisciplinaController extends GetxController {
  var txtCodigo = TextEditingController();
  var txtDescripcion = TextEditingController();
  var txtBanderas = TextEditingController();

  var dropdownvalueTipo = 'Cintas Amarillas (AM)';
  var isLoading = false;

  var tipoClubWidget = '';
  var nombreClubWidget = '';

  var dropdownvalueCamporee = '';

  var dropDownZona = [''];

  var banderasAmarillas = 0;
  var banderasAzules = 0;
  var banderaRoja = 0;
  var cantidaPuntos = 0;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  late CollectionReference collectionReferenceBanderas;
  late CollectionReference collectionReferenceCamporees;

  Rx<List<DisciplinaModel>> disciplinaList = Rx<List<DisciplinaModel>>([]);
  List<DisciplinaModel> get teams => disciplinaList.value;

  Rx<List<BanderasDisciplina>> banderasList = Rx<List<BanderasDisciplina>>([]);
  List<BanderasDisciplina> get banderas => banderasList.value;

  Rx<List<CamporeeModel>> camporeesList = Rx<List<CamporeeModel>>([]);
  List<CamporeeModel> get camporees => camporeesList.value;

  @override
  void onInit() {
    super.onInit();
    collectionReference = _firestore.collection("Disciplina");
    collectionReferenceBanderas = _firestore.collection('Banderas');
    collectionReferenceCamporees = _firestore.collection('Camporees');
    disciplinaList.bindStream(getDisciplinaSnapshot());
    camporeesList.bindStream(getCamporeeSnapshot());
  }

  fillData(String nombreClub, String tipoClub) {
    tipoClubWidget = tipoClub;
    nombreClubWidget = nombreClub;
    update();
  }

  changeTipo(String value) {
    dropdownvalueTipo = value;
    update();
  }

  updateDisciplina(documentId, data) async {
    isLoading = true;
    update();
    await collectionReference.doc(documentId).update(data);
    isLoading = false;
    update();
  }

  saveDisciplina(data) async {
    isLoading = true;
    update();

    data['idDisciplina'] += teams.last.idDisciplina;
    final resp = await collectionReference.add(data);
    isLoading = false;
    //Get.back();
  }

  Stream<List<DisciplinaModel>> getDisciplinaSnapshot() {
    return collectionReference
        .orderBy('idDisciplina')
        .snapshots()
        .map((QuerySnapshot query) {
      List<DisciplinaModel> disciplinas = [];

      for (var disciplina in query.docs) {
        final disciplinaModel =
            DisciplinaModel.fromDocumentSnapshot(documentSnapshot: disciplina);
        disciplinas.add(disciplinaModel);
        update();
      }
      return disciplinas;
    });
  }

  Stream<List<CamporeeModel>> getCamporeeSnapshot() {
    dropDownZona.clear();
    return collectionReferenceCamporees
        .orderBy('idCamporee')
        .snapshots()
        .map((QuerySnapshot query) {
      List<CamporeeModel> camporees = [];

      for (var camporee in query.docs) {
        final camporeeModel =
            CamporeeModel.fromDocumentSnapshot(documentSnapshot: camporee);
        camporees.add(camporeeModel);
        dropDownZona.add(camporeeModel.nombreCamporee);
        if (camporeeModel.isActivo) {
          dropdownvalueCamporee = camporeeModel.nombreCamporee;
          banderasList.bindStream(getBanderasSnapshot(
            nombreClubWidget,
            tipoClubWidget,
            camporeeModel.nombreCamporee,
          ));
        }

        update();
      }
      return camporees;
    });
  }

  Stream<List<BanderasDisciplina>> getBanderasSnapshot(
    String club,
    String tipoClub,
    String nombreCamporee,
  ) {
    cantidaPuntos = 0;
    banderasAzules = 0;
    banderasAmarillas = 0;
    banderaRoja = 0;
    update();
    late Stream<QuerySnapshot>? query;
    query = collectionReferenceBanderas
        .where('club', isEqualTo: club)
        .where('tipoClub', isEqualTo: tipoClub)
        .where('camporee', isEqualTo: nombreCamporee)
        .snapshots();
    update();

    return query.map((QuerySnapshot query) {
      List<BanderasDisciplina> banderas = [];
      cantidaPuntos = 0;
      banderasAzules = 0;
      banderasAmarillas = 0;
      banderaRoja = 0;
      //update();

      for (var bandera in query.docs) {
        final banderaModel =
            BanderasDisciplina.fromDocumentSnapshot(documentSnapshot: bandera);
        if (banderaModel.codigoFalta.contains('AM')) {
          banderasAmarillas += banderaModel.cantidaCinta;
          update();
        }
        if (banderaModel.codigoFalta.contains('R')) {
          banderaRoja += banderaModel.cantidaCinta;
          update();
        }
        if (banderaModel.codigoFalta.contains('AZ')) {
          banderasAzules += banderaModel.cantidaCinta;
          update();
        }
        banderas.add(banderaModel);
      }
      cantidaPuntos += (banderasAmarillas ~/ 3) * 10;
      banderasAzules += banderasAmarillas ~/ 3;
      cantidaPuntos += (banderasAzules ~/ 2) * 25;
      banderaRoja += (banderasAzules ~/ 2);
      cantidaPuntos += banderaRoja * 25;

      update();
      return banderas;
    });
  }

  List<DataRow> buildListBanderas(
    BuildContext context,
  ) {
    return banderas
        .map((data) => _buildListItemBanderas(context, data))
        .toList();
  }

  DataRow _buildListItemBanderas(BuildContext context, data) {
    //final record = ClubsModel.fromDocumentSnapshot(documentSnapshot: data);
    final String codigo = data.codigoFalta;
    return DataRow(cells: [
      DataCell(Text(data.evaluador, style: GoogleFonts.poppins())),
      DataCell(Row(
        children: [
          Text(
            data.codigoFalta,
            style: GoogleFonts.poppins(),
          ),
          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.flag,
            color: (codigo.contains('R'))
                ? Colors.red
                : (codigo.contains('AM'))
                    ? Colors.yellow
                    : Colors.blue,
          ),
        ],
      )),
      DataCell(
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 400,
                child: Text(
                  data.detalle,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(),
                ),
              ),
              Visibility(
                visible: data.detalle.length > 100,
                child: GestureDetector(
                    onTap: () {
                      Get.snackbar(
                        'Detalle de falta',
                        data.detalle,
                        colorText: Colors.black,
                        backgroundColor: const Color(0xFFE2E0DF),
                        maxWidth: 600,
                        snackPosition: SnackPosition.BOTTOM,
                        duration: const Duration(seconds: 120),
                      );
                    },
                    child: Text(
                      'Leer mas',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        color: Colors.blue,
                      )),
                    )),
              ),
            ],
          ),
        ),
      ),
      DataCell(
          Text(data.evidencia ? 'Si' : 'No', style: GoogleFonts.poppins())),
      DataCell(
        Text(
          (data.fechaDelActo as Timestamp).toDate().toString(),
          style: GoogleFonts.poppins(),
        ),
      ),
      DataCell(
        ElevatedButton(
          onPressed: () async {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Container(
                      height: 400,
                      width: 600,
                      color: Colors.white,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.highlight_off,
                            size: 64,
                            color: Colors.red,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Deseas eliminar la Bandera de:\n ${data.evaluador}',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(150, 40),
                                  primary: Colors.red,
                                ),
                                child: const Text('Cancelar'),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  cantidaPuntos = 0;
                                  banderasAzules = 0;
                                  banderasAmarillas = 0;
                                  banderaRoja = 0;

                                  update();
                                  await collectionReferenceBanderas
                                      .doc(data.banderaId)
                                      .delete();
                                  // cantidaPuntos = 0;
                                  // banderasAzules = 0;
                                  // banderasAmarillas = 0;
                                  // banderaRoja = 0;

                                  // update();
                                  banderasList.bindStream(getBanderasSnapshot(
                                    nombreClubWidget,
                                    tipoClubWidget,
                                    dropdownvalueCamporee,
                                  ));
                                  Get.back();
                                  Get.snackbar(
                                    'Confirm',
                                    'Disciplina borrada correctamente',
                                    colorText: Colors.white,
                                    backgroundColor: Colors.green,
                                    maxWidth: 400,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(150, 40),
                                    primary: Colors.red.shade300),
                                child: const Text('Borrar'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          style: ElevatedButton.styleFrom(
            //fixedSize: const Size(150, 40),
            primary: Color(0xFFB00020),
          ),
          child: Icon(Icons.delete),
        ),
      ),
    ]);
  }

  List<DataRow> buildList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    return snapshot.map((data) => _buildListItem(context, data)).toList();
  }

  DataRow _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = DisciplinaModel.fromDocumentSnapshot(documentSnapshot: data);

    return DataRow(cells: [
      DataCell(Text(record.tipoDisciplina)),
      DataCell(Text(record.codigoDisciplina)),
      DataCell(SizedBox(
        width: 500,
        child: Text(
          record.descripcionDisciplina,
          overflow: TextOverflow.ellipsis,
          softWrap: true,
        ),
      )),
      DataCell(Text(record.cantidadCintasDisciplina)),
      DataCell(
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                changeTipo(record.tipoDisciplina);
                txtCodigo.text = record.codigoDisciplina;
                txtDescripcion.text = record.descripcionDisciplina;
                txtBanderas.text = record.cantidadCintasDisciplina;

                update();
                showDialog(
                  context: context,
                  builder: (context) {
                    return DisciplinaCreateModal(
                      disciplinaID: record.disciplinaId!,
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                //fixedSize: const Size(150, 40),
                primary: dumncDoradoClaro,
              ),
              child: Icon(Icons.edit),
            ),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Container(
                          height: 400,
                          width: 600,
                          color: Colors.white,
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.highlight_off,
                                size: 64,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Deseas eliminar la Disciplina con codigo:\n ${record.codigoDisciplina}',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(150, 40),
                                      primary: Colors.red,
                                    ),
                                    child: const Text('Cancelar'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      await collectionReference
                                          .doc(record.disciplinaId)
                                          .delete();
                                      Get.back();
                                      Get.snackbar(
                                        'Confirm',
                                        'Disciplina borrada correctamente',
                                        colorText: Colors.white,
                                        backgroundColor: Colors.green,
                                        maxWidth: 400,
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(150, 40),
                                        primary: Colors.red.shade300),
                                    child: const Text('Borrar'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              style: ElevatedButton.styleFrom(
                //fixedSize: const Size(150, 40),
                primary: Color(0xFFB00020),
              ),
              child: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    ]);
  }

  Future<void> generatePdf() async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Column(
            children: [
              pw.SizedBox(
                width: double.infinity,
                child: pw.FittedBox(
                  child: pw.Text('Hola mundo', style: pw.TextStyle(font: font)),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Flexible(child: pw.FlutterLogo())
            ],
          );
        },
      ),
    );

    //return pdf.save();
    Uint8List pdfInBytes = await pdf.save();
    final blob = html.Blob([pdfInBytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'reporte disciplina $nombreClubWidget-$tipoClubWidget.pdf';
    html.document.body!.children.add(anchor);

    anchor.click();
  }
}
