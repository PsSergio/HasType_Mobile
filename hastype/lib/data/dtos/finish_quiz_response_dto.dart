class FinishQuizResponseDto {
  late int pontuacao;
  late String id;
  late String userId;

  FinishQuizResponseDto({required this.pontuacao, required this.id, required this.userId});

  FinishQuizResponseDto.fromJson(Map<String, dynamic> json) {
    pontuacao = json['pontuacao'];
    id = json['id'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pontuacao'] = this.pontuacao;
    data['id'] = this.id;
    data['userId'] = this.userId;
    return data;
  }
}
