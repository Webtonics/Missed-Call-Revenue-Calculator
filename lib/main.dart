import 'package:flutter/material.dart';

import 'features/RoICalc/home.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true
      ),
      title: 'ROI Calculator',
      
      home: const MainPage(),
    );
  }
}