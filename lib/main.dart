import 'package:flutter/material.dart';
import 'package:flutter_map/animationparalex.dart';
import 'package:flutter_map/paralexscrolling.dart';
import 'package:flutter_map/splash.dart';
import 'Custom-infowindow.dart';
import 'GoogleMapPolygon.dart';
import 'Googlemap_polilines.dart';
import 'Googlemapflutter.dart';
import 'Map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
