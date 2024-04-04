import 'package:flutter/material.dart';

class AnimationTransition {
  /// Slide animation, from right to left (SlideTransition)
  static Widget fromRight(Animation<double> animation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.2, 0),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(parent: animation, curve: Curves.ease),
        ),
        child: child,
      ),
    );
  }

  /// Slide animation, from left to right (SlideTransition)
  static Widget fromLeft(Animation<double> animation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-0.2, 0),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(parent: animation, curve: Curves.ease),
        ),
        child: child,
      ),
    );
  }

  /// Slide animation, from top to bottom (SlideTransition)
  static Widget fromTop(Animation<double> animation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -0.2),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(parent: animation, curve: Curves.ease),
        ),
        child: child,
      ),
    );
  }

  /// Slide animation, from top to bottom (SlideTransition)
  static Widget fromBottom(Animation<double> animation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.2),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(parent: animation, curve: Curves.ease),
        ),
        child: child,
      ),
    );
  }

  /// Scale animation, from in to out (ScaleTransition)
  static Widget scale(Animation<double> animation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: Tween<double>(
          begin: 0.7,
          end: 1,
        ).animate(
          CurvedAnimation(parent: animation, curve: Curves.ease),
        ),
        child: child,
      ),
    );
  }

  /// Scale animation, from out to in (ScaleTransition)
  static Widget shrink(Animation<double> animation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: Tween<double>(
          begin: 1.2,
          end: 1,
        ).animate(
          CurvedAnimation(parent: animation, curve: const Interval(0.50, 1)),
        ),
        child: child,
      ),
    );
  }
}
