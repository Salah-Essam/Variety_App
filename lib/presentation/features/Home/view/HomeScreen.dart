import 'package:flutter/material.dart';
import 'package:variety_app/presentation/features/Home/view/ProfileScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String name = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, ProfileScreen.name);
            },
          ),
        ],
        title: Text(
          "Variety App",
          // style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        centerTitle: true,
        // backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
