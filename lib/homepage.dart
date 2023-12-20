import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tester/theme/constant.dart';
import 'package:tester/theme/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          themeProvider.toggleThemeData();
        },
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: themeProvider.themeMode().gradientColors!)),

      ),
    );
  }
}
