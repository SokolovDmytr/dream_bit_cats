enum HttpType { httpPost, httpGet }

class AppConst {
  static const String emptyString = '';
  static const String baseUrl = 'https://api.thecatapi.com/v1';
  static const String accept = 'accept';
  static const String contentTypeKey = 'Content-Type';
  static const String contentTypeValue = 'application/json';
  static const String exampleUrl = 'example.com';
  static const int noConnectionStatusCode = -1;
  static const Map<String, String> emptyMap = {};
  static const Duration tryConnection = const Duration(seconds: 10);
}
