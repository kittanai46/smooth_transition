import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:smooth_transition/smooth_transition.dart';

void main() {
  test('PageTransition can be created with fade type', () {
    final transition = PageTransition(
      child: const Text('Hello'),
      type: PageTransitionType.fade,
    );

    expect(transition.type, PageTransitionType.fade);
    expect(transition.child, isA<Text>());
  });
}
