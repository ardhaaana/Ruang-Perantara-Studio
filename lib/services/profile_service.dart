import 'dart:convert';
import 'package:tugas_akhir/models/user_model.dart';
import 'package:http/http.dart' as http;

class ProfileService {
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<bool> updateProfile(
      UserModel user, String password, String username) async {
    var url = Uri.parse('$baseUrl/user');
    var headers = {
      'Content-type': 'application/json',
      'Authorization': user.token,
    };
    var body = jsonEncode(
      {
        'name': user.name,
        'email': user.email,
        'username': user.username,
        'password': password,
      },
    );
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal melakukan update profile');
    }
  }
}