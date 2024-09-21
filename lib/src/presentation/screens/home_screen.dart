import 'package:flutter/material.dart';
import 'package:tarjetas_app/src/presentation/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(children: [
            HomeHeaderWidget(),
            CardsListStreamWidget(),
          ]),
          HomeNavbarWidget(),
        ],
      ),
    );
  }
}
