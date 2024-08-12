import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'DataBase/habit_database.dart';
import 'Provider/Theme_Provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HabitDatabase.initialize();
  await HabitDatabase().saveFirstLaunchData();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HabitDatabase(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) =>  SplashPage(),
        '/home': (context) =>  HomePage(),
      },
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}