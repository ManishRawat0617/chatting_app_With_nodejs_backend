// import 'dart:convert';
// import 'package:chatting_app_with_node_js/data/exception/app_exception.dart';
// import 'package:chatting_app_with_node_js/data/network/base_api_network.dart';
// import 'package:dio/dio.dart';

// class NetworkServiceApi extends BaseApiNetwork {
//   final Dio dio = Dio();

//   @override
//   Future<dynamic> getData(String url) async {
//     try {
//       final response = await dio.get(url).timeout(const Duration(seconds: 10));
//       return _returnResponse(response);
//     } catch (error) {
//       print("GET API error: \$error");
//       throw FetchDataException(message: "Error fetching data");
//     }
//   }

//   @override
//   Future<dynamic> postData(String url, dynamic data) async {
//     try {
//       final response = await dio.post("http://192.168.1.4:6000/user/login",
//           data: jsonEncode(data));
//       return _returnResponse(response);
//     } catch (error) {
//       print("POST API error: $error");
//       throw FetchDataException(message: "Error posting data");
//     }
//   }

//   dynamic _returnResponse(Response response) {
//     switch (response.statusCode) {
//       case 200:
//       case 400:
//         return response.data;
//       case 500:
//         throw FetchDataException(message: "Internal Server Error: 500");
//       default:
//         throw FetchDataException(
//             message: "Unexpected error: \${response.statusCode}");
//     }
//   }
// }

import 'dart:convert';
import 'package:chatting_app_with_node_js/data/exception/app_exception.dart';
import 'package:chatting_app_with_node_js/data/network/base_api_network.dart';
import 'package:http/http.dart' as http;

class NetworkServiceApi extends BaseApiNetwork {
  final String baseUrl = "http://192.168.1.4:6000";

  @override
  Future<dynamic> getData(String url) async {
    try {
      final response = await http
          .get(Uri.parse("$baseUrl$url"))
          .timeout(const Duration(seconds: 10));
      return _returnResponse(response);
    } catch (error) {
      print("GET API error: $error");
      throw FetchDataException(message: "Error fetching data");
    }
  }

  @override
  Future<dynamic> postData(String url, dynamic data) async {
    try {
      final response = await http
          .post(
            Uri.parse("http://192.168.1.4:6000/user/login"),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 10));
      return _returnResponse(response);
    } catch (error) {
      print("POST API error: $error");
      throw FetchDataException(message: "Error posting data");
    }
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 400:
        return jsonDecode(response.body);
      case 500:
        throw FetchDataException(message: "Internal Server Error: 500");
      default:
        throw FetchDataException(
            message: "Unexpected error: ${response.statusCode}");
    }
  }
}
