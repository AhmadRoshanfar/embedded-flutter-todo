import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class BuildSwitchTheme extends StatelessWidget {
  const BuildSwitchTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child:
          Provider.of<ThemeProvider>(context).themeMode == Modes.light
              ? IconButton(
                icon: const Icon(Icons.sunny, color: Colors.red),
                onPressed: () {
                  context.read<ThemeProvider>().toggleTheme();
                },
              )
              : IconButton(
                onPressed: () {
                  context.read<ThemeProvider>().toggleTheme();
                },
                icon: const Icon(Icons.nightlight_round_sharp),
              ),
    );
  }
}
