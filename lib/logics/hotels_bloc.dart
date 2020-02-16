import 'dart:async';

import 'package:travel_bug/logics/logics.dart';

class HotelsBloc extends HomeBloc {
  Stream<List<Hotel>> hotels;

  HotelsBloc() {
    getHotels();
  }

  void getHotels() {
    var location = 'LON';
    var urlPath = '/v2/shopping/hotel-offers?cityCode=$location';
    getData(Uri.parse('$url$urlPath'), getHotelsComplete);
  }

  void getHotelsComplete(Map<String, dynamic> json) {
    var hotelsData =
        (json['data'] as List).map((json) => Hotel.fromJson(json)).toList();
    var streamController = StreamController<List<Hotel>>();
    hotels = streamController.stream;
    streamController.sink.add(hotelsData);
    streamController.close();
    title = 'Hotel offers in ${hotelsData[0].address.cityName}';
    notifyListeners();
  }
}

class MyClasssss {
  final String test;

  MyClasssss(this.test);
}

class Hotel {
  final String type;
  final String hotelId;
  final String chainCode;
  final String name;
  final int rating;
  final String cityCode;
  final double distance;
  final String distanceUnit;
  final Address address;
  final Contact contact;
  final List<String> amenities;
  // final Media media;
  final List<Offer> offers;
  final Uri self;

  Hotel(
      this.type,
      this.hotelId,
      this.chainCode,
      this.name,
      this.rating,
      this.cityCode,
      this.distance,
      this.distanceUnit,
      this.address,
      this.contact,
      this.amenities,
      // this.media,
      this.self,
      this.offers);

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        json['type'],
        json['hotel']['hotelId'],
        json['hotel']['chainCode'],
        json['hotel']['name'],
        int.parse(json['hotel']['rating']),
        json['hotel']['cityCode'],
        json['hotel']['hotelDistance']['distance'],
        json['hotel']['hotelDistance']['distanceUnit'],
        Address.fromJson(
          json['hotel']['address'],
        ),
        Contact.fromJson(
          json['hotel']['contact'],
        ),
        json['hotel']['amenities'].cast<String>(),
        // Media.fromJson(
        //   json['hotel']['media'],
        // ),
        Uri.parse(
          json['self'],
        ),
        Offer.offersFromJson(json['offers']),
      );

  static List<String> amenitiesFromJson(json) {
    return (json as List).map((v) => v).toList();
  }
}

class Address {
  final List<String> lines;
  final String postalCode;
  final String cityName;
  final String countryCode;

  Address(this.lines, this.postalCode, this.cityName, this.countryCode);

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        List.from(['Lines']),
        json['postalCode'],
        json['cityName'],
        json['countryCode'],
      );
}

class Contact {
  final String phone;
  final String fax;

  Contact(this.phone, this.fax);

  factory Contact.fromJson(Map<String, dynamic> json) =>
      Contact(json['phone'], json['fax']);
}

class Media {
  final Uri uri;
  final String category;

  Media(this.uri, this.category);

  factory Media.fromJson(Map<String, dynamic> json) =>
      Media(Uri.parse(json['uri']), json['category']);
}

class Offer {
  final Room room;
  final Price price;

  Offer(this.room, this.price);

  static List<Offer> offersFromJson(List<dynamic> json) {
    return json.map((v) => Offer(Room.fromJson(v), Price.fromJson(v))).toList();
  }
}

class Room {
  final String bedType;
  final String description;

  Room(this.bedType, this.description);

  factory Room.fromJson(Map<String, dynamic> json) => Room(
      json['room']['typeEstimated']['bedType'],
      json['room']['description']['text']);
}

class Price {
  final String currency;
  final double total;

  Price(this.currency, this.total);

  factory Price.fromJson(Map<String, dynamic> json) =>
      Price(json['price']['currency'], double.parse(json['price']['total']));
}
