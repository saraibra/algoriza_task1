import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task1/screens/on_boarding/on_boarding_screen.dart';
import 'package:task1/shared/material_color.dart';
import 'package:task1/shared/network/cashe_helper.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent
  // ));
  await CasheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       scaffoldBackgroundColor: Colors.white,
        primarySwatch: buildMaterialColor(Colors.white),
        appBarTheme: AppBarTheme(
          elevation: 0
        ),
      ),
      home: const OnBoardingScreen(),
    );
  }
}


