import '../Utils/app_url.dart';
import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';

  class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  /// Login Api
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// Signup Api
  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response =
          _apiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
  /// Logout Api
  Future<dynamic> logoutApi() async {
    try {
      dynamic response =
      _apiServices.getGetApiResponse(AppUrl.logoutApiEndPoint);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
