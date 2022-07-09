import 'package:any_v_chagre_customer_app/presentation/controllers/lang/lang_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/config/app_colors.dart';
import 'app/config/constant.dart';
import 'app/routes/app_route.dart';
import 'app/routes/page_route.dart';
import 'app/services/local_storage.dart';
import 'app/util/dependency.dart';
import 'app/util/messages.dart';
import 'dart:ui' as ui;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyCreator.init();
  await initServices();
  RenderErrorBox.backgroundColor = Colors.transparent;
  RenderErrorBox.textStyle = ui.TextStyle(color: Colors.transparent);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.lightPurple,
    statusBarIconBrightness: Brightness.light, // For Android (dark icons)
    statusBarBrightness: Brightness.light, // For iOS (dark icons)
  ));

  //fetch all languages .json files and convert
  Map<String, Map<String, String>> languages =
  await Messages.getAllTranslations();
  runApp(MyApp(languages));
}

initServices() async {
  await Get.putAsync(() => LocalStorageService().init());
  Get.put(LangController(), permanent: true);
}



class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> languages;
  final store = Get.find<LocalStorageService>();
  MyApp(this.languages, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      /*navigatorObservers: [FirebaseHandler.observer],*/
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'US'),
      translations: Messages(languages: languages),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.LANDING_PAGE,
      getPages: Routes.getAllPages(),
      defaultTransition: Transition.topLevel,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
