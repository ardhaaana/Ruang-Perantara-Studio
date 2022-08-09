import 'dart:convert';

import 'package:tugas_akhir/models/transfer_model.dart';
import 'package:http/http.dart' as http;

class TransferService {
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<TransferModel> index({
    String name,
    String number_rekening,
    String email,
    //String photo_transfer,
  }) async {
    var url = Uri.parse('$baseUrl/index');
    var headers = {'Content-type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'number_rekening': number_rekening,
      'email': email,
      //'photo_transfer': photo_transfer,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    // if (response.statusCode == 200) {
    //   var data = jsonDecode(response.body)['data'];
    //   TransferModel transfers = TransferModel.fromJson(data['transfers']);

    //   return transfers;
    // } else {
    //   throw Exception('Upload Gagal');
    // }

    
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      TransferModel user = TransferModel.fromJson(data['user']);

      return user;
    } else {
      throw Exception('Gagal upload');
    }
  }
  
}
