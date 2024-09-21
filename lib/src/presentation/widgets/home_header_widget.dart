import 'package:flutter/material.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        SizedBox(
          height: size.height * 0.2,
          child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Quick Notes',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: size.width * 0.08),
                ),
              )),
        ),
        Positioned(
            right: 20.0,
            child: SafeArea(
              child: Image.asset(
                'assets/images/avatar.png',
                width: 100.0,
              ),
            ))
      ],
    );
  }
}
