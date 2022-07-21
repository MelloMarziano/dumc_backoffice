import 'package:dumc_backoffice/controllers/layout_controller.dart';
import 'package:get/get.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LayoutController(),
    );
  }
}
