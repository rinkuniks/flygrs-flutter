import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flygrs/models/ProfileResponse.dart';
import '../data/response/api_response.dart';
import '../respository/profile_repository.dart';

class ProfileViewModel with ChangeNotifier {

  final _myRepo = ProfileRepository();
  ApiResponse<ProfileResponse> profileData = ApiResponse.loading();

  setProfileData(ApiResponse<ProfileResponse> response){
     profileData = response;
    notifyListeners();
  }

  Future<void> fetchProfileDataApi() async{
    _myRepo.profileDetailApi().then((value){
      setProfileData(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      setProfileData(ApiResponse.error(error.toString()));
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
