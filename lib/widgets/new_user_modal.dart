import 'package:dumc_backoffice/controllers/user_controller.dart';
import 'package:dumc_backoffice/themes/colores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class UserCreateModal extends StatefulWidget {
  @override
  _UserCreateModalState createState() => _UserCreateModalState();
}

class _UserCreateModalState extends State<UserCreateModal> {
  var rango = [
    'Amigo',
    'Compañero',
    'Explorador',
    'Orientador',
    'Viajero',
    'Guia',
    'Guia Mayor',
  ];

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
    return GetBuilder<UserController>(
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
                    'Crear usuario nuevo',
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
                'Nombre',
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
                'Fecha de nacimiento',
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
                  controller: controller.txtDatePicker,
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1970, 8),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null) {
                      controller.writeInputDatePicker(picked);
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
              const SizedBox(
                height: 10,
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
                            'Zona',
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
                                value: controller.dropdownvalueZona.toString(),
                                isExpanded:
                                    true, //make true to take width of parent widget
                                underline: Container(),
                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: zona.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  controller.changeZona(newValue!);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rango',
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
                                value: controller.dropdownvalue.toString(),
                                isExpanded: true,
                                underline: Container(),
                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: rango.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) async {
                                  await controller.changeRango(newValue!);
                                },
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
                height: 10,
              ),
              Text(
                'Contraseña',
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
                  controller: controller.txtPassword,
                  obscureText: !controller.noShowPasswordLogin,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        controller.showPassword();
                      },
                      icon: (controller.noShowPasswordLogin)
                          ? Icon(Icons.visibility_off, color: dumncVerde)
                          : Icon(
                              Icons.visibility,
                              color: Colors.grey,
                            ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Administrador',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Color(0xFF0d2d52),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      CupertinoSwitch(
                        value: controller.isAdmin,
                        onChanged: (value) {
                          controller.changeIsAdmin(value);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
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
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (controller.txtNombre.text.isNotEmpty &&
                        controller.txtDatePicker.text.isNotEmpty &&
                        controller.txtPassword.text.isNotEmpty) {
                      Get.snackbar(
                        'Confirm',
                        'Usuario creado correctamente',
                        colorText: Colors.white,
                        backgroundColor: dumncVerde,
                      );
                    } else {
                      Get.snackbar(
                        'Confirm',
                        'Usuario creado correctamente',
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
