import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class StyleProvider extends ChangeNotifier {
  static StyleProvider _instance;

  bool _iOSStyle = false;
  BehaviorSubject<bool> _controller = BehaviorSubject.seeded(false);

  StyleProvider._default();

  factory StyleProvider() {
    _instance ??= StyleProvider._default();
    return _instance;
  }

  Stream<bool> get iosStyle => _controller.stream;

  void changeStyle() async {
    _iOSStyle = !_iOSStyle;
    _controller.add(_iOSStyle);
  }

  @override
  void dispose() {
    _controller?.close();
    super.dispose();
  }
}
