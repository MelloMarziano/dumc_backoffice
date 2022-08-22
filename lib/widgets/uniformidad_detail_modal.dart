import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';

import 'package:dumc_backoffice/controllers/uniformidad_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

class UniformidadDetailModal extends StatefulWidget {
  final String nombreClub;
  final String tipoClub;

  ScreenshotController screenshotController = ScreenshotController();

  UniformidadDetailModal(
      {super.key, required this.nombreClub, required this.tipoClub});

  @override
  State<UniformidadDetailModal> createState() => _UniformidadDetailModalState();
}

class _UniformidadDetailModalState extends State<UniformidadDetailModal> {
  Future<String> saveImage(Uint8List bytes) async {
    //await [Permission.storage].request();
    final result = await ImageGallerySaver.saveImage(bytes);
    return result['filePath'];
  }

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
                                IconButton(
                                  onPressed: () async {
                                    final image = await widget
                                        .screenshotController
                                        .capture()
                                        .then((Uint8List? value) {
                                      final _base64 = base64Encode(value!);
                                      final anchor = AnchorElement(
                                          href:
                                              'data:application/octet-stream;base64,$_base64')
                                        ..download =
                                            "${widget.nombreClub}-uniformidad-${DateTime.now().year}.jpg"
                                        ..target = 'blank';

                                      document.body!.append(anchor);
                                      anchor.click();
                                      anchor.remove();
                                    });
                                  },
                                  icon: Icon(Icons.download),
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
                            height: MediaQuery.of(context).size.height * 0.8,
                            width: MediaQuery.of(context).size.width * 0.63,
                            color: Colors.white,
                            padding: const EdgeInsets.all(20),
                            //color: Colors.grey.shade200,
                            child: SingleChildScrollView(
                              child: Screenshot(
                                controller: widget.screenshotController,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 15,
                                  ),
                                  color: Colors.white,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 14,
                                            vertical: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'ASOCIACION CENTRAL DOMINICANA, DEPARTAMENTO DE JOVENES',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle:
                                                            const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      'Comisión de Disciplina, Uniformidad, Marcha y Civismo (DUMC)',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle:
                                                            const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      'Formulario Oficial de Evaluación de Uniformidad',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle:
                                                            const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(20),
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: 80,
                                                      width: 100,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        controller
                                                            .uniformidadEvaluada
                                                            .first
                                                            .puntosTotales
                                                            .toString(),
                                                        style:
                                                            GoogleFonts.poppins(
                                                          textStyle:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: 18,
                                                      width: 100,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        'PUNTUACION',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          textStyle:
                                                              const TextStyle(
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
                                              MainAxisAlignment.start,
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
                                            const SizedBox(
                                              width: 100,
                                            ),
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
                                              controller.uniformidadEvaluada
                                                  .first.zona
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
                                              width: 100,
                                            ),
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
                                              controller.uniformidadEvaluada
                                                  .first.evaluador
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
                                              MainAxisAlignment.start,
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
                                              controller.uniformidadEvaluada
                                                  .first.ninos
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
                                              width: 30,
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
                                              controller.uniformidadEvaluada
                                                  .first.ninas
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
                                              width: 30,
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
                                              (controller.uniformidadEvaluada
                                                          .first.ninos +
                                                      controller
                                                          .uniformidadEvaluada
                                                          .first
                                                          .ninas)
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
                                              width: 100,
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
                                              controller.uniformidadEvaluada
                                                  .first.dirigentesM
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
                                              width: 30,
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
                                              controller.uniformidadEvaluada
                                                  .first.dirigentesF
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
                                              width: 30,
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
                                              (controller.uniformidadEvaluada
                                                          .first.dirigentesM +
                                                      controller
                                                          .uniformidadEvaluada
                                                          .first
                                                          .dirigentesF)
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
                                              width: 100,
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
                                              (controller.uniformidadEvaluada
                                                          .first.dirigentesM +
                                                      controller
                                                          .uniformidadEvaluada
                                                          .first
                                                          .dirigentesF +
                                                      controller
                                                          .uniformidadEvaluada
                                                          .first
                                                          .ninos +
                                                      controller
                                                          .uniformidadEvaluada
                                                          .first
                                                          .ninas)
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
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.285,
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
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.285,
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
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              alignment: Alignment.centerLeft,
                                              height: 30,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.285,
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
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              alignment: Alignment.centerLeft,
                                              height: 30,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.285,
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
                                          controller.uniformidadEvaluada.first
                                              .disenoUno,
                                          10,
                                        ),
                                        preguntasRespuestas(
                                          context,
                                          '- Pantalones: Sin pinzas y con 2 bolsillos sin Tapa',
                                          controller.uniformidadEvaluada.first
                                              .disenoDos,
                                          5,
                                        ),
                                        preguntasRespuestas(
                                          context,
                                          '- Falda corte A: debajo de las rodillas con plisado',
                                          controller.uniformidadEvaluada.first
                                              .disenoTres,
                                          5,
                                        ),
                                        preguntasRespuestas(
                                          context,
                                          '- Zapatos negros cerrados Formales',
                                          controller.uniformidadEvaluada.first
                                              .disenoCuatro,
                                          5,
                                        ),
                                        preguntasRespuestas(
                                          context,
                                          '- Medias 3/4 (Niños y dirigentes negras. / Niñas blancas)',
                                          controller.uniformidadEvaluada.first
                                              .disenoCinco,
                                          5,
                                        ),
                                        preguntasRespuestas(
                                          context,
                                          '- Correa negra Conquistadores / Dirigentes',
                                          controller.uniformidadEvaluada.first
                                              .disenoSeis,
                                          5,
                                        ),
                                        preguntasRespuestas(
                                          context,
                                          '- Boina de conquistadores o GM para dirigentes',
                                          controller.uniformidadEvaluada.first
                                              .disenoSiete,
                                          5,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              alignment: Alignment.centerLeft,
                                              height: 30,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.285,
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
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              alignment: Alignment.centerLeft,
                                              height: 30,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.285,
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
                                        preguntasRespuestas(
                                          context,
                                          '- Triángulo / Globo / Arco del club local',
                                          controller.uniformidadEvaluada.first
                                              .insigniasBasicasUno,
                                          5,
                                        ),
                                        preguntasRespuestas(
                                          context,
                                          '- Pañoleta',
                                          controller.uniformidadEvaluada.first
                                              .insigniasBasicasDos,
                                          3,
                                        ),
                                        preguntasRespuestas(
                                          context,
                                          '- Anillo',
                                          controller.uniformidadEvaluada.first
                                              .insigniasBasicasTres,
                                          2,
                                        ),
                                        preguntasRespuestas(
                                          context,
                                          '- Insignia de la ACD',
                                          controller.uniformidadEvaluada.first
                                              .insigniasBasicasCuatro,
                                          5,
                                        ),
                                        preguntasRespuestas(
                                          context,
                                          '- Insignia de Cargo de Dirigentes',
                                          controller.uniformidadEvaluada.first
                                              .insigniasBasicasCinco,
                                          5,
                                        ),
                                        preguntasRespuestas(
                                          context,
                                          '- Cordón de mando y galón de liderazgo (Charretera)',
                                          controller.uniformidadEvaluada.first
                                              .insigniasBasicasSeis,
                                          5,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              alignment: Alignment.centerLeft,
                                              height: 30,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.285,
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
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              alignment: Alignment.centerLeft,
                                              height: 30,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.285,
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
                                        preguntasRespuestas(
                                          context,
                                          '- Distintivo de Clases Actual',
                                          controller.uniformidadEvaluada.first
                                              .insigniasClasesUno,
                                          5,
                                        ),
                                        preguntasRespuestas(
                                          context,
                                          '- Botón de Clases Investidas',
                                          controller.uniformidadEvaluada.first
                                              .insigniasClasesDos,
                                          5,
                                        ),
                                        preguntasRespuestas(
                                          context,
                                          '- Galonera de Clases Investidas (Rango)',
                                          controller.uniformidadEvaluada.first
                                              .insigniasClasesTres,
                                          5,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              alignment: Alignment.centerLeft,
                                              height: 30,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.285,
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
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              alignment: Alignment.centerLeft,
                                              height: 30,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.285,
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
                                        preguntasRespuestas(
                                          context,
                                          '- Banda de Especialidades',
                                          controller.uniformidadEvaluada.first
                                              .bandaEspecialidadesUno,
                                          3,
                                        ),
                                        preguntasRespuestas(
                                          context,
                                          '- Triángulo Banda / Octágono Banda',
                                          controller.uniformidadEvaluada.first
                                              .bandaEspecialidadesDos,
                                          2,
                                        ),
                                        preguntasRespuestas(
                                          context,
                                          '- 4 Especialidades mínimas',
                                          controller.uniformidadEvaluada.first
                                              .bandaEspecialidadesTres,
                                          5,
                                        ),
                                        preguntasRespuestas(
                                          context,
                                          '- Bandera Nacional',
                                          controller.uniformidadEvaluada.first
                                              .bandaEspecialidadesCuatro,
                                          5,
                                        ),
                                        preguntasRespuestas(
                                          context,
                                          '- Distintivo de Nombre',
                                          controller.uniformidadEvaluada.first
                                              .bandaEspecialidadesCinco,
                                          5,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 200,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.25,
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                border: Border.all(),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'FALTAS GRAVES',
                                                    style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'Por cada falta grave se restará al club 5 puntos.\nSe considerarán faltas graves a las acciones definidas\ncomo no permitidas.',
                                                    style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                height: 200,
                                                decoration: BoxDecoration(
                                                  border: Border.all(),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Checkbox(
                                                          value: controller
                                                                  .uniformidadEvaluada
                                                                  .first
                                                                  .faltaGraveUno
                                                                  .toString()
                                                                  .length >
                                                              1,
                                                          onChanged:
                                                              (bool? value) {
                                                            // controller.changeValueEvidencia(value);
                                                          },
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          'Uniformes Sucios',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            textStyle:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Checkbox(
                                                          value: controller
                                                                  .uniformidadEvaluada
                                                                  .first
                                                                  .faltaGraveDos
                                                                  .toString()
                                                                  .length >
                                                              1,
                                                          onChanged:
                                                              (bool? value) {
                                                            // controller.changeValueEvidencia(value);
                                                          },
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          'Uso inadecuado de insignias y botones.',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            textStyle:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Checkbox(
                                                          value: controller
                                                                  .uniformidadEvaluada
                                                                  .first
                                                                  .faltaGraveTres
                                                                  .toString()
                                                                  .length >
                                                              1,
                                                          onChanged:
                                                              (bool? value) {
                                                            // controller.changeValueEvidencia(value);
                                                          },
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          'Uso de prendas no avaladas por la iglesia\n(Cadenas, aretes, guillos, pulsas, etc.).',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            textStyle:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Checkbox(
                                                          value: controller
                                                                  .uniformidadEvaluada
                                                                  .first
                                                                  .faltaGraveCuatro
                                                                  .toString()
                                                                  .length >
                                                              1,
                                                          onChanged:
                                                              (bool? value) {
                                                            // controller.changeValueEvidencia(value);
                                                          },
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          'Decir mentiras respecto a la uniformidad',
                                                          style: GoogleFonts
                                                              .poppins(
                                                            textStyle:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Observaciones',
                                            style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: 300,
                                            child: Text(
                                              controller.uniformidadEvaluada
                                                  .first.observaciones,
                                              maxLines: 10,
                                              softWrap: true,
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
          width: MediaQuery.of(context).size.width * 0.285,
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
          width: MediaQuery.of(context).size.width * 0.285,
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
