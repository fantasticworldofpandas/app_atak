import 'package:app_atak/providers/search_provider.dart';
import 'package:app_atak/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchProvider(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}