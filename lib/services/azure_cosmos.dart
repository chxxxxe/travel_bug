// import 'package:http/http.dart' as http;

// class AzureCosmos {
//   static AzureCosmos _azureCosmos = AzureCosmos._();
//   HttpClient http;

//   factory AzureCosmos() => _azureCosmos;

//   AzureCosmos._() {
//     http = http.Client();

//   }

//   dynamic getData() async {
//     var url = 'https://travelbugapi.azurewebsites.net/api/HttpTrigger1?code=XrI7qeYrIm4VGpHFJl7ICBAiJGdy6T04Bywa8GORdfF1q6A5iSgnCw==';
//     var response = await http.get(url);

//     print(await http.read('https://example.com/foobar.txt'));

//   }
// }
