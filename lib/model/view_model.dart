import 'package:flutter/foundation.dart';

class ViewModel extends ChangeNotifier {
  int _currentView;

  ViewModel(this._currentView);

  void switchView(int index) {
    if (_currentView != index) {
      _currentView = index;
      notifyListeners();
    }
  }

  int get currentView => _currentView;
}
