import 'package:animate_do/animate_do.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:dumc_backoffice/controllers/layout_controller.dart';
import 'package:dumc_backoffice/screens/home_screen.dart';
import 'package:dumc_backoffice/screens/quiz_screen.dart';
import 'package:dumc_backoffice/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'dart:math' as math show pi;

class LayoutScreen extends StatelessWidget {
  late AnimationController animateController;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    //_items = _generateItems;
    //_headline = _items.firstWhere((item) => item.isSelected).text;
    return GetBuilder<LayoutController>(
      init: LayoutController(),
      builder: (_) => Scaffold(
        body: Container(
          child: CollapsibleSidebar(
            isCollapsed: true,
            items: [
              CollapsibleItem(
                text: 'Dashboard',
                icon: Icons.assessment,
                onPressed: () {
                  _.changeSelected('selectDashboard');
                  animateController.reset();
                  _.changeView(HomeScreen());
                },
                isSelected: _.selectedItem['selectDashboard']!,
              ),
              CollapsibleItem(
                text: 'Usuarios',
                icon: Icons.face,
                onPressed: () {
                  _.changeSelected('selectUser');
                  animateController.reset();
                  _.changeView(UserScreen());
                },
                isSelected: _.selectedItem['selectUser']!,
              ),
              CollapsibleItem(
                text: 'Zonas',
                icon: Icons.map,
                onPressed: () {},
                isSelected: _.selectedItem['selectZone']!,
              ),
              CollapsibleItem(
                text: 'Clubes',
                icon: Icons.groups,
                onPressed: () {},
                isSelected: _.selectedItem['selectClub']!,
              ),
              CollapsibleItem(
                text: 'Evaluacion',
                icon: Icons.quiz,
                onPressed: () {
                  _.changeSelected('selectQuiz');
                  animateController.reset();
                  _.changeView(QuizScreen());
                },
                isSelected: _.selectedItem['selectQuiz']!,
              ),
              CollapsibleItem(
                text: 'Settings',
                icon: Icons.settings,
                onPressed: () {},
                isSelected: _.selectedItem['selectSettings']!,
              ),
            ],
            avatarImg: AssetImage('/logo/dumc.png'),
            title: 'Dumc ACD',
            onTitleTap: () {},
            body: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.blueGrey[50],
              padding: const EdgeInsets.only(
                right: 10,
                top: 10,
                bottom: 10,
                left: 10,
              ),
              child: Container(
                height: double.infinity,
                width: (MediaQuery.of(context).size.width * 1) - 0.10,
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
                child: Center(
                  child: FadeInLeft(
                    manualTrigger: true,
                    controller: (controller) => animateController = controller,
                    child: _.pageToShow,
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.black,
            selectedTextColor: Colors.white,
            textStyle:
                const TextStyle(fontSize: 15, fontStyle: FontStyle.normal),
            titleStyle: const TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
            ),
            toggleTitleStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            sidebarBoxShadow: const [
              BoxShadow(
                color: Colors.transparent,
                blurRadius: 20,
                spreadRadius: 0.01,
                offset: Offset(3, 3),
              ),
              BoxShadow(
                color: Colors.transparent,
                blurRadius: 50,
                spreadRadius: 0.01,
                offset: Offset(3, 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
