import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food/views/food/detail_page.dart';
import 'package:food/views/food/food_page.dart';
import 'package:food/views/food/pizza_page.dart';
import 'package:food/views/main_Home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food',
      initialRoute: '/',
      routes: {
        '/': (context) => const MainHomePage(),
        '/food': (context) => const FoodPage(),
        '/details': (context) => const DetailsPage(),
        '/pizza': (context) => const PizzaPage()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
