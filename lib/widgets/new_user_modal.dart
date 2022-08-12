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
    'Selecciona un rango',
    'Amigo',
    'Compañero',
    'Explorador',
    'Orientador',
    'Viajero',
    'Guia',
    'Guia Mayor',
  ];

  var zona = [
    'Selecciona una zona',
    'Zona 1',
    'Zona 2',
    'Zona 3',
    'Zona 4',
    'Zona 5',
    'Zona 6',
    'Zona 7',
    'Zona 8',
    'Zona 9',
    'Zona 10',
    'Invitado',
    'ACD'
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
                  const SizedBox(
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
                height: 10,
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
                            'Username',
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
                              controller: controller.txtUsername,
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
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                      ? const Icon(Icons.visibility_off,
                                          color: dumncVerde)
                                      : const Icon(
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
                        ],
                      ),
                    ),
                  ],
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
                          // const SizedBox(
                          //   height: 5,
                          // ),
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
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
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
                    width: 20,
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
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (controller.txtNombre.text.isNotEmpty &&
                        controller.txtDatePicker.text.isNotEmpty &&
                        controller.txtPassword.text.isNotEmpty &&
                        controller.dropdownvalueZona != 'Selecciona una zona') {
                      final password = controller
                          .encryptPassword(controller.txtPassword.text);
                      final datos = {
                        'nombreCompleto': controller.txtNombre.text,
                        'userName': controller.txtUsername.text,
                        'password': password,
                        'zonaUsuario': controller.dropdownvalueZona,
                        'fechaNacimiento': controller.txtDatePicker.text,
                        'isAdmin': controller.isAdmin,
                        'isActive': controller.isActive,
                        'idUsuario': 1,
                      };
                      await controller.saveUsuario(datos);
                      Get.back();
                      Get.snackbar(
                        'Confirm',
                        'Usuario creado correctamente',
                        colorText: Colors.white,
                        backgroundColor: Colors.green,
                        maxWidth: 400,
                      );
                    } else {
                      Get.snackbar(
                        'Error',
                        'No puedes dejar campos vacios',
                        colorText: Colors.white,
                        backgroundColor: Color(0xFFB00020),
                        maxWidth: 400,
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
