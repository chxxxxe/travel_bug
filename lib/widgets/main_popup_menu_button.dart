import 'package:flutter/material.dart';

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
            value: 'login',
          ),
          PopupMenuItem(
            child: Text('Groups'),
            value: 'groups',
          ),
          PopupMenuItem(
            child: Text('Settings'),
            value: 'settings',
          ),
        ];
      },
      onSelected: (value) => Navigator.pushNamed(context, value),
    );
  }
}
