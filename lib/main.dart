import 'package:demoapp/Core/Store.dart';
import 'package:demoapp/Pages/Cartpage.dart';
import 'package:demoapp/Pages/Login_page.dart';
import 'package:demoapp/Utils/MyRoutes.dart';
import 'package:demoapp/Widget/Themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'Pages/Home_page.dart';


void main() {
  runApp(
      VxState(store:MyStore(),
        child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      // theme: Mytheme.lightTheme(context),
      themeMode: ThemeMode.system,
      theme: Mytheme.lightTheme(context),
      darkTheme: Mytheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoutes,
      routes: {
        // "/" :(context)=> Homepage(),
        "/" :(context)=> LoginPage(),
        MyRoutes.homeRoutes :(context)=> Homepage(),
        MyRoutes.loginRoutes:(context)=> LoginPage(),
        MyRoutes.cartRoutes:(context)=> Cartpage()
      },
    );
  }
}
