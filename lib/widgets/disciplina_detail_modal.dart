import 'package:dumc_backoffice/controllers/disciplina_controller.dart';

import 'package:dumc_backoffice/themes/colores.dart';
import 'package:dumc_backoffice/widgets/disciplina_detail_datatable.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DisciplinaModalCreateModal extends StatefulWidget {
  final String nombreClub;

  const DisciplinaModalCreateModal({super.key, required this.nombreClub});

  @override
  _DisciplinaModalCreateModalState createState() =>
      _DisciplinaModalCreateModalState();
}

class _DisciplinaModalCreateModalState
    extends State<DisciplinaModalCreateModal> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DisciplinaController>(
      init: DisciplinaController(),
      builder: (controller) => AlertDialog(
        //title: Text('Cupertino Dialog'),
        content: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
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
                  Row(
                    children: [
                      Text(
                        'Detalle de Disciplina para el club: ',
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
                      Text(
                        widget.nombreClub,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.red,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 600,
                width: double.infinity,
                child: const DisciplinaDEtailTableDataTableWidget(
                  titleTable: [
                    'Evaluador',
                    'Codigo de falta',
                    'Detalle',
                    'Evidencia',
                    'Fecha',
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
