import 'package:commons/commons.dart';
import 'package:commons_dependencies/search_provider.dart';
import 'package:core/app/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SearchProvider(),
        child: MaterialApp.router(
          routerDelegate: Modular.routerDelegate,
          routeInformationParser: Modular.routeInformationParser,
        ));
  }
}
