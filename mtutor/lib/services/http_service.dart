import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpService<T> {
  final String? url;
  final dynamic body;
  T Function(BaseResponse response)? parse;
  T Function(ErrResponse response)? errparse;

  HttpService({this.url, this.body, this.parse, this.errparse});
}

class APIWeb {
  Future<T> get<T>(HttpService<T> resource) async {
    final uri = Uri.parse(resource.url!);
    print("url :${uri.toString()}");
    final response = await http.get(uri);
    print("status code :${response.statusCode}");
    print("response :${response.body}");
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      var res;
      if (responseJson['status'] == 1) {
        res = resource.parse!(BaseResponse.fromJSON(responseJson));
      }
      if (responseJson['status'] == 0) {
        res = resource.errparse!(ErrResponse.fromJSON(responseJson));
      }
      return res;
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<T> post<T>(HttpService<T> resource) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    final uri = Uri.parse(resource.url!);
    print("url :${uri.toString()}");
    final response =
        await http.post(uri, body: jsonEncode(resource.body), headers: headers);
    print("status code :${response.statusCode}");
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      return resource.parse!(BaseResponse.fromJSON(responseJson));
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<T> put<T>(HttpService<T> resource) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    final uri = Uri.parse(resource.url!);
    print("url :${uri.toString()}");
    final response =
        await http.put(uri, body: jsonEncode(resource.body), headers: headers);
    print("status code :${response.statusCode}");
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      return resource.parse!(BaseResponse.fromJSON(responseJson));
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<T> delete<T>(HttpService<T> resource) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    final uri = Uri.parse(resource.url!);
    print("url :${uri.toString()}");
    final response = await http.delete(uri,
        body: jsonEncode(resource.body), headers: headers);
    print("status code :${response.statusCode}");
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      return resource.parse!(BaseResponse.fromJSON(responseJson));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
