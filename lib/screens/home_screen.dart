import 'package:dumc_backoffice/controllers/home_controller.dart';
import 'package:dumc_backoffice/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:responsive_ui/responsive_ui.dart';

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
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarWidget(
              title: 'Dashboard',
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(right: 20),
              child: Responsive(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.spaceAround,
                children: [
                  Div(
                    divison: const Division(
                      colXS: 12,
                      colS: 2,
                      offsetS: 1,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            spreadRadius: 0.01,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                      height: 150,
                    ),
                  ),
                  Div(
                    divison: const Division(
                      colXS: 12,
                      colS: 2,
                      offsetS: 1,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            spreadRadius: 0.01,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                      height: 150,
                    ),
                  ),
                  Div(
                    divison: const Division(
                      colXS: 12,
                      colS: 2,
                      offsetS: 1,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            spreadRadius: 0.01,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                      height: 150,
                    ),
                  ),
                  Div(
                    divison: const Division(
                      colXS: 12,
                      colS: 2,
                      offsetS: 1,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            spreadRadius: 0.01,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                      height: 150,
                    ),
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
