import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:encrypt/encrypt.dart' as keyEnc;
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';

import '../models/users.model.dart';
import '../themes/colores.dart';

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

  showPassword() {
    noShowPasswordLogin = !noShowPasswordLogin;
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

    // return encrypted.base64;
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
              onPressed: () {},
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
              onPressed: () {},
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
