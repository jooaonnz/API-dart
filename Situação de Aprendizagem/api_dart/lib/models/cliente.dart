import 'dart:io';

class Cliente {
  final int id;
  final String name;
  final DateTime dateOfBirth;
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
    print('teste');
    print(map['dataNascimento']);
    return Cliente(
      id: map['id'],
      name: map['nome'],
      dateOfBirth: DateTime.parse(map['dataNascimento']),
      phoneNumber: map['numero'],
      email: map['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': name,
      'dataNascimento': dateOfBirth.toIso8601String().split('T')[0],
      'numero': phoneNumber,
      'email': email,
    };
  }
}
