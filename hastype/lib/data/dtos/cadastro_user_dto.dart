class CadastroUserDto{

  final String nome;
  final String email;
  final String senha;

  CadastroUserDto({required this.nome, required this.email, required this.senha});

   factory CadastroUserDto.fromJson(Map<String, dynamic> json) => CadastroUserDto(
        email: json["email"],
        nome: json["nome"],
        senha: json["senha"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "nome": nome,
        "senha": senha,
    };
}