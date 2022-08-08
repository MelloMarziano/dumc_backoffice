import 'package:cloud_firestore/cloud_firestore.dart';

class UsuariosModel {
  late String? usuarioId;
  late num idUsuario;
  late String nombreCompleto;
  late String userName;
  late String zonaUsuario;
  late bool isActive;
  late bool isAdmin;
  late String fechaNacimiento;

  UsuariosModel({
    this.usuarioId,
    required this.idUsuario,
    required this.nombreCompleto,
    required this.userName,
    required this.zonaUsuario,
    required this.isActive,
    required this.isAdmin,
    required this.fechaNacimiento,
  });

  UsuariosModel.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    usuarioId = documentSnapshot.id;
    nombreCompleto = documentSnapshot['nombreCompleto'] ?? '';
    userName = documentSnapshot['userName'] ?? '';
    zonaUsuario = documentSnapshot['zonaUsuario'] ?? '';
    fechaNacimiento = documentSnapshot['fechaNacimiento'] ?? '';
    isActive = documentSnapshot['isActive'] ?? false;
    isAdmin = documentSnapshot['isAdmin'] ?? false;
    idUsuario = documentSnapshot['idUsuario'] ?? 0;
  }
}
