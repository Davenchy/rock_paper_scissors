import 'package:flutter/material.dart';

class InnerRoundsClipper extends StatelessWidget {
  const InnerRoundsClipper({
    Key? key,
    required this.child,
    this.roundsHeight = 10,
  }) : super(key: key);

  final Widget child;
  final double roundsHeight;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: InnerRoundsClipperPath(roundsHeight: roundsHeight),
      child: child,
    );
  }
}

class InnerRoundsClipperPath extends CustomClipper<Path> {
  const InnerRoundsClipperPath({this.roundsHeight = 10});

  final double roundsHeight;

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);

    path.quadraticBezierTo(
      size.width / 2,
      size.height - roundsHeight,
      size.width,
      size.height,
    );

    path.lineTo(size.width, 0);

    path.quadraticBezierTo(size.width / 2, roundsHeight, 0, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
