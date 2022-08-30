import 'dart:convert';
import 'dart:developer' as developer;
// import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:nicole/api/result.dart';

// import '../common/models.dart';

// Future<String> login(String mobile, String password) async {
//   final response = await http.post(
//     Uri.parse('http://192.168.2.206:8000/api/user/login/'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'mobile': mobile,
//       'password': password
//     })
//   );
//   var body = jsonDecode(response.body);
//   if (!body['success']) {
//     print(body['msg']);
//     throw Exception('Failed to login');
//   }
//   return body['data']['token'];
// }

class Options {
  late String url;
  late String method;
  late Map<String, dynamic> data;
  late Map<String, String> query;

  Options(this.url, {required this.method, required this.data});
}

const headers = <String, String>{
  'Content-Type': 'application/json; charset=UTF-8',
};

// JsonDecoder jsonDecoder = JsonDecoder(R<d>())

Future<R<T>> request<T>(Options options) async {
  // developer.log('request start');
  var endpoint = dotenv.env['ENDPOINT']!;
  var method = options.method;
  late http.Response response;
  if (method.toUpperCase() != 'GET') {
    developer.log('request $endpoint${options.url} ${options.data}');
    // late Uri url;
    // try{
    //   url = Uri.http(endpoint, options.url);
    // }catch(e) {
    //   developer.log('err', error:e);
    // }
    var url = Uri.http(endpoint, options.url);
    var body = jsonEncode(options.data);
    // developer.log('request body: $body');
    response = await http.post(url, headers: headers, body: body);
  } else {
    var url = Uri.http(endpoint, options.url, options.query);
    response = await http.get(url, headers: headers);
  }
  late R<T> body;
  try{
    Map<String, dynamic> bodyMap = jsonDecode(response.body);
    // body = const JsonDecoder().convert(response.body);
    body = R<T>.fromJson(bodyMap);
  }catch(e) {
    developer.log('decode response body:', error: e);
    developer.log('raw response body: ${response.body}');
  }
  developer.log('response body: $body');
  // if (!body['success']) {
  //   stdout.write(body['msg']);
  //   throw Exception('Failed to login');
  // }
  // return body['data']['token'];
  // developer.log('request end');
  return body;
}


Future<R<LoginResult>> login(data) {
  return request(Options(
      '/api/user/login/',
      method: 'POST',
      data: data
  ));
}