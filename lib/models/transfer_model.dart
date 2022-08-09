class TransferModel {
  int id;
  String name;
  String number_rekening;
  String email;
  //String photo_transfer;

  TransferModel({
    this.id,
    this.name,
    this.number_rekening,
    this.email,
    //this.photo_transfer,
  });

  TransferModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number_rekening = json['number_rekening'];
    email = json['email'];
    //photo_transfer = json['photo_transfer'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'number_rekening': number_rekening,
      'email': email,
      //'photo_transfer': photo_transfer,
    };
  }
}
