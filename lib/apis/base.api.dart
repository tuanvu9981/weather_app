class BaseApi {
  static String baseUrl = 'api.openweathermap.org';
  static String path = 'data/3.0/onecall';
  static Map<String, String> headers = {
    "Content-type": "application/json",
    "Accept": "application/json",
  };
}
