import 'package:get/get.dart';
import 'package:ronvest_app/models/auth_response.dart';
import 'package:ronvest_app/models/login_model.dart';
import 'package:ronvest_app/models/register_model.dart';

import '../utils/api.dart';

//Class reponsible for making api calls
class ApiService extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = 'https://hookupcity.net/endpoint/v1/models/users/';
  }

  Future<Response> signUpUser(RegisterModel userToRegister) async {
    AuthResponse authResponse = AuthResponse(
        message: 'An error occured', code: 404, errors: {}, data: {});
    Response response = const Response();
    FormData formData = FormData(userToRegister.toMap());
    try {
      response = await post(Apis.signUpUrl, formData);

      return response;
    } catch (e) {
      authResponse.message = e.toString();
      response = Response(statusCode: 404, body: authResponse);
      return response;
    }
  }

  Future<Response> signInUser(LoginModel userToLogin) async {
    AuthResponse authResponse = AuthResponse(
        message: 'An error occured', code: 404, errors: {}, data: {});
    Response response = const Response();
    FormData formData = FormData(userToLogin.toMap());

    try {
      response = await post(Apis.loginUrl, formData);

      return response;
    } catch (e) {
      authResponse.message = e.toString();
      response = Response(statusCode: 404, body: authResponse);
      return response;
    }
  }

  Future<Response> getProfile(String userAccess, int userId) async {
    AuthResponse authResponse = AuthResponse(
        message: 'An error occured', code: 404, errors: {}, data: {});
    Response response = const Response();
    FormData formData = FormData(
        {"access_token": userAccess, "fetch": "data", "user_id": userId});

    try {
      response = await post(Apis.profileUrl, formData);

      return response;
    } catch (e) {
      authResponse.message = e.toString();
      response = Response(statusCode: 404, body: authResponse);
      return response;
    }
  }
}
