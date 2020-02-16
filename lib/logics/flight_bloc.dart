import 'dart:async';

import 'logics.dart';

class FlightBloc extends HomeBloc {
  Stream<List<FlightModel>> flights;

  FlightBloc() {
    getFlightInspiration();
  }

  void getFlightInspiration() {
    var origin = 'BOS';
    var urlPath = '/v1/shopping/flight-destinations?origin=$origin';
    getData(Uri.parse('$url$urlPath'), getFlightInspirationComplete);
  }

  void getFlightInspirationComplete(Map<String, dynamic> json) {
    Location.parseLocations(json['dictionaries']['locations']);
    var flightModels = (json['data'] as List)
        .map((json) => FlightModel.fromJson(json))
        .toList();
    var streamController = StreamController<List<FlightModel>>();
    flights = streamController.stream;
    streamController.sink.add(flightModels);
    streamController.close();
    title = 'Flights from ${Location.locations['BOS'].detailedName}';
    notifyListeners();
  }
}

class FlightModel {
  final String type;
  final Location origin;
  final Location destination;
  final DateTime departureDate;
  final DateTime returnDate;
  final double price;
  final FlightLinks links;

  FlightModel(
      {this.type,
      this.origin,
      this.destination,
      this.departureDate,
      this.returnDate,
      this.price,
      this.links});

  factory FlightModel.fromJson(Map<String, dynamic> json) => FlightModel(
        type: json['type'],
        origin: Location.parse(json['origin']),
        destination: Location.parse(json['destination']),
        departureDate: DateTime.parse(json['departureDate']),
        returnDate: DateTime.parse(json['returnDate']),
        price: double.parse(json['price']['total']),
        links: FlightLinks.parse(json['links']),
      );
}

class Location {
  static Map<String, Location> locations = {};
  final String iataCode;
  final String subType;
  final String detailedName;

  Location._(this.iataCode, this.subType, this.detailedName);

  factory Location.parse(id) {
    return locations[id];
  }

  static void parseLocations(Map<String, dynamic> json) {
    json.forEach((k, v) =>
        locations[k] = Location._(k, v['subType'], v['detailedName']));
  }
}

class FlightLinks {
  final Uri flightDates;
  final Uri flightoffers;

  FlightLinks(this.flightDates, this.flightoffers);

  factory FlightLinks.parse(Map<String, dynamic> json) => FlightLinks(
      Uri.parse(json['flightDates']), Uri.parse(json['flightOffers']));
}
