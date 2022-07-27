import 'package:dumc_backoffice/controllers/user_controller.dart';
import 'package:dumc_backoffice/controllers/zona_controller.dart';
import 'package:dumc_backoffice/themes/colores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class ZonaCreateModal extends StatefulWidget {
  @override
  _ZonaCreateModalState createState() => _ZonaCreateModalState();
}

class _ZonaCreateModalState extends State<ZonaCreateModal> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ZonaController>(
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
                    'Crear zona nueva',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.black,
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
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Division',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: TextField(
                  controller: controller.txtDivision,
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
                'Nombre',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: TextField(
                  controller: controller.txtNombre,
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
                'Nombre cordinador',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: TextField(
                  controller: controller.txtCordinador,
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
                    if (controller.txtNombre.text.isNotEmpty &&
                        controller.txtDivision.text.isNotEmpty &&
                        controller.txtCordinador.text.isNotEmpty) {
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
                        backgroundColor: Colors.red,
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
