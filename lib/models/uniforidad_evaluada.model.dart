import 'package:cloud_firestore/cloud_firestore.dart';

class UniformidadEvaluadaModel {
  late String? uniformidadEvaluadaId;
  late Timestamp fechaDeEvaluacion;
  late String evaluador;
  late bool evidencia;
  late String club;
  late String zona;
  late String observaciones;
  late int puntosTotales;
  late int ninos;
  late int ninas;
  late int dirigentesM;
  late int dirigentesF;
  late int totalDirectores;
  late int totalInvestidos;
  late int disenoUno;
  late int disenoDos;
  late int disenoTres;
  late int disenoCuatro;
  late int disenoCinco;
  late int disenoSeis;
  late int disenoSiete;
  late int insigniasBasicasUno;
  late int insigniasBasicasDos;
  late int insigniasBasicasTres;
  late int insigniasBasicasCuatro;
  late int insigniasBasicasCinco;
  late int insigniasBasicasSeis;
  late int insigniasClasesUno;
  late int insigniasClasesDos;
  late int insigniasClasesTres;
  late int bandaEspecialidadesUno;
  late int bandaEspecialidadesDos;
  late int bandaEspecialidadesTres;
  late int bandaEspecialidadesCuatro;
  late int bandaEspecialidadesCinco;
  late int faltaGraveUno;
  late int faltaGraveDos;
  late int faltaGraveTres;
  late int faltaGraveCuatro;

  UniformidadEvaluadaModel({
    this.uniformidadEvaluadaId,
    required this.fechaDeEvaluacion,
    required this.evaluador,
    required this.evidencia,
    required this.club,
    required this.zona,
    required this.observaciones,
    required this.puntosTotales,
    required this.ninos,
    required this.ninas,
    required this.dirigentesM,
    required this.dirigentesF,
    required this.totalDirectores,
    required this.totalInvestidos,
    required this.disenoUno,
    required this.disenoDos,
    required this.disenoTres,
    required this.disenoCuatro,
    required this.disenoCinco,
    required this.disenoSeis,
    required this.disenoSiete,
    required this.insigniasBasicasUno,
    required this.insigniasBasicasDos,
    required this.insigniasBasicasTres,
    required this.insigniasBasicasCuatro,
    required this.insigniasBasicasCinco,
    required this.insigniasBasicasSeis,
    required this.insigniasClasesUno,
    required this.insigniasClasesDos,
    required this.insigniasClasesTres,
    required this.bandaEspecialidadesUno,
    required this.bandaEspecialidadesDos,
    required this.bandaEspecialidadesTres,
    required this.bandaEspecialidadesCuatro,
    required this.bandaEspecialidadesCinco,
    required this.faltaGraveUno,
    required this.faltaGraveDos,
    required this.faltaGraveTres,
    required this.faltaGraveCuatro,
  });

  UniformidadEvaluadaModel.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    uniformidadEvaluadaId = documentSnapshot.id;
    fechaDeEvaluacion = documentSnapshot['fechaDeEvaluacion'] ??
        DateTime.now().millisecondsSinceEpoch;
    evaluador = documentSnapshot['evaluador'] ?? '';
    evidencia = documentSnapshot['evidencia'] ?? false;
    observaciones = documentSnapshot['observaciones'] ?? '';
    club = documentSnapshot['club'] ?? '';
    zona = documentSnapshot['zona'] ?? '';
    puntosTotales = documentSnapshot['puntosTotales'] ?? 0;
    ninos = documentSnapshot['niños'] ?? 0;
    ninas = documentSnapshot['niñas'] ?? 0;
    dirigentesM = documentSnapshot['dirigentesM'] ?? 0;
    dirigentesF = documentSnapshot['dirigentesF'] ?? 0;
    totalDirectores = documentSnapshot['totalDirectores'] ?? 0;
    totalInvestidos = documentSnapshot['totalInvestidos'] ?? 0;
    disenoUno = documentSnapshot['diseñoUno'] ?? 0;
    disenoDos = documentSnapshot['diseñoDos'] ?? 0;
    disenoTres = documentSnapshot['diseñoTres'] ?? 0;
    disenoCuatro = documentSnapshot['diseñoCuatro'] ?? 0;
    disenoCinco = documentSnapshot['diseñoCinco'] ?? 0;
    disenoSeis = documentSnapshot['diseñoSeis'] ?? 0;
    disenoSiete = documentSnapshot['diseñoSiete'] ?? 0;
    insigniasBasicasUno = documentSnapshot['insigniaBasicasUno'] ?? 0;
    insigniasBasicasDos = documentSnapshot['insigniaBasicasDos'] ?? 0;
    insigniasBasicasTres = documentSnapshot['insigniaBasicasTres'] ?? 0;
    insigniasBasicasCuatro = documentSnapshot['insigniaBasicasCuatro'] ?? 0;
    insigniasBasicasCinco = documentSnapshot['insigniaBasicasCinco'] ?? 0;
    insigniasBasicasSeis = documentSnapshot['insigniaBasicasSeis'] ?? 0;
    insigniasClasesUno = documentSnapshot['insigniaClasesUno'] ?? 0;
    insigniasClasesDos = documentSnapshot['insigniaClasesDos'] ?? 0;
    insigniasClasesTres = documentSnapshot['insigniaClasesTres'] ?? 0;
    bandaEspecialidadesUno = documentSnapshot['bandaEspecialidadesUno'] ?? 0;
    bandaEspecialidadesDos = documentSnapshot['bandaEspecialidadesDos'] ?? 0;
    bandaEspecialidadesTres = documentSnapshot['bandaEspecialidadesTres'] ?? 0;
    bandaEspecialidadesCuatro =
        documentSnapshot['bandaEspecialidadesCuatro'] ?? 0;
    bandaEspecialidadesCinco =
        documentSnapshot['bandaEspecialidadesCinco'] ?? 0;
    faltaGraveUno = documentSnapshot['faltaGraveUno'] ?? 0;
    faltaGraveDos = documentSnapshot['fataGraveDos'] ?? 0;
    faltaGraveTres = documentSnapshot['faltaGraveTres'] ?? 0;
    faltaGraveCuatro = documentSnapshot['faltaGraveCuatro'] ?? 0;
  }
}
