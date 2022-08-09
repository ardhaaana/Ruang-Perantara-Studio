class KategoriModel {
  int id;
  String name;

  KategoriModel({
    this.id,
    this.name,
  });

  KategoriModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
