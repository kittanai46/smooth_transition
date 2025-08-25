library smooth_transition;

import 'package:flutter/material.dart';

enum PageTransitionType { fade, scale, rotate, slideLeft, slideRight, slideUp, slideDown }

class PageTransition extends PageRouteBuilder {
  final Widget child;
  final PageTransitionType type;
  final Duration duration;

  PageTransition({
    required this.child,
    required this.type,
    this.duration = const Duration(milliseconds: 450),
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionDuration: duration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            switch (type) {
              case PageTransitionType.fade:
                return FadeTransition(opacity: animation, child: child);
              case PageTransitionType.scale:
                return ScaleTransition(scale: animation, child: child);
              case PageTransitionType.rotate:
                return RotationTransition(turns: animation, child: child);
              case PageTransitionType.slideLeft:
                return SlideTransition(
                  position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                      .animate(animation),
                  child: child,
                );
              case PageTransitionType.slideRight:
                return SlideTransition(
                  position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
                      .animate(animation),
                  child: child,
                );
              case PageTransitionType.slideUp:
                return SlideTransition(
                  position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                      .animate(animation),
                  child: child,
                );
              case PageTransitionType.slideDown:
                return SlideTransition(
                  position: Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
                      .animate(animation),
                  child: child,
                );
            }
          },
        );
}
