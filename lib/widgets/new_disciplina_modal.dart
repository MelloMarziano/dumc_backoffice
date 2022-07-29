import 'package:dumc_backoffice/controllers/clubs_controller.dart';
import 'package:dumc_backoffice/controllers/disciplina_controller.dart';
import 'package:dumc_backoffice/controllers/user_controller.dart';
import 'package:dumc_backoffice/controllers/zona_controller.dart';
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
  var zona = [
    'Zona 1',
    'Zona 2',
    'Zona 3',
    'Zona 4',
    'Zona 5',
    'Zona 6',
    'Zona 7',
    'Zona 8',
    'Zona 9',
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
                height: 50,
                child: TextField(
                  controller: controller.txtDescripcion,
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
                'Cantidad de banderas',
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
                        controller.txtDescripcion.text.isNotEmpty) {
                      Get.snackbar(
                        'Confirm',
                        'Zona creada correctamente',
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
                  child: Text('Guardar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
