import 'package:dumc_backoffice/controllers/camporee_controllers.dart';
import 'package:dumc_backoffice/widgets/camporee_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/colores.dart';
import '../widgets/app_bar.dart';

class CamporeeScreen extends StatelessWidget {
  const CamporeeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CamporeeController>(
      init: CamporeeController(),
      builder: (_) => Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          children: [
            const AppBarWidget(
              title: 'Camporees',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                  child: Text('Nuevo camporee'),
                ),
              ],
            ),
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
          return CamporeeCreateModal();
        });
  }
}
