import 'package:dumc_backoffice/controllers/disciplina_controller.dart';
import 'package:get/get.dart';

class DisciplinaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DisciplinaController(),
    );
  }
}
