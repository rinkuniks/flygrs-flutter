import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../Utils/constant.dart';
import '../../Utils/util.dart';
import '../app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {

  dynamic header() {
    Map<String, String> header = {
      "accept": "application/json",
     // "Content-Type": "application/json"
    };
    if (Constant.TOKEN.isNotEmpty) {
      header['Authorization'] = "Bearer ${Constant.TOKEN}";
    }
    // header['Authorization'] = "Bearer 16|Vrs05S0HT9oFjDG2iqig4YKC1jMtBUM6ov2qQOiwd0d57de8";
    return header;
  }

  dynamic headerMultiPart() {
    Map<String, String> header = {
      "accept": "multipart/form-data",
      "Content-Type": "multipart/form-data"
    };
    if (Constant.TOKEN.isNotEmpty) {
      header['Authorization'] = "Bearer ${Constant.TOKEN}";
    }
    return header;
  }


  //Bearer
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
  //  log("${Uri.parse(url)}\n\n${header()}");
    print("Api url-----------------"+ url);
    print("Header-----------------"+ header().toString());
    try {
      final response = await http.get(Uri.parse(url), headers: header()).timeout(const Duration(seconds: 10));

     responseJson = returnResponse(response);
    } on SocketException {
      Utils.toastMessage('no internet connection');
      throw FetchDataException('No Internet Connection');
    }
    log("API RESPONSE====>>  \n\n$responseJson\n\n");
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data,[bool isHeader = true]) async {
    dynamic responseJson;
    log("${Uri.parse(url)}\n\n${header()}\n\n$data");
    try {
      http.Response response ;
      if(isHeader){
       response = await http.post(Uri.parse(url), body: data, headers: header())
            .timeout(const Duration(seconds: 10));
      }else{
      response = await http.post(Uri.parse(url), body: data)
            .timeout(const Duration(seconds: 10));
      }

      responseJson = returnResponse(response);
    } on SocketException {
      Utils.toastMessage('No Internet connection');
      throw FetchDataException('No Internet connection');
    }
    log("API RESPONSE====>>  \n\n$responseJson\n\n");
    return responseJson;
  }

  @override
  Future getPostApiWhitOutHeader(String url, dynamic data) async {
    dynamic responseJson;
    log("${Uri.parse(url)}\n\n${header()}\n\n$data");
    try {
      http.Response response = await http.post(Uri.parse(url), body: data)
            .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      Utils.toastMessage('No Internet connection');
      throw FetchDataException('No Internet connection');
    }
    log("API RESPONSE====>>  \n\n$responseJson\n\n");
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {

    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
       // throw BadRequentException(response.body.toString());
       // {"statusCode":400,"message":"Invalid Credentials. Please enter valid information to proceed."}
      case 500:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 404:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
        //{"statusCode":404,"message":"A user with this email address is already registered. Please try again using an alternate email address."}
       // throw Unauthorisedexception(response.body.toString());
      case 401:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 409: //for account block
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 422: //for social login
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataException(
            'Error occurred while communicating with server with status code${response.statusCode}');
    }
  }
}
