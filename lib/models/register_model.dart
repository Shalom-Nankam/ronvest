import 'dart:convert';

//Model to sign up a new  user
class RegisterModel {
  String username;
  String email;
  String password;
  String? firstName;
  String? lastName;
  String? gender;
  RegisterModel({
    required this.username,
    required this.email,
    required this.password,
    this.firstName,
    this.lastName,
    this.gender,
  });

  RegisterModel copyWith({
    String? username,
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    String? gender,
  }) {
    return RegisterModel(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      firstName: map['first_name'],
      lastName: map['last_name'],
      gender: map['gender'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) =>
      RegisterModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RegisterModel(username: $username, email: $email, password: $password, firstName: $firstName, lastName: $lastName, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterModel &&
        other.username == username &&
        other.email == email &&
        other.password == password &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.gender == gender;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        email.hashCode ^
        password.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        gender.hashCode;
  }
}
