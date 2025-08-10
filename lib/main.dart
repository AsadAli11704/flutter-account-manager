import 'package:flutter/material.dart';
import 'package:account_manager/screens/account_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Account Manager",
      home: AccountScreen(), //
    );
  }
}
