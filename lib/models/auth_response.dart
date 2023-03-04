import 'dart:convert';

import 'package:flutter/foundation.dart';

//Model for the expected response from login and register APIs
class AuthResponse {
  String message;
  int code;
  String? successType;
  Map<String, dynamic> errors;
  dynamic data;
  AuthResponse({
    required this.message,
    required this.code,
    this.successType,
    required this.errors,
    required this.data,
  });

  AuthResponse copyWith({
    String? message,
    int? code,
    String? successType,
    Map<String, dynamic>? errors,
    dynamic data,
  }) {
    return AuthResponse(
      message: message ?? this.message,
      code: code ?? this.code,
      successType: successType ?? this.successType,
      errors: errors ?? this.errors,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'code': code,
      'successType': successType,
      'errors': errors,
      'data': data,
    };
  }

  factory AuthResponse.fromMap(Map<String, dynamic> map) {
    return AuthResponse(
      message: map['message'] ?? '',
      code: map['code']?.toInt() ?? 0,
      successType: map['successType'],
      errors: Map<String, dynamic>.from(map['errors']),
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthResponse.fromJson(String source) =>
      AuthResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AuthResponse(message: $message, code: $code, successType: $successType, errors: $errors, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthResponse &&
        other.message == message &&
        other.code == code &&
        other.successType == successType &&
        mapEquals(other.errors, errors) &&
        other.data == data;
  }

  @override
  int get hashCode {
    return message.hashCode ^
        code.hashCode ^
        successType.hashCode ^
        errors.hashCode ^
        data.hashCode;
  }
}
