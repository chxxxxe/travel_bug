import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_bug/logics/logics.dart';
import 'package:travel_bug/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var currentBloc = Provider.of<MainBloc>(context).currentBloc;
    LoginBloc loginBloc;
    if (currentBloc is LoginBloc)
      loginBloc = currentBloc;
    else
      loginBloc = LoginBloc();
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: <Widget>[MainPopupMenuButton()],
      ),
      body: Container(
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
      ),
    );
  }
}
