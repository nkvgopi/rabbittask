
import 'package:get/get.dart';
import 'package:rabbittask/HomeScreen/homeScreen.dart';
import 'package:rabbittask/HomeScreen/home_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreen());
    Get.put(HomeController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}