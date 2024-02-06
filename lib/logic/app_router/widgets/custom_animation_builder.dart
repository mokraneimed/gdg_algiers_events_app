import 'package:flutter/material.dart';

PageRouteBuilder<dynamic> buildScreen({
  required Widget screen,
  Duration? duration,
}) {
  return PageRouteBuilder(
    transitionDuration: duration ?? const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
      return screen;
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(
          Tween(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).chain(
            CurveTween(curve: Curves.ease),
          ),
        ),
        child: child,
      );
    },
  );
}
