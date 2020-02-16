import 'package:flutter/material.dart';
import 'package:travel_bug/logics/base_bloc.dart';
import 'package:travel_bug/logics/logics.dart';

class MainBloc extends ChangeNotifier {
  static MainBloc _mainBloc = MainBloc._();
  factory MainBloc() => _mainBloc;

  BaseBloc _currentBloc;

  BaseBloc get currentBloc => _currentBloc;
  // set currentBloc(BaseBloc bloc) {
  //   if (_currentBloc != null) _currentBloc.removeListener(listener);
  //   _currentBloc = bloc;
  //   _currentBloc.addListener(listener);
  // }

  MainBloc._() {
    // currentBloc = LoginBloc();
  }

  void listener() {
    notifyListeners();
  }
}
