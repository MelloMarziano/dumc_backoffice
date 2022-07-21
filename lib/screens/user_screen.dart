import 'package:data_table_2/data_table_2.dart';
import 'package:dumc_backoffice/controllers/user_controller.dart';
import 'package:dumc_backoffice/themes/colores.dart';
import 'package:dumc_backoffice/widgets/app_bar.dart';
import 'package:dumc_backoffice/widgets/datatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

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
              title: 'Usuarios',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Tooltip(
                    message: 'Descargar listado de miembros del DUMC',
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(50, 40),
                        primary: dumncVerde,
                      ),
                      child: Icon(Icons.download),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 300,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 40),
                    primary: dumncVerde,
                  ),
                  child: Text('Nuevo usuario'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 700,
              //decoration: BoxDecoration(border: Border.all()),
              child: const DataTableWidget(
                titleTable: [
                  'Zona',
                  'Nombre',
                  'Admin',
                  'Activo',
                  'Action',
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
