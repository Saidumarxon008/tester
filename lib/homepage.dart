import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
              center: const Alignment(-0.8, -0.3),
              colors: themeProvider.themeMode().gradientColors!),
        ),
        child: Stack(fit: StackFit.expand, children: [
          SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateTime.now().hour.toString(),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    SizedBox(
                      width: size.width * .2,
                      child: const Divider(
                        height: 0,
                        thickness: 1,
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      DateTime.now().minute.toString(),
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      "Light Dark\nPersonal\nSwitch",
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Container(
                      width: size.width * .2,
                      height: size.width * .2,
                      decoration: BoxDecoration(
                        color: themeProvider.themeMode().switchColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.nights_stay_outlined,
                        size: 50,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      width: size.width * .2,
                      child: const Divider(
                        thickness: 1,
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      "30\u00B0C",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: AppColors.white),
                    ),
                    Text(
                      "Clear",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.white),
                    ),
                    Text(
                      DateFormat("EEEE").format(DateTime.now()),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.white),
                    ),
                    Text(
                      DateFormat("MMM  d").format(DateTime.now()),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              )),
        ]),
      ),
    );
  }
}