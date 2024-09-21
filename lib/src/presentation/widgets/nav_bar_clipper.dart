import 'package:flutter/material.dart';

class NavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 40);
    path.quadraticBezierTo(0, 0, 40, 0);
    path.lineTo(size.width * 0.5 - 40, 0);
    path.arcToPoint(
      Offset(size.width * 0.5 + 40, 0),
      radius: const Radius.circular(40),
      clockwise: false,
    );
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
