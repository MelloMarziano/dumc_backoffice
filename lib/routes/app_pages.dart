import 'package:dumc_backoffice/binding/layout_binding.dart';
import 'package:dumc_backoffice/screens/layout_screen.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPAges {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.LAYOUT,
      page: () => LayoutScreen(),
      binding: LayoutBinding(),
    )
  ];
}
