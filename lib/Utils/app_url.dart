class AppUrl {
  //Base URL
  static var baseUrl = 'http://3.233.126.15/api';

  //Auth URLS
  static var loginEndPoint = '$baseUrl/login';
  static var registerApiEndPoint = '$baseUrl/register';
  static var logoutApiEndPoint = '$baseUrl/logout';

  //Dashboard URLS
  static var moviesBaseUrl =
      'https://dea91516-1da3-444b-ad94-c6d0c4dfab81.mock.pstmn.io/';
  static var moviesListEndPoint = '${moviesBaseUrl}movies_list';

  //Get Profile
  static var getProfileApiEndPoint = '$baseUrl/profile';
  static var updateProfileApiEndPoint = '$baseUrl/update_profile';

  //Get Chauffeur List
  static var getChauffeurListApiEndPoint = '$baseUrl/chauffeur_list';
  static var bookingApiEndPoint = '$baseUrl/submit_booking';


}