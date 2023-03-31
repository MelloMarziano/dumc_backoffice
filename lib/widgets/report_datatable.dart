import 'package:data_table_2/data_table_2.dart';
import 'package:dumc_backoffice/themes/colores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportDataTableWidget extends StatelessWidget {
  final List<String> titleTable;

  const ReportDataTableWidget({super.key, required this.titleTable});

  @override
  Widget build(BuildContext context) {
    return DataTable2(
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
      rows: List<DataRow>.generate(
        10,
        (index) => DataRow(
          cells: [
            DataCell(Text('Cambita')),
            DataCell(Text('Zona 6')),
            DataCell(Text('Eliu Ortega')),
          ],
        ),
      ),
    );
  }
}
