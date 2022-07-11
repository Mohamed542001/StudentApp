import 'dart:convert';

class User {
  String user;
  String password;
  String address;
  String phone;
  String ticketNumber;
  String destination;
  List modelData;

  User({
    required this.user,
    required this.password,
    required this.address,
    required this.phone,
    required this.ticketNumber,
    required this.destination,
    required this.modelData,
  });

  static User fromMap(Map<String, dynamic> user) {
    return new User(
      user: user['user'],
      password: user['password'],
      address: user['address'],
      phone: user['phone'],
      destination: user['destination'],
      ticketNumber: user['ticketNumber'],
      modelData: jsonDecode(user['model_data']),
    );
  }

  toMap() {
    return {
      'user': user,
      'password': password,
      'address': address,
      'phone': phone,
      'destination': destination,
      'ticketNumber': ticketNumber,
      'model_data': jsonEncode(modelData),
    };
  }
}