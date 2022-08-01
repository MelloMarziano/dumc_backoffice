import 'package:data_table_2/data_table_2.dart';
import 'package:dumc_backoffice/themes/colores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataTableWidget extends StatelessWidget {
  final List<String> titleTable;

  const DataTableWidget({super.key, required this.titleTable});

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
            DataCell(Text('Zona 6')),
            DataCell(Text('Eliu Ortega')),
            DataCell(Text('Guia Mayor')),
            DataCell(
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(70, 20),
                  primary: Color(0xFFB00020),
                ),
                child: Text('Editar'),
              ),
            ),
            const DataCell(
              CupertinoSwitch(
                value: true,
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
          ],
        ),
      ),
    );
  }
}
