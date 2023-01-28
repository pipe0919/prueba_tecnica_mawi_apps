import 'package:flutter/material.dart';
import 'package:prueba_tecnica_mawi_apps/pages/home_page.dart';

class Routes extends StatefulWidget {
  const Routes({super.key});

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba Tecnica',
      initialRoute: '/home',
      routes: {
        "/home": (BuildContext context) => HomePage(),
      },
    );
  }
}
