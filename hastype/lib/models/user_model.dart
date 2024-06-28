class UserModel{

  final String id;
  final String email;
  final String nome;
  final String senha;

  UserModel({required this.id, required this.email, required this.nome, required this.senha});

  UserModel.fromJson(Map<String, dynamic> json):
    id = json['id'],
    email = json['email'],
    nome = json['nome'],
    senha = json['senha'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['nome'] = this.nome;
    data['senha'] = this.senha;
    return data;
  }

}