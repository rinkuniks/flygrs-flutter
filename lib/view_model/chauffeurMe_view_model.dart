import 'package:flutter/cupertino.dart';
import 'package:flygrs/models/ChauffeurResponse.dart';
import 'package:flygrs/respository/chauffeurMe_repository.dart';

import '../Utils/util.dart';
import '../data/response/api_response.dart';
import '../models/BookingResponse.dart';

class ChauffeurMeViewModel with ChangeNotifier {
  final _myRepo = ChauffeurMeRepository();
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
  ApiResponse<ChauffeurListResponse> chauffeurListData = ApiResponse.loading();

  setChauffeurListData(ApiResponse<ChauffeurListResponse> response){
    chauffeurListData = response;
    notifyListeners();
  }
  Future<void> fetchChauffeurListApi() async{
    _myRepo.getChauffeursListApi().then((value){
      setChauffeurListData(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      setChauffeurListData(ApiResponse.error(error.toString()));
    });
  }

  Future<void> submitBookingApi(Map<String, String> data, BuildContext context, Function callback) async {
    setLoading(true);
    _myRepo.bookingApi(data).then((value) async {
      setLoading(false);
      print("-----${value.message}");
      if(value.data != null) {
        print("Response????? ${value.message}");
        Utils.toastMessage(value.message);
        callback('Success');
      }else{
        Utils.toastMessage(value.message);
        callback('Failed');
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.toastMessage(error.toString());
    });
  }
}