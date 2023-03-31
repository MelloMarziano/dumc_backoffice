import 'package:dumc_backoffice/controllers/report_controller.dart';
import 'package:dumc_backoffice/widgets/report_datatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/app_bar.dart';

class ReportScreen extends StatelessWidget {
  var zona = [
    'Zona 1',
    'Zona 2',
    'Zona 3',
    'Zona 4',
    'Zona 5',
    'Zona 6',
    'Zona 7',
    'Zona 8',
    'Zona 9',
  ];

  var tipoClub = [
    'Aventureros',
    'Conquistadores',
    'Guias Mayores',
  ];
  ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportController>(
      init: ReportController(),
      builder: (controller) => Container(
        padding: const EdgeInsets.only(
          left: 20,
        ),
        child: Column(
          children: [
            const AppBarWidget(
              title: 'Reportes',
            ),
            // _.clubesList.bindStream(_.getClubesSnapshot('Zona 6', ''));
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 600,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
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
                          const SizedBox(
                            height: 5,
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const <BoxShadow>[
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
                              padding: const EdgeInsets.only(
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
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tipo club',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Color(0xFF0d2d52),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const <BoxShadow>[
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
                              padding: const EdgeInsets.only(
                                right: 5,
                                left: 10,
                              ),
                              child: DropdownButton(
                                // Initial Value
                                value:
                                    controller.dropdownvaluetipoClub.toString(),
                                isExpanded:
                                    true, //make true to take width of parent widget
                                underline: Container(),
                                // Down Arrow Icon
                                icon: const Icon(Icons.keyboard_arrow_down),

                                // Array list of items
                                items: tipoClub.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  controller.changeTipoClub(newValue!);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 600,
              width: double.infinity,

              //decoration: BoxDecoration(border: Border.all()),
              child: const SingleChildScrollView(
                child: ReportDataTableWidget(
                  titleTable: [
                    '',
                    '',
                    '',
                  ],
                ),
                // child: ReportDataTableWidget(
                //   titleTable: [
                //     'Division',
                //     'Nombre',
                //     'Cordinador',
                //   ],
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
