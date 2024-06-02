import 'dart:convert';
import 'package:http/http.dart' as http;

class Response {
  Map<String, dynamic> body;
  Response({required this.body});

  factory Response.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'body': Map<String, dynamic> body,
      } =>
        Response(body: body),
      _ => throw {
          print('resp body============${json}'),
          const FormatException('Failed to load body from the response'),
        }
    };
  }
}

class Db {
  String host_addr = '172.29.66.19';
  int port = 5000;

  // late String server_url;

  Future getData(String targetUrl, Map<String, dynamic> data) async {
    String serverUrl = "http://${host_addr}:${port.toString()}${targetUrl}";
    try {
      var resp = await http.post(Uri.parse(serverUrl),
          encoding: Encoding.getByName('utf-8'), body: jsonEncode(data));
      return jsonDecode(resp.body);
    } catch (e) {
      throw ("$e");
    }
  }
}
