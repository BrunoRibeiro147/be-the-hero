import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  getData() async {
    List incidents;
    http.Response response =
        await http.get('http://192.168.1.57:3333/incidents');
    incidents = json.decode(response.body);
    String count = response.headers['x-total-count'];
    return {"incidents": incidents, "count": count};
  }
}
