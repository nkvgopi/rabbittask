import 'package:flutter/material.dart';
import 'package:rabbittask/HomeScreen/home_page_binding.dart';

import 'AppPages.dart';
import 'HomeScreen/homeScreen.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: HomePageBinding(),
      enableLog: true,
      initialRoute: AppRoutes.Onboard,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
    );
  }
}
