import 'package:flygrs/models/BookingResponse.dart';
import 'package:flygrs/models/ChauffeurResponse.dart';

import '../Utils/app_url.dart';
import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';

class ChauffeurMeRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<ChauffeurListResponse> getChauffeursListApi() async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.getChauffeurListApiEndPoint);
      return response = ChauffeurListResponse.fromJson(response);
    }catch(e){
      rethrow;
    }
  }

  Future<BookingResponse> bookingApi(Map<String, String> data) async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.bookingApiEndPoint, data);
      return response = BookingResponse.fromJson(response);
    }catch(e){
      rethrow;
    }
  }

}