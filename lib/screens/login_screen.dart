import 'package:flutter/material.dart';
import 'package:travel_bug/logics/logics.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var loginBloc = new LoginBloc();
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(loginBloc.authToken),
          // Text('Account Inf')
          FlatButton(
            child: Text('Interactive Token'),
            onPressed: loginBloc.acquireTokenInteractively,
          ),
          FlatButton(
            child: Text('Silent Token'),
            onPressed: loginBloc.acquireTokenSilently,
          ),
        ],
      ),
    );
  }
}
