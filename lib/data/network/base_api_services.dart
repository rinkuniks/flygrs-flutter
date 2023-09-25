abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url);

  Future<dynamic> getPostApiResponse(String url, dynamic data, [bool isHeader = true]);
  // Future<dynamic> getPostApiWhitOutHeader(String url, dynamic data,);
}
