class Constant {

  ///
  static const String LOGIN_TYPE_FACEBOOK = 'FACEBOOK';
  static const String LOGIN_TYPE_GOOGLE = 'GOOGLE';
  static const String LOGIN_TYPE_APPLE = 'APPLE';
  static  String FCM_TOKEN="1234";
  static const String USER_TYPE = "2";
  static  String TOKEN = "";
  static String USERDATA = "";


  /// Regex Constants
  static RegExp EMAILVALID = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static RegExp PHONEVALID = RegExp(r"^[7-9]\d{9}$");

  /// Key Constants
  static const String LBL_APPLE = "Apple";
  static const String LBL_ACCOUNT = "Account";
  static const String LBL_YES = "Yes";
  static const String LBL_NO = "No";
  static const String LBL_BLUEBACK = "blueBack";
  static const String LBL_MY_PROFILE = "My Profile";
  static const String LBL_NAME = "Name";
  static const String LBL_EMAIL_ADDRESS = "E-mail Address";
  static const String LBL_MOBILE_NUMBER = "Mobile Number";
  static const String LBL_BIRTHDAY = "Birthday";



  ///  Logout Popup
  static const LBL_CONFIRM = "Confirm Logout";
  static const LBL_CONFIRM_MSG = "Do you want to logout?";

  ///  MSG Constant
  static const String LBL_PICKCAMERA_MSG = "Pick Image From Camera";
  static const String LBL_PICKGALLERY_MSG = "Pick Image From Gallery";
}