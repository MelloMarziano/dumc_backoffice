import 'package:dumc_backoffice/controllers/home_controller.dart';
import 'package:dumc_backoffice/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Container(
        padding: EdgeInsets.only(
          left: 20,
        ),
        child: Column(
          children: const [
            AppBarWidget(
              title: 'Dashboard',
            ),
          ],
        ),
      ),
    );
  }
}
