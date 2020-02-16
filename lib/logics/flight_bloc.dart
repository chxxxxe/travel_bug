import 'logics.dart';

class FlightBloc extends HomeBloc {
  var flights;

  FlightBloc() {
    getFlightInspiration();
  }

  void getFlightInspiration() {
    var origin = 'BOS';
    var urlPath = '/v1/shopping/flight-destinations?origin=$origin';
    getData(Uri.parse('$url$urlPath'), getFlightInspirationComplete);
  }

  void getFlightInspirationComplete(dynamic data) {
    print(data);
    flights = data;
    notifyListeners();
  }
}
