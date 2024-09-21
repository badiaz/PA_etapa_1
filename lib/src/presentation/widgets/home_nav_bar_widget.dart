import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarjetas_app/src/di/dependency_provider.dart';
import 'package:tarjetas_app/src/presentation/widgets/widgets.dart';

class HomeNavbarWidget extends StatelessWidget {
  const HomeNavbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0.0,
      right: 0.0,
      left: 0.0,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Hero(
            tag: 'navBar',
            child: ClipPath(
              clipper: NavBarClipper(),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: CustomPaint(
                  size: Size(size.width, size.height * 0.1),
                  painter: CurvedNavBarPainter(),
                ),
              ),
            ),
          ),
          Positioned(
            top: -30,
            right: size.width * 0.5 - 40,
            left: size.width * 0.5 - 40,
            child: CustomRoundedButton(
                tooltipText: 'Add note',
                icon: CupertinoIcons.add,
                onPressed: () {
                  DependencyProvider.of(context)
                      .cardsBloc
                      .updateColorSelection(1);
                  Navigator.pushNamed(
                    context,
                    '/form',
                    arguments: (card: null, isEditMode: false),
                  );
                }),
          ),
          const Positioned(
            bottom: 30.0,
            right: 40.0,
            child: Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
          ),
          const Positioned(
              bottom: 30.0,
              left: 40.0,
              child: Icon(
                CupertinoIcons.circle_grid_3x3_fill,
                color: Colors.grey,
              )),
        ],
      ),
    );
  }
}
