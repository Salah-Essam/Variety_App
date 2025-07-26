import 'package:flutter/material.dart';
import 'package:variety_app/presentation/features/Home/view/ProfileScreen.dart';
import 'package:variety_app/presentation/widgets/AppButton.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        child: Column(
          children: [
            AppButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 250,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Bottom Sheet", style: TextStyle(fontSize: 32)),
                          SizedBox(height: 16),
                          SizedBox(
                            width: 150,
                            child: AppButton(
                              onPressed: () => Navigator.pop(context),
                              title: "Close",
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              title: "Open Bottom Sheet",
            ),
          ],
        ),
      ),
    );
  }
}
