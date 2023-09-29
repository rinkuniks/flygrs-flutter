import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flygrs/models/ProfileResponse.dart';
import '../Utils/util.dart';
import '../data/response/api_response.dart';
import '../respository/profile_repository.dart';

class ProfileViewModel with ChangeNotifier {

  final _myRepo = ProfileRepository();
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
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
  Future<void> updateProfileApi(File, file, Map<String, String> data, BuildContext context) async {
    setLoading(true);
    _myRepo.profileUpdateApi(data, file).then((value) async {
      setLoading(false);
      print("-----${value.toString()}");
      if(value != null) {
        print("Response?????"+ value.toString());
        Utils.toastMessage(value.toString());
      }else{
        Utils.toastMessage(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.toastMessage(error.toString());
      if (kDebugMode) {
        print("-----E${error.toString()}");
      }
    });
  }
}
