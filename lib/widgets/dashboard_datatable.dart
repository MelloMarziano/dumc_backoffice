import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dumc_backoffice/controllers/disciplina_controller.dart';
import 'package:dumc_backoffice/controllers/home_controller.dart';
import 'package:dumc_backoffice/themes/colores.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardDataTableWidget extends StatelessWidget {
  final List<String> titleTable;

  const DashboardDataTableWidget({
    super.key,
    required this.titleTable,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => DataTable(
        columnSpacing: 12,
        horizontalMargin: 12,
        showBottomBorder: true,
        border: TableBorder(
          //top: const BorderSide(color: Colors.black),
          bottom: BorderSide(color: Colors.grey[300]!),
          left: BorderSide(color: Colors.grey[300]!),
          right: BorderSide(color: Colors.grey[300]!),
          //verticalInside: BorderSide(color: Colors.grey[300]!),
          horizontalInside: const BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        headingRowColor: MaterialStateColor.resolveWith(
          (states) => dumncVerde.withOpacity(0.9),
        ),
        columns: titleTable.map((e) {
          return DataColumn(
            label: Text(
              e,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
            ),
          );
        }).toList(),
        rows: controller.buildList(context),
      ),
    );
  }
}
