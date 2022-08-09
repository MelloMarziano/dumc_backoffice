import 'package:dumc_backoffice/controllers/camporee_controllers.dart';
import 'package:get/get.dart';

class CamporeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CamporeeController(),
    );
  }
}
