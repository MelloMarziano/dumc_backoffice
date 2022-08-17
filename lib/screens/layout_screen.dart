import 'package:animate_do/animate_do.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:dumc_backoffice/controllers/layout_controller.dart';
import 'package:dumc_backoffice/screens/camporee.dart';
import 'package:dumc_backoffice/screens/clubs_screen.dart';
import 'package:dumc_backoffice/screens/disciplina_screen.dart';
import 'package:dumc_backoffice/screens/evaluation_screen.dart';
import 'package:dumc_backoffice/screens/home_screen.dart';
import 'package:dumc_backoffice/screens/quiz_screen.dart';
import 'package:dumc_backoffice/screens/user_screen.dart';
import 'package:dumc_backoffice/screens/zonas_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            toggleTitle: 'Cerrar',
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
                text: 'Camporee',
                icon: Icons.insert_invitation,
                onPressed: () {
                  _.changeSelected('selectCamporee');
                  animateController.reset();
                  _.changeView(CamporeeScreen());
                },
                isSelected: _.selectedItem['selectCamporee']!,
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
                onPressed: () {
                  _.changeSelected('selectZone');
                  animateController.reset();
                  _.changeView(ZonaScreen());
                },
                isSelected: _.selectedItem['selectZone']!,
              ),
              CollapsibleItem(
                text: 'Clubes',
                icon: Icons.groups,
                onPressed: () {
                  _.changeSelected('selectClub');
                  animateController.reset();
                  _.changeView(ClubsScreen());
                },
                isSelected: _.selectedItem['selectClub']!,
              ),
              CollapsibleItem(
                text: 'Uniformidad',
                icon: Icons.military_tech,
                onPressed: () {
                  _.changeSelected('selectUniformidad');
                  animateController.reset();
                  _.changeView(EvaluationScreen());
                },
                isSelected: _.selectedItem['selectUniformidad']!,
              ),
              CollapsibleItem(
                text: 'Disciplina',
                icon: Icons.rule,
                onPressed: () {
                  _.changeSelected('selectDisciplina');
                  animateController.reset();
                  _.changeView(DisciplinaScreen());
                },
                isSelected: _.selectedItem['selectDisciplina']!,
              ),
            ],
            avatarImg: AssetImage('/logo/dumc.png'),
            title: 'Dumc ACD',
            onTitleTap: () {},
            body: Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color(0xFFc7daf0),
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
                  color: Color(0xFFf5f8fc),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFc7daf0),
                      blurRadius: 5,
                      spreadRadius: 0.01,
                      offset: Offset(3, 3),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Center(
                    child: FadeInLeft(
                      manualTrigger: true,
                      controller: (controller) =>
                          animateController = controller,
                      child: _.pageToShow,
                    ),
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
                color: Color(0xFFc7daf0),
                blurRadius: 20,
                spreadRadius: 0.01,
                offset: Offset(3, 3),
              ),
              BoxShadow(
                color: Color(0xFFc7daf0),
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
