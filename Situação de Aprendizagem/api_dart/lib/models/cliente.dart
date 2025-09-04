import 'dart:io';

class Cliente {
  final int id;
  final String name;
  final String dateOfBirth;
  final String phoneNumber;
  final String email;

  Cliente({
    required this.id,
    required this.name,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.email,
  });

  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      id: map['id'],
      name: map['name'],
      dateOfBirth: map['dateOfBirh'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'dateOfBirth': dateOfBirth,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }
}
