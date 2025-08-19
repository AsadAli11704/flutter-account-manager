import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:account_manager/providers/account_provider.dart';
import 'package:account_manager/screens/account_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AccountProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Account Manager',
      home: AccountScreen(),
    );
  }
}
