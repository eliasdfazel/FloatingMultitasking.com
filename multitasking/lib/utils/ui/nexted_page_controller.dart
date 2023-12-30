import 'package:flutter/material.dart';

class NextedPageController extends ScrollPhysics {

  const NextedPageController({ScrollPhysics? parent}) : super(parent: parent);

  @override
  NextedPageController applyTo(ScrollPhysics? ancestor) {

    return NextedPageController(parent: buildParent(ancestor)!);
  }

  @override
  SpringDescription get spring => const SpringDescription(
    mass: 37,
    stiffness: 73,
    damping: 0.37,
  );
}