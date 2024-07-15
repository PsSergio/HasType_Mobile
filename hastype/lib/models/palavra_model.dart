class PalavrasModel {
  late int id;
  late String palavraNormal;
  late String palavraTraduzida;

  PalavrasModel({required this.id,required this.palavraNormal,required this.palavraTraduzida});

  PalavrasModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    palavraNormal = json['palavraNormal'];
    palavraTraduzida = json['palavraTraduzida'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['palavraNormal'] = this.palavraNormal;
    data['palavraTraduzida'] = this.palavraTraduzida;
    return data;
  }
}