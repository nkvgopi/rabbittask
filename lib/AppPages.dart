

import 'package:get/get.dart';
import 'package:rabbittask/HomeScreen/homeScreen.dart';
import 'package:rabbittask/HomeScreen/home_page_binding.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.Onboard,
      page: () => HomeScreen(),
      // binding: AppPageBinding(),
      binding: HomePageBinding(),
      // binding: BindingsBuilder((){
      //   Get.lazyPut<OnboardScreencontroller>(() => OnboardScreencontroller());
      // }
      // ),
    ),

  ];
}


class AppRoutes {
  static const String Onboard = '/';


}