import 'package:get/get.dart';
import 'package:ronvest_app/services/api_service.dart';
import 'package:ronvest_app/services/firebase_authentication.dart';

import '../models/login_model.dart';
import '../models/register_model.dart';

//Central class to abstract all network services
//calling a method will call the corresponding method from its original class
class Repository {
  final ApiService _apiService = ApiService();

  final FirebaseAuthentication _firebaseAuthentication =
      FirebaseAuthentication();

  Future<Response> signUpUser(RegisterModel userToRegister) async =>
      _apiService.signUpUser(userToRegister);

  Future<Response> signInUser(LoginModel userToLogin) async =>
      _apiService.signInUser(userToLogin);

  Future<Response> getProfile(String userAccess, int userId) async =>
      _apiService.getProfile(userAccess, userId);

  Future<String?> registerUserInFirebase({
    required String email,
    required String password,
  }) async =>
      _firebaseAuthentication.registerUserInFirebase(
          email: email, password: password);

  Future<String?> signInFirebase({
    required String email,
    required String password,
  }) async =>
      _firebaseAuthentication.signInFirebase(email: email, password: password);
}
