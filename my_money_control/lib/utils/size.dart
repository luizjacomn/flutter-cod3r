import 'package:flutter/material.dart';

class Size {
  static double availableHeight(context, {AppBar appBar, double appBarSize}) {
    assert(
      appBar != null || appBarSize != null,
      'Deve informar uma AppBar ou a altura de uma AppBar',
    );

    final mQuery = MediaQuery.of(context);
    final abh = appBarSize ?? appBar.preferredSize.height;
    return mQuery.size.height - abh - mQuery.padding.top;
  }
}
