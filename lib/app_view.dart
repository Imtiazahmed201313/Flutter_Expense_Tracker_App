import 'package:expense_tracker_app/screens/home/home_screens.dart';
import 'package:flutter/material.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          background: Colors.grey.shade100,
          onBackground: Colors.black,
          primary: Color(0xff00B2E7),
          secondary: Color(0xffE064F7),
          tertiary: Color(0xffff8D6C),
          outline: Colors.grey
        ),
      ),
      home: HomeScreen(),
    );
  }
}
