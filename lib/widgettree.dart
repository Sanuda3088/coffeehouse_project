import 'package:coffeehouse_project/home_page.dart';
import 'package:coffeehouse_project/welcome_page.dart';
import 'package:flutter/material.dart';
import 'auth.dart';


class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (contex, snapshot) {
        if (snapshot.hasData) {
          return  const HomePage();
        } else {
          return const WelcomePage();
        }
      },
    );
  }
}
