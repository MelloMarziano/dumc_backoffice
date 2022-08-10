import 'package:dumc_backoffice/screens/camporee.dart';
import 'package:dumc_backoffice/screens/disciplina_screen.dart';
import 'package:dumc_backoffice/screens/evaluation_screen.dart';
import 'package:dumc_backoffice/screens/home_screen.dart';
import 'package:dumc_backoffice/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LayoutController extends GetxController {
  late Widget pageToShow;
  Map<String, bool> selectedItem = {
    'selectDashboard': true,
    'selectCamporee': false,
    'selectUser': false,
    'selectZone': false,
    'selectClub': false,
    'selectEvaluation': false,
    'selectQuiz': false,
    'selectDisciplina': false,
  };

  @override
  void onInit() async {
    super.onInit();
    changeView(HomeScreen());
  }

  changeSelected(term) {
    selectedItem.forEach((key, value) {
      selectedItem[key] = false;
    });
    selectedItem[term] = true;
    update();
  }

  changeView(Widget pages) {
    pageToShow = pages;
    update();
    print(pageToShow);
  }
}
