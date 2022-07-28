import 'package:data_table_2/data_table_2.dart';
import 'package:dumc_backoffice/controllers/user_controller.dart';
import 'package:dumc_backoffice/themes/colores.dart';
import 'package:dumc_backoffice/widgets/app_bar.dart';
import 'package:dumc_backoffice/widgets/datatable.dart';
import 'package:dumc_backoffice/widgets/evaluation_datatable.dart';
import 'package:dumc_backoffice/widgets/new_user_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class EvaluationScreen extends StatelessWidget {
  const EvaluationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (_) => Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            const AppBarWidget(
              title: 'Evaluaciones',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // MouseRegion(
                //   cursor: SystemMouseCursors.click,
                //   child: Tooltip(
                //     message: 'Descargar listado de miembros del DUMC',
                //     child: ElevatedButton(
                //       onPressed: () {},
                //       style: ElevatedButton.styleFrom(
                //         fixedSize: const Size(50, 50),
                //         primary: dumncVerde,
                //       ),
                //       child: Icon(Icons.download),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   width: 20,
                // ),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Buscar por nombre',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    _showCupertinoDialog(context, _);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 50),
                    primary: dumncVerde,
                  ),
                  child: Text('Nueva evaluacion'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 600,
              //decoration: BoxDecoration(border: Border.all()),
              child: const EvaluationDataTableWidget(
                titleTable: [
                  'Evaluacion',
                  'Puntuacion',
                  'Action',
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showCupertinoDialog(BuildContext context, controller) async {
    // List of items in our dropdown menu
    showDialog(
        context: context,
        builder: (context) {
          return UserCreateModal();
        });
  }
}
