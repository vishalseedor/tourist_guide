import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomLoginClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    double w = size.width;
    double h = size.height;
    final path = Path();
    // path.lineTo(h, w); // 2.point
    path.moveTo(0, size.height * 0.12);
    // path.lineTo(0, h);
    // path.lineTo(h, w);
    // path.lineTo(w, h);
    // path.lineTo(w, 0);
    // path.quadraticBezierTo(h, w * 0.5, w * 0.5, h);
    // path.quadraticBezierTo(size.width * 0.25, size.height * 0.875,
    //     size.width * 0.5, size.height * -0.12);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.8,
        size.width * 1.0, size.height * 0.14);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    // path.lineTo(w, 0);
    // path.quadraticBezierTo(w * -0.5, h + h * 0.5, w - 10, h - 10);

    // path.lineTo(0, h); // 5. point path
    // path.lineTo(w, 0);
    // // path.lineTo(h, w);
    //
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
