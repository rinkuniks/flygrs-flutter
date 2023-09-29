import 'dart:io';

import 'package:flygrs/models/ProfileResponse.dart';
import 'package:flygrs/view_model/profile_view_model.dart';

import '../Utils/app_url.dart';
import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';

class ProfileRepository{
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<ProfileResponse> profileDetailApi() async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.getProfileApiEndPoint);
      return response = ProfileResponse.fromJson(response);
    }catch(e){
      rethrow;
    }
  }

  Future<ProfileResponse> profileUpdateApi(Map<String, String> data, File file) async{
    try{
      dynamic response = await _apiServices.getPostApiWithMultipartResponse(AppUrl.updateProfileApiEndPoint, data, file);
      return response = ProfileResponse.fromJson(response);
    }catch(e){
      rethrow;
    }
  }
}