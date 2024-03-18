import 'package:flutter/material.dart';

class MyTheme{
  static Color black_color=Color(0xFF242424);
  static Color white_color=Colors.white;
  static Color gold_color=Color(0xFFB7935F);
  static Color yellow_color=Color(0xFFFACC1D);
  static Color navy_color=Color(0xFF141A2E);
  static Color lightGold_color=Color(0xFFB7935F);



  static ThemeData lightTheme = ThemeData(
    primaryColor: gold_color,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: black_color)
    ),
    primaryTextTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 30,fontWeight: FontWeight.bold,color: black_color
      ),
      headline4:TextStyle(
          fontSize: 20,fontWeight: FontWeight.bold,color: black_color
      ),
      headline5: TextStyle(
          fontSize: 20,color: black_color
      ),
      headline3: TextStyle(
          fontSize: 25,fontWeight:FontWeight.bold,color: black_color
      ),
      headline2: TextStyle(
          fontSize: 20,fontWeight:FontWeight.bold,color: gold_color
      ),
      subtitle2: TextStyle(
          fontSize: 20,fontWeight:FontWeight.bold,color: black_color
      ),
      subtitle1: TextStyle(
          fontSize: 20,fontWeight:FontWeight.bold,color: gold_color
      ),
      headline6: TextStyle(
          fontSize: 25,fontWeight:FontWeight.bold,color: white_color
      ),

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: black_color
    )
  );


  static ThemeData darkTheme = ThemeData(
      primaryColor: navy_color,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: white_color)
      ),
      primaryTextTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 30,fontWeight: FontWeight.bold,color: white_color
        ),
        headline4:TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold,color: white_color
        ),
        headline5: TextStyle(
            fontSize: 20,color: yellow_color
        ),
        headline3: TextStyle(
            fontSize: 25,fontWeight:FontWeight.bold,color: white_color
        ),
        headline2: TextStyle(
            fontSize: 20,fontWeight:FontWeight.bold,color: white_color
        ),
        subtitle2: TextStyle(
            fontSize: 20,fontWeight:FontWeight.bold,color: navy_color
        ),
        subtitle1: TextStyle(
            fontSize: 20,fontWeight:FontWeight.bold,color: yellow_color
        ),
        headline6: TextStyle(
            fontSize: 25,fontWeight:FontWeight.bold,color: yellow_color
        ),


      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: yellow_color
      )
  );
}
