import 'package:dumc_backoffice/controllers/zona_controller.dart';
import 'package:get/get.dart';

class ZonaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ZonaController(),
    );
  }
}
