import 'package:flutter/material.dart';
import 'package:travel_bug/logics/logics.dart';

class MainPopupMenuButton extends StatelessWidget {
  const MainPopupMenuButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.menu),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: Text('Login'),
            value: '/',
          ),
          PopupMenuItem(
            child: Text('User Info'),
            value: '/userData',
          ),
          PopupMenuItem(
            child: Text('Groups'),
            value: 'groups',
          ),
          PopupMenuItem(
            child: Text('Settings'),
            value: 'settings',
          ),
          PopupMenuItem(
            child: Text('Home'),
            value: '/home',
          ),
        ];
      },
      onSelected: (value) {
        var mainBloc = MainBloc();
        mainBloc.currentBloc = getBlocBasedOn(value);
        Navigator.popAndPushNamed(context, value);
      },
    );
  }

  BaseBloc getBlocBasedOn(value) {
    switch (value) {
      case '/home':
        return HomeBloc();
    }
  }
}
