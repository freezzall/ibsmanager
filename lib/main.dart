import 'package:flutter/material.dart';
import 'package:ibsmanager/page/splashpage.dart';
import 'package:ibsmanager/providers/employeeProvider.dart';
import 'package:ibsmanager/providers/mapsProvider.dart';
import 'package:ibsmanager/providers/performanceProvider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(
      MultiProvider(
          providers: providers,
          child: MyApp()
      )
  );
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => PerformanceProvider()),
  ChangeNotifierProvider(create: (_) => mapsProvider()),
  ChangeNotifierProvider(create: (_) => employeeProvider()),
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //primarySwatch: Colors.grey,
      ),
      home: SplashPage(),
    );
  }
}

