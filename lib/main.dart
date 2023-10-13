import 'package:doctorappointment/config.dart';
import 'package:doctorappointment/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

AppTheme _appTheme = AppTheme.fromType(ThemeType.light);

void main() async {
  await GetStorage.init();

  Get.put(AppController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Language(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'), // tran
      title: "Doctor appoiment",
      theme: AppTheme.fromType(ThemeType.light).themeData,
      darkTheme: AppTheme.fromType(ThemeType.dark).themeData,
      themeMode: ThemeService().theme,
      getPages: appRoute.getPages,
      home: HomeScreen(),
    );
  }
}
