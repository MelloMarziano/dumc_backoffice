import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dumc_backoffice/controllers/clubs_controller.dart';
import 'package:dumc_backoffice/controllers/disciplina_controller.dart';
import 'package:dumc_backoffice/controllers/user_controller.dart';
import 'package:dumc_backoffice/controllers/zona_controller.dart';
import 'package:dumc_backoffice/models/disciplina.model.dart';
import 'package:dumc_backoffice/themes/colores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class DisciplinaCreateModal extends StatefulWidget {
  @override
  _DisciplinaCreateModalState createState() => _DisciplinaCreateModalState();
}

class _DisciplinaCreateModalState extends State<DisciplinaCreateModal> {
  var tipoDisciplina = [
    'Cintas Amarillas (AM)',
    'Cintas Azules (AZ)',
    'Cintas Rojas (R)',
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DisciplinaController>(
      init: DisciplinaController(),
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
                    'Crear nuevo disciplina',
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
                height: 30,
              ),
              Text(
                'Tipo de cinta',
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
                  boxShadow: <BoxShadow>[
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
                  padding: EdgeInsets.only(
                    right: 5,
                    left: 10,
                  ),
                  child: DropdownButton(
                    // Initial Value
                    value: controller.dropdownvalueTipo.toString(),
                    isExpanded: true, //make true to take width of parent widget
                    underline: Container(),
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: tipoDisciplina.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      controller.changeTipo(newValue!);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Codigo de falta',
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
                  controller: controller.txtCodigo,
                  readOnly: controller.isLoading,
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
                'Descripcion',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Color(0xFF0d2d52),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 100,
                child: TextField(
                  maxLines: 3,
                  controller: controller.txtDescripcion,
                  readOnly: controller.isLoading,
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
                'Cantidad de cintas',
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
                  controller: controller.txtBanderas,
                  readOnly: controller.isLoading,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (controller.txtCodigo.text.isNotEmpty &&
                        controller.txtDescripcion.text.isNotEmpty &&
                        controller.txtBanderas.text.isNotEmpty) {
                      final datos = {
                        'cantidadCintasDisciplina': controller.txtBanderas.text,
                        'codigoDisciplina': controller.txtCodigo.text,
                        'descripcionDisciplina': controller.txtDescripcion.text,
                        'tipoDisciplina': controller.dropdownvalueTipo,
                        'idDisciplina': 1,
                      };

                      print(datos);
                      await controller.saveDisciplina(datos);
                      controller.txtBanderas.clear();
                      controller.txtDescripcion.clear();
                      controller.txtBanderas.clear();
                      Get.snackbar(
                        'Confirm',
                        'Disciplina creada correctamente',
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
