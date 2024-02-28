import 'package:flutter/material.dart';
import 'package:gamev2/controllers/navigation_controller.dart';
import 'package:gamev2/utils/theme.dart';
import 'package:get/get.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'controllers/create_new_game_controller.dart';
import 'pages/home_screen/home_screen.dart';
import 'utils/local_strings.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  // Initiating Flutter
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  await windowManager.setFullScreen(true);

  Size screenSize = WidgetsBinding.instance.window.physicalSize;
  double width = screenSize.width;
  double height = screenSize.height;
  
  WindowOptions windowOptions = WindowOptions(
    //fullScreen: true,
    size: Size(width, height),
    center: true,
    backgroundColor: Colors.transparent,
    //skipTaskbar: true,
    titleBarStyle: TitleBarStyle.hidden,
    //alwaysOnTop: true,
     windowButtonVisibility: false
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  // Initiating SQL usage
  sqfliteFfiInit();
  initGetx();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GameV2',
      theme: kThemeData,
      locale: const Locale('fr'), // Get.deviceLocale
      translations: LocalStrings(),
      fallbackLocale: const Locale('en', 'US'),
      home: const HomeScreen(),
    );
  }
}

void initGetx() {
  Get.put(CreateNewGameController());
  CreateNewGameController.to.init();
  Get.put(DashboardController());
}
