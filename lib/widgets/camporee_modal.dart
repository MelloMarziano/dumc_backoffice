import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dumc_backoffice/controllers/camporee_controllers.dart';
import 'package:dumc_backoffice/controllers/clubs_controller.dart';

import 'package:dumc_backoffice/themes/colores.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

class CamporeeCreateModal extends StatefulWidget {
  @override
  _CamporeeCreateModalState createState() => _CamporeeCreateModalState();
}

class _CamporeeCreateModalState extends State<CamporeeCreateModal> {
  var tipoCamporee = [
    'Aventureros',
    'Conquistadores',
    'Guias Mayores',
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CamporeeController>(
      init: CamporeeController(),
      builder: (controller) => AlertDialog(
        //title: Text('Cupertino Dialog'),
        content: Container(
          width: MediaQuery.of(context).size.width * 0.5,
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
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Crear nuevo camporee',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color(0xFF0d2d52),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
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
              Text(
                'Nombre del camporee',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Color(0xFF0d2d52),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: TextField(
                  controller: controller.txtNombreCamporee,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Tipo Camporee',
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
                    value: controller.dropdownvalueTipoCamporee.toString(),
                    isExpanded: true, //make true to take width of parent widget
                    underline: Container(),
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: tipoCamporee.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      controller.changeTipoCamporee(newValue!);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 80,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Desde:',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Color(0xFF0d2d52),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: TextField(
                              controller: controller.txtFechaComienzo,
                              onTap: () async {
                                final DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1970, 8),
                                  lastDate: DateTime(2101),
                                );
                                if (picked != null) {
                                  controller.writeInputDatePickerStart(picked);
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                suffixIcon: const Icon(Icons.calendar_month),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hasta:',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Color(0xFF0d2d52),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: TextField(
                              controller: controller.txtFechaFinal,
                              onTap: () async {
                                final DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1970, 8),
                                  lastDate: DateTime(2101),
                                );
                                if (picked != null) {
                                  controller.writeInputDatePickerEnd(picked);
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                suffixIcon: const Icon(Icons.calendar_month),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Activo',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Color(0xFF0d2d52),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      CupertinoSwitch(
                        value: controller.isActive,
                        onChanged: (value) {
                          controller.changeIsActive(value);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Text(
                      '* Al activar este camporee desactivaras el que este activo actualmente.',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (controller.txtNombreCamporee.text.isNotEmpty &&
                        controller.txtFechaComienzo.text.isNotEmpty &&
                        controller.txtFechaFinal.text.isNotEmpty) {
                      if (DateTime.parse(controller.txtFechaComienzo.text)
                          .isAfter(
                              DateTime.parse(controller.txtFechaFinal.text))) {
                        Get.snackbar(
                          'Error',
                          'La fecha inicial no puede ser mayor a la fecha final',
                          colorText: Colors.white,
                          backgroundColor: Color(0xFFB00020),
                        );
                        return;
                      }
                      final datos = {
                        'nombreCamporee': controller.txtNombreCamporee.text,
                        'tipoCamporee': controller.dropdownvalueTipoCamporee,
                        'fechaInicial':
                            DateTime.parse(controller.txtFechaComienzo.text)
                                .millisecondsSinceEpoch,
                        'fechaFinal':
                            DateTime.parse(controller.txtFechaFinal.text)
                                .millisecondsSinceEpoch,
                        'idCamporee': 1,
                        'isActivo': controller.isActive,
                      };

                      //print(datos);
                      await controller.saveCamporee(datos);
                      Get.back();
                      Get.snackbar(
                        'Confirm',
                        'Camporee creado correctamente',
                        colorText: Colors.white,
                        backgroundColor: dumncVerde,
                      );
                    } else {
                      Get.snackbar(
                        'Confirm',
                        'Zona creado correctamente',
                        colorText: Colors.white,
                        backgroundColor: Color(0xFFB00020),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 50),
                    primary: dumncVerde,
                  ),
                  child: controller.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Text('Guardar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
