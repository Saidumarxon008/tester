import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tester/homepage.dart';
import 'package:tester/theme/constant.dart';
import 'package:tester/theme/theme.dart';
import 'package:tester/todo.dart';
late Box<ToDo> textBox;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLightTheme = prefs.getBool(SPref.isLight) ?? true;
  await Hive.initFlutter();
  Hive.registerAdapter(ToDoAdapter());
  textBox = await Hive.openBox("textBox");
  runApp(
    AppStart(
      isLightTeme: isLightTheme,
    ),
  );
}

class AppStart extends StatelessWidget {
  const AppStart({super.key, required this.isLightTeme});

  final bool isLightTeme;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(isLightTheme: isLightTeme),
      ),
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeProvider.themeData(),
            home: const HomePage(),
          );
        });
  }
}
