import 'package:dumc_backoffice/controllers/disciplina_controller.dart';

import 'package:dumc_backoffice/themes/colores.dart';
import 'package:dumc_backoffice/widgets/disciplina_detail_datatable.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DisciplinaModalCreateModal extends StatefulWidget {
  final String nombreClub;
  final String tipoClub;

  const DisciplinaModalCreateModal(
      {super.key, required this.nombreClub, required this.tipoClub});

  @override
  _DisciplinaModalCreateModalState createState() =>
      _DisciplinaModalCreateModalState();
}

class _DisciplinaModalCreateModalState
    extends State<DisciplinaModalCreateModal> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DisciplinaController>(
        init: DisciplinaController(),
        builder: (controller) {
          controller.fillData(widget.nombreClub, widget.tipoClub);
          return AlertDialog(
            //title: Text('Cupertino Dialog'),
            content: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/logo/dumc.png',
                        width: 42,
                        height: 42,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Detalle de Disciplina para el club: ',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Color(0xFF0d2d52),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.nombreClub,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.red,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.cancel,
                          color: Color(0xFFB00020),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            //width: 500,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                _cantidadTotal(
                                    'Banderas Amarillas',
                                    controller.banderasAmarillas.toString(),
                                    Color(0xFFFDB850)),
                                _cantidadTotal(
                                    'Banderas Azules',
                                    controller.banderasAzules.toString(),
                                    Color(0xFF015EA7)),
                                _cantidadTotal(
                                    'Banderas Rojas',
                                    controller.banderaRoja.toString(),
                                    Color(0xFFD9114A)),
                                _cantidadTotal(
                                    'Total puntos',
                                    '-${controller.cantidaPuntos}',
                                    Color(0xFF808080)),
                              ],
                            ),
                          ),
                          const Spacer(),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Tooltip(
                              message: 'Descargar reporte',
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.generatePdf();
                                  //controller.anchor.click();
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(50, 50),
                                  primary: dumncVerde,
                                ),
                                child: Icon(Icons.download),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Selecciona un camporee',
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      color: Color(0xFF0d2d52),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: const <BoxShadow>[
                                      BoxShadow(
                                        color: Color.fromRGBO(
                                          0,
                                          0,
                                          0,
                                          0.57,
                                        ), //shadow for button
                                        blurRadius: 2,
                                      ) //blur radius of shadow
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      right: 5,
                                      left: 10,
                                    ),
                                    child: DropdownButton(
                                      // Initial Value
                                      value: controller.dropdownvalueCamporee
                                          .toString(),
                                      isExpanded:
                                          true, //make true to take width of parent widget
                                      underline: Container(),
                                      // Down Arrow Icon
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),

                                      // Array list of items
                                      items: controller.dropDownZona
                                          .map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (String? newValue) {
                                        // _.changeZona(newValue!);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 520,
                    width: double.infinity,
                    child: const SingleChildScrollView(
                      child: DisciplinaDEtailTableDataTableWidget(
                        titleTable: [
                          'Evaluador',
                          'Codigo de falta',
                          'Detalle',
                          'Evidencia',
                          'Fecha',
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Container _cantidadTotal(String titulo, String cantidad, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      margin: EdgeInsets.only(
        right: 10,
      ),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Text(
            titulo,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            cantidad,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
