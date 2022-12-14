import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double defaultPaddingVertical = 50.0;
const double defaultPaddingHorizontal = 30.0;

const EdgeInsets defaultPadding = EdgeInsets.symmetric(
  vertical: defaultPaddingVertical,
  horizontal: defaultPaddingHorizontal,
);

const Color primaryColor = Color.fromRGBO(255, 22, 22, 1);
const Color errorColor = Color(0xFFBD4747);
const Color successColor = Color(0xFF54CB5E);

const List<Color> palette = [
  Color(0xFFFCFCFC),
  Color(0xFFF8F9FA),
  Color(0xFFE9ECEF),
  Color(0xFFDEE2E6),
  Color(0xFFCED4DA),
  Color(0xFFADB5BD),
  Color(0xFF6C757D),
  Color(0xFF495057),
  Color(0xFF343A40),
  Color(0xFF212529),
];

const thin = FontWeight.w100;
const extraLight = FontWeight.w200;
const light = FontWeight.w300;
const regular = FontWeight.w400;
const medium = FontWeight.w500;
const semiBold = FontWeight.w600;
const bold = FontWeight.w700;
const extraBold = FontWeight.w800;
const black = FontWeight.w900;

TextStyle poppins(double? fontSize, FontWeight? fontWeight, {Color? color}) => GoogleFonts.poppins(
      fontSize: fontSize ?? 12.0,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? palette.last,
    );

AppBarTheme appBarTheme = AppBarTheme(
  elevation: 0,
  color: Colors.transparent,
  titleTextStyle: GoogleFonts.poppins(
    color: palette[9],
    fontWeight: FontWeight.w600,
  ),
  centerTitle: true,
  iconTheme: IconThemeData(
    color: palette[9],
    size: 20,
  ),
);

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  border: const OutlineInputBorder(
    borderSide: BorderSide(color: primaryColor),
  ),
  contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
  iconColor: palette[6],
  helperMaxLines: 1,
  errorMaxLines: 1,
  labelStyle: poppins(12, regular),
  focusColor: primaryColor,
);

ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    textStyle: MaterialStateProperty.all(poppins(15, bold)),
    minimumSize: MaterialStateProperty.all(const Size.fromHeight(50.0)),
    backgroundColor: MaterialStateProperty.all(primaryColor),
  ),
);

OutlinedButtonThemeData outlinedButtonTheme = OutlinedButtonThemeData(
  style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all(primaryColor),
    textStyle: MaterialStateProperty.all(poppins(15, semiBold)),
    minimumSize: MaterialStateProperty.all(const Size.fromHeight(50.0)),
  ),
);

BottomNavigationBarThemeData navigationBarThemeData = BottomNavigationBarThemeData(
  selectedItemColor: primaryColor,
  unselectedItemColor: primaryColor,
  type: BottomNavigationBarType.shifting,
  showUnselectedLabels: false,
  selectedLabelStyle: poppins(10, regular),
);

ButtonThemeData buttonTheme = const ButtonThemeData();

ChipThemeData chipTheme = ChipThemeData(
  labelStyle: poppins(12, medium),
);

final ThemeData lightTheme = ThemeData(
  appBarTheme: appBarTheme,
  backgroundColor: primaryColor,
  brightness: Brightness.light,
  scaffoldBackgroundColor: palette[0],
  primaryColor: primaryColor,
  textTheme: GoogleFonts.poppinsTextTheme(
    TextTheme(
      displayLarge: poppins(35, bold),
      displayMedium: poppins(25, semiBold),
      titleLarge: poppins(25, semiBold),
      titleMedium: poppins(20, semiBold),
      titleSmall: poppins(12, medium),
      bodyLarge: poppins(17, regular),
      bodyMedium: poppins(14, regular),
      bodySmall: poppins(12, regular),
    ),
  ),
  inputDecorationTheme: inputDecorationTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  outlinedButtonTheme: outlinedButtonTheme,
  bottomNavigationBarTheme: navigationBarThemeData,
  buttonTheme: buttonTheme,
  chipTheme: chipTheme,
);
