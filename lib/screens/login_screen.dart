import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_bug/logics/logics.dart';
import 'package:travel_bug/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var currentBloc = Provider.of<MainBloc>(context).currentBloc;
    LoginBloc loginBloc;
    if (currentBloc is LoginBloc) {
      loginBloc = currentBloc;
      if (loginBloc.authToken != 'not set') {
        Navigator.pushNamed(context, '/home');
      }
    } else
      loginBloc = LoginBloc(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Login'),
        actions: <Widget>[MainPopupMenuButton()],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/travelbug.JPG'),
              fit: BoxFit.scaleDown,
              repeat: ImageRepeat.repeat),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
            ),
            IconButton(
              iconSize: 150,
              icon: Icon(
                Icons.bug_report,
                color: Colors.red,
              ),
              onPressed: loginBloc.acquireTokenInteractively,
            ),
            // FlatButton(
            //   child: Text('Silent Token'),
            //   onPressed: loginBloc.acquireTokenSilently,
            // ),
          ],
        ),
      ),
    );
  }
}
