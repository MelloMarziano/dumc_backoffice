import 'package:dumc_backoffice/controllers/clubs_controller.dart';
import 'package:dumc_backoffice/themes/colores.dart';
import 'package:dumc_backoffice/widgets/app_bar.dart';
import 'package:dumc_backoffice/widgets/clubes_datatable.dart';
import 'package:dumc_backoffice/widgets/new_club_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClubsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClubsController>(
      init: ClubsController(),
      builder: (_) => Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            const AppBarWidget(
              title: 'Clubes',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Tooltip(
                    message: 'Descargar listado de clubes',
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(50, 50),
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
                  child: Text('Nuevo club'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 600,
              //decoration: BoxDecoration(border: Border.all()),
              child: const ClubsDataTableWidget(
                titleTable: [
                  'Zona',
                  'Nombre',
                  'Director',
                  'Miembros Total',
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
          return ClubCreateModal();
        });
  }
}
