import 'dart:core';

class ApiUtil {
  static const String mainDomain = "https://qrpay.revogrit.com";
  static const String baseUrl = "https://reqres.in/api";
// static const String
  static const String loginUrl = '$baseUrl/login';
  static const String registrationUrl = '$baseUrl/register';
  // Future<Response> buildHttpResponse(String endPoint,
  //     {HttpMethod method = HttpMethod.GET, Map? request}) async {
  //   if (await isNetworkAvailable()) {
  //     var headers = buildHeaderTokens();
  //     Uri url = buildBaseUrl(endPoint);

  //     print('Header:${headers.toString()}');

  //     try {
  //       Response response;

  //       if (method == HttpMethod.POST) {
  //         log('Request: $request');

  //         response = await http
  //             .post(url, body: jsonEncode(request), headers: headers)
  //             .timeout(Duration(seconds: 20), onTimeout: () => throw 'Timeout');
  //       } else if (method == HttpMethod.DELETE) {
  //         response = await delete(url, headers: headers)
  //             .timeout(Duration(seconds: 20), onTimeout: () => throw 'Timeout');
  //       } else if (method == HttpMethod.PUT) {
  //         response = await put(url, body: jsonEncode(request), headers: headers)
  //             .timeout(Duration(seconds: 20), onTimeout: () => throw 'Timeout');
  //       } else {
  //         response = await get(url, headers: headers)
  //             .timeout(Duration(seconds: 20), onTimeout: () => throw 'Timeout');
  //       }

  //       log('Response ($method): ${url.toString()} ${response.statusCode} ${response.body}');

  //       return response;
  //     } catch (e) {
  //       throw 'Something Went Wrong';
  //     }
  //   } else {
  //     throw 'Your internet is not working';
  //   }
  // }
}
