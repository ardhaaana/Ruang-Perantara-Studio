import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tugas_akhir/models/transfer_model.dart';
import 'package:tugas_akhir/services/transfer_service.dart';

class TransferProvider with ChangeNotifier {
  TransferModel _transfer;

  TransferModel get transfers => _transfer;

  set transfers(TransferModel transfers) {
    _transfer = transfers;
    notifyListeners();
  }

  Future<bool> index(
      {String name, String number_rekening, String email}) async {
    try {
      TransferModel user = await TransferService().index(
        name: name,
        number_rekening: number_rekening,
        email: email,
        //photo_transfer: photo_transfer,
      );
      _transfer = transfers;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
