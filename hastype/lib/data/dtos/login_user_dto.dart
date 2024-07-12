class LoginUserDto {
    final String email;
    final String senha;

    LoginUserDto({
        required this.email,
        required this.senha,
    });

    factory LoginUserDto.fromJson(Map<String, dynamic> json) => LoginUserDto(
        email: json["email"],
        senha: json["senha"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "senha": senha,
    };
}
