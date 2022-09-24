import 'package:base_flutter/presentation/router/app_router.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Base flutter"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(AppRouter.sample);
            },
            child: const Text(
              "Navigate to Sample",
              style: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.amber,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
