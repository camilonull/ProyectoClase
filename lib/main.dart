import 'package:calc_app/pages/home_page.dart';
import 'package:calc_app/providers/ui_provider.dart';
import 'package:calc_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => UIProvider())],
    child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: 'home',
      routes: {'home': (_) => const HomePage(),},
    );
  }
}
