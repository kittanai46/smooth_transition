/// A Flutter package that provides smooth page transition animations.
///
/// This library allows you to easily add animated transitions between pages,
/// such as fade, scale, rotate, and sliding directions.
library smooth_transition;

import 'package:flutter/material.dart';

/// The available types of page transition animations.
///
/// - [fade] : Fades the page in/out.
/// - [scale] : Scales the page in/out.
/// - [rotate] : Rotates the page during transition.
/// - [slideLeft] : Slides the page from right to left.
/// - [slideRight] : Slides the page from left to right.
/// - [slideUp] : Slides the page from bottom to top.
/// - [slideDown] : Slides the page from top to bottom.
enum PageTransitionType {
  fade,
  scale,
  rotate,
  slideLeft,
  slideRight,
  slideUp,
  slideDown
}

/// A custom [PageRouteBuilder] that applies different transition animations
/// when navigating between pages.
///
/// Example usage:
/// ```dart
/// Navigator.push(
///   context,
///   PageTransition(
///     child: SecondPage(),
///     type: PageTransitionType.fade,
///     duration: const Duration(milliseconds: 500),
///   ),
/// );
/// ```
class PageTransition extends PageRouteBuilder {
  /// The widget that will be displayed as the target page.
  final Widget child;

  /// The type of transition animation to use.
  final PageTransitionType type;

  /// The duration of the transition animation.
  final Duration duration;

  /// Creates a new [PageTransition] with the given [child], [type], and [duration].
  ///
  /// [child] is required and represents the target screen.
  /// [type] specifies the animation type (e.g., [PageTransitionType.fade]).
  /// [duration] controls how long the animation runs (default is 450ms).
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
                  position:
                      Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                          .animate(animation),
                  child: child,
                );
              case PageTransitionType.slideRight:
                return SlideTransition(
                  position: Tween<Offset>(
                          begin: const Offset(-1, 0), end: Offset.zero)
                      .animate(animation),
                  child: child,
                );
              case PageTransitionType.slideUp:
                return SlideTransition(
                  position:
                      Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                          .animate(animation),
                  child: child,
                );
              case PageTransitionType.slideDown:
                return SlideTransition(
                  position: Tween<Offset>(
                          begin: const Offset(0, -1), end: Offset.zero)
                      .animate(animation),
                  child: child,
                );
            }
          },
        );
}
