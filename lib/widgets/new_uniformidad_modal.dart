import 'package:dumc_backoffice/controllers/uniformidad_controller.dart';
import 'package:dumc_backoffice/themes/colores.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UniformidadCreateModal extends StatefulWidget {
  @override
  _UniformidadCreateModalState createState() => _UniformidadCreateModalState();
}

class _UniformidadCreateModalState extends State<UniformidadCreateModal> {
  var tipo = [
    'Selecciona un tipo',
    'Aventureros',
    'Conquistadores',
    'Guias Mayores',
  ];

  var criterio = [
    'Selecciona un criterio',
    'Diseño',
    'Insignias Básicas',
    'Insignias de Clase',
    'Banda de Especialidades',
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UniformidadController>(
      init: UniformidadController(),
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
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Crear nueva evaluacion',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Color(0xFF0d2d52),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
              Text(
                'Tipo club',
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
                    value: controller.dropdownvalueTipo.toString(),
                    isExpanded: true, //make true to take width of parent widget
                    underline: Container(),
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: tipo.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      //controller.changeZona(newValue!);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Criterio',
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
                    value: controller.dropdownvalueCriterio.toString(),
                    isExpanded: true, //make true to take width of parent widget
                    underline: Container(),
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: criterio.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      //controller.changeZona(newValue!);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Titulo pregunta',
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
                            controller: controller.txtTituloPregunta,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Valor',
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
                            keyboardType: TextInputType.number,
                            controller: controller.txtPreguntaValor,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sub-pregunta 1',
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
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: TextField(
                            controller: controller.txtPreguntaUno,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sub-pregunta 2*',
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
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: TextField(
                            controller: controller.txtPreguntaDos,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sub-pregunta 3*',
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
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: TextField(
                            controller: controller.txtPreguntaTres,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    // if (controller.txtNombre.text.isNotEmpty &&
                    //     controller.txtDatePicker.text.isNotEmpty &&
                    //     controller.txtPassword.text.isNotEmpty &&
                    //     controller.dropdownvalueZona != 'Selecciona una zona') {
                    //   final password = controller
                    //       .encryptPassword(controller.txtPassword.text);
                    //   final datos = {
                    //     'nombreCompleto': controller.txtNombre.text,
                    //     'userName': controller.txtUsername.text,
                    //     'password': password,
                    //     'zonaUsuario': controller.dropdownvalueZona,
                    //     'fechaNacimiento': controller.txtDatePicker.text,
                    //     'isAdmin': controller.isAdmin,
                    //     'isActive': controller.isActive,
                    //     'idUsuario': 1,
                    //   };
                    //   await controller.saveUsuario(datos);
                    //   Get.back();
                    //   Get.snackbar(
                    //     'Confirm',
                    //     'Usuario creado correctamente',
                    //     colorText: Colors.white,
                    //     backgroundColor: Colors.green,
                    //     maxWidth: 400,
                    //   );
                    // } else {
                    //   Get.snackbar(
                    //     'Error',
                    //     'No puedes dejar campos vacios',
                    //     colorText: Colors.white,
                    //     backgroundColor: Color(0xFFB00020),
                    //     maxWidth: 400,
                    //   );
                    // }
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
