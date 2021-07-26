import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
class Mytheme{

static   ThemeData lightTheme(BuildContext context)=> ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: GoogleFonts.poppins().fontFamily,
  cardColor: Colors.white,
  canvasColor: creamcolor,
  accentColor: darkbluishcolor,
  buttonColor: darkbluishcolor,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme:Theme.of(context).textTheme,
    ),
   );

// darktheme
static   ThemeData  darkTheme(BuildContext context)=> ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkcream,
      accentColor: Colors.white,
      buttonColor: lightbluishcolor,
      appBarTheme: AppBarTheme(
      color: Colors.black,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
      textTheme:Theme.of(context).textTheme.copyWith(headline6: context.textTheme.headline6.copyWith(color:Colors.white))
      )
);
 static Color creamcolor=Color(0xfff5f5f5);
 static Color darkcream=Vx.gray900;
 static Color darkbluishcolor=Color(0xff403b58);
 static Color lightbluishcolor=Vx.indigo500;
}