import 'package:flutter/material.dart';
import 'package:flutter_cat/screen/home_screen.dart';

void main() async {
  runApp(const FlutterCat());
}

class FlutterCat extends StatelessWidget {
  const FlutterCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
