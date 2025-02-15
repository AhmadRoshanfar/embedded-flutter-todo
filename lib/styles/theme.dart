import 'package:flutter/material.dart';

ThemeData selectTheme({required bool isLight}) {
  /* Colors */
  Color kColorPrimary = isLight ? Colors.deepOrange : Colors.green;
  Color kColorAccent = isLight ? Colors.orange : Colors.red;
  Color kButtonTextColor = isLight ? Colors.white : Colors.black;

  Color kNavigationBarIconColor =
      isLight ? Colors.green : const Color.fromARGB(255, 56, 219, 176);

  Color kScaffoldBgColor =
      isLight
          ? const Color.fromARGB(255, 228, 228, 228)
          : const Color.fromARGB(255, 6, 2, 34);

  Color kCardBgColor = isLight ? Colors.white : Colors.red;
  /* Floating Button Colors */
  Color kFloatingButtonColor =
      isLight
          ? const Color.fromARGB(255, 2, 138, 54)
          : const Color.fromARGB(255, 17, 108, 147);
  Color kFloatingButtonHoverColor =
      isLight
          ? const Color.fromARGB(255, 13, 193, 124)
          : const Color.fromARGB(255, 5, 72, 100);
  Color kFloatingButtonIconColor =
      isLight
          ? const Color.fromARGB(255, 233, 247, 237)
          : const Color.fromARGB(255, 210, 219, 221);

  Color kInputFieldHoverColor =
      isLight ? const Color.fromARGB(255, 69, 233, 217) : Colors.yellow;

  Color kIconButtonColor =
      isLight ? Colors.white : const Color.fromARGB(255, 218, 78, 17);
  Color kIconButtonHoverColor =
      isLight
          ? const Color.fromARGB(255, 32, 169, 96)
          : const Color.fromARGB(255, 237, 210, 7);

  Color kDataTableBgColor =
      isLight
          ? const Color.fromARGB(255, 174, 171, 171)
          : const Color.fromARGB(255, 11, 25, 47);
  Color kDataTableBgHoverColor =
      isLight
          ? const Color.fromARGB(255, 90, 154, 93)
          : const Color.fromARGB(255, 171, 181, 197);
  Color kDataTableHeaderBgColor =
      isLight
          ? const Color.fromARGB(255, 196, 164, 117)
          : const Color.fromARGB(255, 3, 18, 42);
  Color kDataTableTextColor =
      isLight
          ? const Color.fromARGB(255, 33, 24, 24)
          : const Color.fromARGB(255, 200, 198, 182);

  /* Text */
  TextTheme textTheme = const TextTheme(
    displayLarge: TextStyle(color: Colors.red),
  );

  /* Input Fileds */
  InputDecorationTheme intputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
    filled: true,
    fillColor: Colors.grey.withOpacity(0.1),
    hoverColor: kInputFieldHoverColor,
  );

  /* Elevated Button */
  ElevatedButtonThemeData elevationButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(kColorAccent),
      foregroundColor: WidgetStateProperty.all<Color>(kButtonTextColor),
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      ),
      shape: WidgetStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    ),
  );

  /* Floating Action Button */
  FloatingActionButtonThemeData floatingActionButtonTheme =
      FloatingActionButtonThemeData(
        backgroundColor: kFloatingButtonColor,
        foregroundColor: kFloatingButtonIconColor,
        iconSize: 22,
        hoverColor: kFloatingButtonHoverColor,
      );

  /* Icon Button */
  IconButtonThemeData iconButtonTheme = IconButtonThemeData(
    style: ButtonStyle(
      iconSize: WidgetStateProperty.all<double>(30),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.hovered)) {
          return kIconButtonHoverColor;
        }
        return null;
      }),
      foregroundColor: WidgetStateProperty.all<Color>(kIconButtonColor),
    ),
  );

  /* Data Table */
  DataTableThemeData dataTableTheme = DataTableThemeData(
    // dataRowColor: MaterialStateProperty.resolveWith<Color?>(
    //     (Set<MaterialState> states) {
    //   if (states.contains(MaterialState.selected)) {
    //     return Colors.red;
    //   } else if (states.contains(MaterialState.hovered)) {
    //     return Colors.green;
    //   }
    //   return null; // Use the default value.
    // }),
    headingRowColor: WidgetStateProperty.all<Color>(kDataTableHeaderBgColor),
    dividerThickness: 3,

    // dataRowMinHeight: 30,
    headingTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: kDataTableTextColor,
    ),
    dataTextStyle: TextStyle(fontSize: 18, color: kDataTableTextColor),
  );

  ExpansionTileThemeData expansionTileThemeData = const ExpansionTileThemeData(
    collapsedShape: RoundedRectangleBorder(side: BorderSide.none),
    shape: RoundedRectangleBorder(side: BorderSide.none),
  );

  Color kNavigationRailBg =
      isLight
          ? const Color.fromARGB(255, 108, 109, 103)
          : const Color.fromARGB(255, 8, 11, 54);

  NavigationRailThemeData navigationRailTheme = NavigationRailThemeData(
    backgroundColor: kNavigationRailBg,
    elevation: 5,
    indicatorColor: kNavigationBarIconColor,
    indicatorShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    // indicatorShape: //TODO: Change Shape,
    labelType: NavigationRailLabelType.all,

    selectedIconTheme: IconThemeData(color: kIconButtonColor, size: 30),
    unselectedIconTheme: IconThemeData(color: kIconButtonColor, size: 30),
    selectedLabelTextStyle: const TextStyle(
      fontSize: 14,
      letterSpacing: 2,
      height: 2,
    ),
    unselectedLabelTextStyle: TextStyle(
      color: Colors.grey.shade400,
      fontSize: 12,
      letterSpacing: 2,
      height: 2,
    ),
  );

  CardThemeData cardTheme = CardThemeData(color: kCardBgColor);

  return ThemeData(
    brightness: isLight ? Brightness.light : Brightness.dark,
    useMaterial3: true,
    primaryColor: kColorPrimary,
    /* Buttons */
    floatingActionButtonTheme: floatingActionButtonTheme,
    elevatedButtonTheme: elevationButtonTheme,
    iconButtonTheme: iconButtonTheme,
    textTheme: textTheme,
    inputDecorationTheme: intputDecorationTheme,
    dataTableTheme: dataTableTheme,
    scaffoldBackgroundColor: kScaffoldBgColor,
    navigationRailTheme: navigationRailTheme,
    expansionTileTheme: expansionTileThemeData,
    cardTheme: cardTheme,
  );
}
