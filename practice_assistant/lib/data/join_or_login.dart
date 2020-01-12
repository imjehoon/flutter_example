import 'package:flutter/foundation.dart';

class JoinOrLogin extends ChangeNotifier {
  bool _isJoin = false;

  bool get isJoin => _isJoin;

  void toggle() {
    _isJoin = !_isJoin;
    notifyListeners(); // 기본 메소드 - 사용하고 있는 widget들에게 알림 -> 옵저버~?
  }
}
