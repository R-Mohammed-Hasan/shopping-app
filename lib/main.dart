import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/home.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping App',
        theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 255, 255),
              primary: const Color.fromARGB(255, 255, 224, 98),
            ),
            textTheme: const TextTheme(
                titleLarge: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
                titleMedium: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                bodySmall: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
            useMaterial3: true,
            inputDecorationTheme: const InputDecorationTheme(
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                prefixIconColor: Color.fromRGBO(119, 119, 119, 1))),
        home: const HomePage(),
      ),
    );
  }
}
