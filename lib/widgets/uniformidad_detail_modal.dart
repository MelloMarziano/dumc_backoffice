import 'package:dumc_backoffice/controllers/uniformidad_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UniformidadDetailModal extends StatefulWidget {
  final String nombreClub;
  final String tipoClub;

  const UniformidadDetailModal(
      {super.key, required this.nombreClub, required this.tipoClub});

  @override
  State<UniformidadDetailModal> createState() => _UniformidadDetailModalState();
}

class _UniformidadDetailModalState extends State<UniformidadDetailModal> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UniformidadController>(
        init: UniformidadController(),
        builder: (controller) {
          controller.fillData(widget.nombreClub, widget.tipoClub);
          return AlertDialog(
            content: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.9,
              child: controller.uniformidadEvaluada.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
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
                            Row(
                              children: [
                                Text(
                                  'Evaluacion de Uniformidad para el club: ',
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      color: Color(0xFF0d2d52),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                              ],
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
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.79,
                            width: MediaQuery.of(context).size.width * 0.6,
                            padding: const EdgeInsets.all(20),
                            //color: Colors.grey.shade200,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black,
                                    ),
                                    child: Text(
                                      widget.tipoClub,
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'ASOCIACION CENTRAL DOMINICANA, DEPARTAMENTO DE JOVENES',
                                                style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Comisión de Disciplina, Uniformidad, Marcha y Civismo (DUMC)',
                                                style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Formulario Oficial de Evaluación de Uniformidad',
                                                style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            border: Border.all(),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                              bottomRight: Radius.circular(20),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height: 80,
                                                width: 100,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                  ),
                                                ),
                                                child: Text(
                                                  controller.uniformidadEvaluada
                                                      .first.puntosTotales
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                height: 18,
                                                width: 100,
                                                decoration: const BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(20),
                                                  ),
                                                ),
                                                child: Text(
                                                  'PUNTUACION',
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Nombre del Club:',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        widget.nombreClub,
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        'Zona:',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        controller
                                            .uniformidadEvaluada.first.zona
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        'Juez:',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        controller
                                            .uniformidadEvaluada.first.evaluador
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Niños:',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        controller
                                            .uniformidadEvaluada.first.ninos
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Niñas:',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        controller
                                            .uniformidadEvaluada.first.ninas
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Total:',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        (controller.uniformidadEvaluada.first
                                                    .ninos +
                                                controller.uniformidadEvaluada
                                                    .first.ninas)
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Dirigentes M:',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        controller.uniformidadEvaluada.first
                                            .dirigentesM
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Dirigentes F:',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        controller.uniformidadEvaluada.first
                                            .dirigentesF
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Total:',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        (controller.uniformidadEvaluada.first
                                                    .dirigentesM +
                                                controller.uniformidadEvaluada
                                                    .first.dirigentesF)
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Total General:',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        (controller.uniformidadEvaluada.first
                                                    .dirigentesM +
                                                controller.uniformidadEvaluada
                                                    .first.dirigentesF +
                                                controller.uniformidadEvaluada
                                                    .first.ninos +
                                                controller.uniformidadEvaluada
                                                    .first.ninas)
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 30,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.289,
                                        color: Colors.black,
                                        child: Text(
                                          'CRITERIO',
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 30,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.289,
                                        color: Colors.black,
                                        child: Text(
                                          'VALOR GENERAL: 100 PTOS',
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        alignment: Alignment.centerLeft,
                                        height: 30,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.289,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF6F737C),
                                          border: Border(
                                            right: BorderSide(),
                                          ),
                                        ),
                                        child: Text(
                                          '1. Diseño:',
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        alignment: Alignment.centerLeft,
                                        height: 30,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.289,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF6F737C),
                                          border: Border(
                                            left: BorderSide(),
                                          ),
                                        ),
                                        child: Text(
                                          '40 Ptos',
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  preguntasRespuestas(
                                    context,
                                    '- Camisas: con Galones y 2 Bolsillos con Tapa',
                                    controller
                                        .uniformidadEvaluada.first.disenoUno,
                                    10,
                                  ),
                                  preguntasRespuestas(
                                    context,
                                    '- Pantalones: Sin pinzas y con 2 bolsillos sin Tapa',
                                    controller
                                        .uniformidadEvaluada.first.disenoDos,
                                    5,
                                  ),
                                  preguntasRespuestas(
                                    context,
                                    '- Falda corte A: debajo de las rodillas con plisado',
                                    controller
                                        .uniformidadEvaluada.first.disenoTres,
                                    5,
                                  ),
                                  preguntasRespuestas(
                                    context,
                                    '- Zapatos negros cerrados Formales',
                                    controller
                                        .uniformidadEvaluada.first.disenoCuatro,
                                    5,
                                  ),
                                  preguntasRespuestas(
                                    context,
                                    '- Medias 3/4 (Niños y dirigentes negras. / Niñas blancas)',
                                    controller
                                        .uniformidadEvaluada.first.disenoCinco,
                                    5,
                                  ),
                                  preguntasRespuestas(
                                    context,
                                    '- Correa negra Conquistadores / Dirigentes',
                                    controller
                                        .uniformidadEvaluada.first.disenoSeis,
                                    5,
                                  ),
                                  preguntasRespuestas(
                                    context,
                                    '- Boina de conquistadores o GM para dirigentes',
                                    controller
                                        .uniformidadEvaluada.first.disenoSiete,
                                    5,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        alignment: Alignment.centerLeft,
                                        height: 30,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.289,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF6F737C),
                                          border: Border(
                                            right: BorderSide(),
                                          ),
                                        ),
                                        child: Text(
                                          '2. Insignias Básicas:',
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        alignment: Alignment.centerLeft,
                                        height: 30,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.289,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF6F737C),
                                          border: Border(
                                            left: BorderSide(),
                                          ),
                                        ),
                                        child: Text(
                                          '25 Ptos',
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        alignment: Alignment.centerLeft,
                                        height: 30,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.289,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF6F737C),
                                          border: Border(
                                            right: BorderSide(),
                                          ),
                                        ),
                                        child: Text(
                                          '3. Insignias de Clase:',
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        alignment: Alignment.centerLeft,
                                        height: 30,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.289,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF6F737C),
                                          border: Border(
                                            left: BorderSide(),
                                          ),
                                        ),
                                        child: Text(
                                          '15 Ptos',
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        alignment: Alignment.centerLeft,
                                        height: 30,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.289,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF6F737C),
                                          border: Border(
                                            right: BorderSide(),
                                          ),
                                        ),
                                        child: Text(
                                          '4. Banda de Especialidades:',
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        alignment: Alignment.centerLeft,
                                        height: 30,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.289,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF6F737C),
                                          border: Border(
                                            left: BorderSide(),
                                          ),
                                        ),
                                        child: Text(
                                          '20 Ptos',
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          );
        });
  }

  Row preguntasRespuestas(
    BuildContext context,
    String pregunta,
    int valorPregunta,
    int valorCampo,
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          height: 40,
          width: MediaQuery.of(context).size.width * 0.289,
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: Colors.grey),
              bottom: BorderSide(color: Colors.grey),
              top: BorderSide(color: Colors.grey),
              right: BorderSide(color: Colors.black),
            ),
          ),
          child: Text(
            pregunta,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          height: 40,
          width: MediaQuery.of(context).size.width * 0.289,
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: Colors.black),
              bottom: BorderSide(color: Colors.grey),
              top: BorderSide(color: Colors.grey),
              right: BorderSide(color: Colors.grey),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    valorPregunta.toString(),
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '/',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    valorCampo.toString(),
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
