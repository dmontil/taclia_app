
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:taclia_app/src/pages/auth/home_login.dart';
import 'package:taclia_app/src/pages/auth/login.dart';
import 'package:taclia_app/src/pages/auth/recoverpass.dart';
import 'package:taclia_app/src/pages/auth/register.dart';
import 'package:taclia_app/src/pages/menu/addEventPage.dart';

import 'pages/menu/calendarPage.dart';
import 'services/local_storage_service.dart';
import 'services/user_service.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        hintColor: Colors.black54,
        primaryColor: Colors.orange,
        canvasColor: Colors.transparent,
        fontFamily: "Montserrat",
      ),
      initialRoute:  'homeLogin',
      routes: {
        'addEvent': (BuildContext context) => AddEventPage(),
        'testPage': (BuildContext context) => CalendarPage(),
        'homeLogin': (BuildContext context) => HomeLogin(),
        'loginPage' : (BuildContext context) => LoginPage(),
        'registerPage' : (BuildContext context) => RegisterPage(),
        'recoverPage' : (BuildContext context) => RecoverLoginPage(),

      },

    );
  }
}
Future setupLocator() async {
  GetIt locator = GetIt.I;
  var instance = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(instance);
  locator.registerSingleton<UserService>(UserService());

}




