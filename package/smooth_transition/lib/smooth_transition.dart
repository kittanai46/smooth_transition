/// A Flutter package that provides smooth page transition animations.
///
/// This library allows you to easily add animated transitions between pages,
/// such as fade, scale, rotate, sliding directions, and special effects like
/// elastic scaling, flip, and combined animations.
///
/// Example usage:
/// ```dart
/// Navigator.push(
///   context,
///   PageTransition(
///     child: SecondPage(),
///     type: PageTransitionType.scaleFade,
///     duration: const Duration(milliseconds: 600),
///   ),
/// );
/// ```
library smooth_transition;

import 'dart:ui';
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
/// - [scaleFade] : Combines scale + fade (pop-in effect).
/// - [rotateScale] : Rotates and scales the page simultaneously.
/// - [slideLeftFade] : Slides from right to left while fading in.
/// - [elasticScale] : Bouncy scale animation with spring effect.
/// - [flip] : 3D flip animation like turning a card.
/// - [zoomRotate] : Rotates while zooming in (3D-like effect).
/// - [blurFade] : Fades in with a blurred background.
/// - [slideZoom] : Slides while zooming in.
/// - [fadeThrough] : Material 3 style fade-through transition.
enum PageTransitionType {
  fade,
  scale,
  rotate,
  slideLeft,
  slideRight,
  slideUp,
  slideDown,
  scaleFade,
  rotateScale,
  slideLeftFade,
  elasticScale,
  flip,
  zoomRotate,
  blurFade,
  slideZoom,
  fadeThrough,
}

/// A custom [PageRouteBuilder] that applies different transition animations
/// when navigating between pages.
///
/// Example:
/// ```dart
/// Navigator.push(
///   context,
///   PageTransition(
///     child: SecondPage(),
///     type: PageTransitionType.elasticScale,
///   ),
/// );
/// ```
class PageTransition extends PageRouteBuilder {
  /// The widget that will be displayed as the target page.
  final Widget child;

  /// The type of transition animation to use.
  final PageTransitionType type;

  /// The duration of the transition animation.
  ///
  /// Defaults to `450ms` if not specified.
  final Duration duration;

  /// The curve of the transition animation.
  ///
  /// Defaults to [Curves.easeInOut].
  final Curve curve;

  /// Creates a new [PageTransition] with the given parameters.
  PageTransition({
    required this.child,
    required this.type,
    this.duration = const Duration(milliseconds: 450),
    this.curve = Curves.easeInOut,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionDuration: duration,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curvedAnimation =
                CurvedAnimation(parent: animation, curve: curve);

            switch (type) {
              /// Fade Transition
              case PageTransitionType.fade:
                return FadeTransition(opacity: curvedAnimation, child: child);

              /// Simple Scale Transition
              case PageTransitionType.scale:
                return ScaleTransition(scale: curvedAnimation, child: child);

              /// Simple Rotation Transition
              case PageTransitionType.rotate:
                return RotationTransition(turns: curvedAnimation, child: child);

              /// Slide from Right to Left
              case PageTransitionType.slideLeft:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(curvedAnimation),
                  child: child,
                );

              /// Slide from Left to Right
              case PageTransitionType.slideRight:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1, 0),
                    end: Offset.zero,
                  ).animate(curvedAnimation),
                  child: child,
                );

              /// Slide from Bottom to Top
              case PageTransitionType.slideUp:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: Offset.zero,
                  ).animate(curvedAnimation),
                  child: child,
                );

              /// Slide from Top to Bottom
              case PageTransitionType.slideDown:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, -1),
                    end: Offset.zero,
                  ).animate(curvedAnimation),
                  child: child,
                );

              /// Scale + Fade (Pop-in Effect)
              case PageTransitionType.scaleFade:
                return FadeTransition(
                  opacity: curvedAnimation,
                  child: ScaleTransition(
                    scale: CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOutBack,
                    ),
                    child: child,
                  ),
                );

              /// Rotate + Scale Together
              case PageTransitionType.rotateScale:
                return RotationTransition(
                  turns: curvedAnimation,
                  child: ScaleTransition(
                    scale: curvedAnimation,
                    child: child,
                  ),
                );

              /// Slide + Fade Combination
              case PageTransitionType.slideLeftFade:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(curvedAnimation),
                  child: FadeTransition(
                    opacity: curvedAnimation,
                    child: child,
                  ),
                );

              /// Elastic Scale (Bouncy Effect)
              case PageTransitionType.elasticScale:
                return ScaleTransition(
                  scale: CurvedAnimation(
                    parent: animation,
                    curve: Curves.elasticOut,
                  ),
                  child: child,
                );

              /// 3D Flip Transition
              case PageTransitionType.flip:
                return AnimatedBuilder(
                  animation: curvedAnimation,
                  child: child,
                  builder: (context, child) {
                    final angle = curvedAnimation.value * 3.1416; // 180 degrees
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(angle),
                      child: child,
                    );
                  },
                );

              /// Zoom Rotate (Rotate + Zoom)
              case PageTransitionType.zoomRotate:
                return RotationTransition(
                  turns: Tween(begin: 0.8, end: 1.0).animate(curvedAnimation),
                  child: ScaleTransition(
                    scale: CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOutBack,
                    ),
                    child: child,
                  ),
                );

              /// Blur + Fade
              case PageTransitionType.blurFade:
                return Stack(
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      // ignore: deprecated_member_use
                      child: Container(color: Colors.black.withOpacity(0)),
                    ),
                    FadeTransition(opacity: curvedAnimation, child: child),
                  ],
                );

              /// Slide + Zoom
              case PageTransitionType.slideZoom:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(curvedAnimation),
                  child: ScaleTransition(
                    scale: CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOutQuart,
                    ),
                    child: child,
                  ),
                );

              /// Fade Through (Material 3 spec)
              case PageTransitionType.fadeThrough:
                return FadeTransition(
                  opacity: curvedAnimation,
                  child: FadeTransition(
                    opacity: ReverseAnimation(secondaryAnimation),
                    child: child,
                  ),
                );
            }
          },
        );
}
