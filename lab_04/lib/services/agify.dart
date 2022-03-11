import 'dart:convert';

import 'package:http/http.dart';

class AgifyService {
  static String endpoint = "https://api.agify.io";

  const AgifyService();

  Future<int?> getAgeForName(String name) async {
    Response response = await get(Uri.parse(endpoint).replace(queryParameters: {
      "name": name,
    }));

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['age'];
    }
    throw Exception('error in getting age');
  }
}
