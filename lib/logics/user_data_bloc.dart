import 'package:flutter/material.dart';

class UserDataBloc extends ChangeNotifier {
  FirstName firstName;
  String lastName;
  String address1;
  String address2;
  String city;
  String state;
  String zipCode;
  String mobilePhone;
  String homeNumber;
}

// class DataBase extends ChangeNotifier {
//   Map<String, dynamic> data;

//   void setter(dynamic func) {
//     data.putIfAbsent(func.toString, func());
//   }
// }

typedef FirstName = Function(String);
