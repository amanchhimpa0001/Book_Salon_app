import 'package:book_salon_app/controlers/app_controllers.dart';
import 'package:book_salon_app/controlers/authcontrolers.dart';
import 'package:book_salon_app/helpers/app_config.dart';
import 'package:book_salon_app/on_boarding/splash_scrren.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (context) => appController(),
        )
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: true,
          home: Splash_screen(),

          // initialRoute: Routesname.splash_screen,

          // onGenerateRoute: Routes.zgenerateRoutes,
        ),
        designSize: const Size(AppConfig.screenWidth, AppConfig.screenHeight),
      ),
    );
  }
}
