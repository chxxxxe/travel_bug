import 'package:msal_flutter/msal_flutter.dart';

import 'logics.dart';

class LoginBloc extends BaseBloc {
  String _authToken = 'not set';

  String get authToken => _authToken;
  set authToken(String value) {
    _authToken = value;
    notifyListeners();
  }

  LoginBloc() {}

  Future<void> acquireTokenInteractively() async {
    // Sign in interactively
    var pca = await PublicClientApplication.createPublicClientApplication(
        "48816f1c-21fa-483e-9d79-ca77c96d8ddc",
        authority:
            "https://dressupsuitup.b2clogin.com/tfp/dressupsuitup.onmicrosoft.com/B2C_1_signupsignin/");
    try {
      authToken = await pca.acquireToken([
        "https://dressupsuitup.onmicrosoft.com/48816f1c-21fa-483e-9d79-ca77c96d8ddc/Files.Read"
      ]);
      print(authToken);
      notifyListeners();
    } on MsalException catch (e) {
      print(e);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> acquireTokenSilently() async {
    // Sign in silently
    authToken += '*';
    notifyListeners();
  }

  Future<void> signout() async {
    // Sign out
    // await this.fma.signOut;
    notifyListeners();
  }

  Future<void> loadAccount() async {
    // Android load account username
    // var accountInfo = await this.fma.loadAccount;
    notifyListeners();
  }
}
