class Constant {
  static const String LOGIN_TYPE_FACEBOOK = 'FACEBOOK';
  static const String LOGIN_TYPE_GOOGLE = 'GOOGLE';
  static const String LOGIN_TYPE_APPLE = 'APPLE';
  static  String FCM_TOKEN="1234";
  static const String USER_TYPE = "2";
  static  String TOKEN = "";
  static String USERDATA = "";
  static RegExp EMAILVALID = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static RegExp PHONEVALID = RegExp(r"^[7-9]\d{9}$");
}