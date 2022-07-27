import 'package:dumc_backoffice/controllers/clubs_controller.dart';
import 'package:get/get.dart';

class ClubsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ClubsController(),
    );
  }
}
