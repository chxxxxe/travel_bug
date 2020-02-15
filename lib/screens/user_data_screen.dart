import 'package:flutter/material.dart';
import 'package:travel_bug/widgets/widgets.dart';

class UserDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
        actions: <Widget>[MainPopupMenuButton()],
      ),
      body: Container(
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  Text('First Name'),
                  TextFormField(),
                  Text('Last Name'),
                  TextFormField(),
                  Text('Address1'),
                  TextFormField(),
                  Text('Address2'),
                  TextFormField(),
                  Text('City'),
                  TextFormField(),
                  Text('State'),
                  TextFormField(),
                  Text('Zip Code'),
                  TextFormField(),
                  Text('Mobile Phone'),
                  TextFormField(),
                  Text('Home Phone'),
                  TextFormField(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
