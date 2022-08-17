import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:encrypt/encrypt.dart' as keyEnc;
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/users.model.dart';
import '../themes/colores.dart';
import '../widgets/new_user_modal.dart';

class UserController extends GetxController {
  var formatDate = DateFormat('dd-MM-yyyy');
  var dropdownvalue = 'Selecciona un rango';
  var dropdownvalueZona = 'Selecciona una zona';
  var txtDatePicker = TextEditingController();
  var txtNombre = TextEditingController();
  var txtPassword = TextEditingController();
  var txtUsername = TextEditingController();
  var isAdmin = false;
  var isActive = false;
  var noShowPasswordLogin = false;
  var isLoading = false;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;

  @override
  void onInit() {
    super.onInit();
    collectionReference = _firestore.collection("Usuarios");
  }

  saveUsuario(data) async {
    isLoading = true;
    update();

    //data['idDisciplina'] += teams.last.idDisciplina;
    await collectionReference.add(data);
    isLoading = false;
    update();
  }

  updateUsuario(documentId, data) async {
    isLoading = true;
    update();

    //data['idDisciplina'] += teams.last.idDisciplina;
    await collectionReference.doc(documentId).update(data);
    isLoading = false;
    update();
  }

  showPassword(bool val) {
    noShowPasswordLogin = val;
    update();
  }

  writeInputDatePicker(DateTime date) {
    txtDatePicker.text = formatDate.format(date).toString();
    update();
  }

  changeZona(String value) {
    dropdownvalueZona = value;
    update();
  }

  changeRango(String value) {
    dropdownvalue = value;
    update();
  }

  changeIsAdmin(value) {
    isAdmin = value;
    update();
  }

  changeIsActive(value) {
    isActive = value;
    update();
  }

  encryptPassword(String password) {
    var enco = utf8.encode(password);
    return base64.encode(enco);
  }

  decryptPassword(String password) {
    var pass = utf8.decode(base64.decode(password)).toString();
    txtPassword.text = pass;
    update();
  }

  cleanAll() {
    txtNombre.clear();
    txtDatePicker.clear();
    txtPassword.clear();
    txtUsername.clear();
    changeIsActive(false);
    changeIsAdmin(false);
    changeZona('Selecciona una zona');
    update();
  }

  Stream<List<UsuariosModel>> getDisciplinaSnapshot() {
    return collectionReference.snapshots().map((QuerySnapshot query) {
      List<UsuariosModel> usuarios = [];

      for (var usuario in query.docs) {
        final usuarioModel =
            UsuariosModel.fromDocumentSnapshot(documentSnapshot: usuario);
        usuarios.add(usuarioModel);
        update();
      }
      return usuarios;
    });
  }

  List<DataRow> buildList(
      BuildContext context, List<DocumentSnapshot> snapshot) {
    return snapshot.map((data) => _buildListItem(context, data)).toList();
  }

  DataRow _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = UsuariosModel.fromDocumentSnapshot(documentSnapshot: data);

    return DataRow(cells: [
      DataCell(Text(record.zonaUsuario)),
      DataCell(Text(record.nombreCompleto)),
      DataCell(Text(record.userName)),
      DataCell(
        CupertinoSwitch(
          value: record.isAdmin,
          onChanged: null,
        ),
      ),
      DataCell(
        CupertinoSwitch(
          value: record.isActive,
          onChanged: null,
        ),
      ),
      DataCell(
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                txtNombre.text = record.nombreCompleto;
                txtUsername.text = record.userName;
                //txtPassword.text = decryptPassword(record.userPassword);
                txtDatePicker.text = record.fechaNacimiento;
                isActive = record.isActive;
                isAdmin = record.isAdmin;
                changeZona(record.zonaUsuario);
                decryptPassword(record.userPassword);
                showPassword(true);
                update();
                showDialog(
                  context: context,
                  builder: (context) {
                    return UserCreateModal(
                      userID: record.usuarioId!,
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
                                'Deseas eliminar a: ${record.nombreCompleto}',
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
                                          .doc(record.usuarioId)
                                          .delete();
                                      Get.back();
                                      Get.snackbar(
                                        'Confirm',
                                        'Usuario borrado correctamente',
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
      )
    ]);
  }
}
