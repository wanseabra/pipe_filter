abstract class IMensagem {
  late int prioridade;
  late bool isCriptografado;
  String? corpoCriptografado;
  String? corpo;

  bool isMensagemCriptografada();
  bool isMensagemPrioritaria();
}

class Mensagem implements IMensagem {
  @override
  int prioridade = 0;
  @override
  bool isCriptografado = false;
  @override
  String? corpoCriptografado;
  @override
  String? corpo;

  @override
  bool isMensagemCriptografada() {
    return isCriptografado;
  }

  @override
  bool isMensagemPrioritaria() {
    return (prioridade != 0);
  }

  Mensagem({this.corpo});
}
