// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_todo/objectbox.dart';
import 'package:flutter_todo/provider/task_provider.dart';
import 'package:flutter_todo/provider/theme_provider.dart';
import 'package:flutter_todo/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'styles/theme.dart';
import 'package:flutter/services.dart';

// import 'package:bitsdojo_window/bitsdojo_window.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
  //   doWhenWindowReady(() {
  //     final win = appWindow;
  //     const initialSize = Size(1024, 640);
  //     win.minSize = initialSize;
  //     win.maximizeOrRestore();
  //     win.alignment = Alignment.center;
  //     win.title = "Diet";
  //     win.show();
  //   });
  // }

  WidgetsFlutterBinding.ensureInitialized();
  final objectBox = await ObjectBox.create();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight, // Change this for different orientations
  ]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => TaskProvider(objectBox)),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: selectTheme(isLight: false),
      themeMode:
          Provider.of<ThemeProvider>(context).themeMode == Modes.light
              ? ThemeMode.light
              : ThemeMode.dark,
      home: HomeScreen(),
    );
  }
}
