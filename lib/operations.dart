import 'messages.dart';

abstract class IOperacao<T> {
  T executar(T input);
}

class PriorizarMensagem implements IOperacao<IMensagem> {
  @override
  IMensagem executar(IMensagem input) {
    return _priorizar(input);
  }

  //prioritiza a mensagem
  IMensagem _priorizar(IMensagem input) {
    input.prioridade = 1;
    return (input);
  }
}

class EncryptMessage implements IOperacao<IMensagem> {
  //executa a operacao na mensagem
  @override
  IMensagem executar(IMensagem input) {
    return _criptografar(input);
  }

  //encripta a mensagem
  IMensagem _criptografar(IMensagem input) {
    String? textoMensagem = input.corpo;
    String textoCriptografado = '';
    int key = 2;

    for (int i = 0; i < textoMensagem!.length; i++) {
      String char = textoMensagem[i];

      if (char.toLowerCase() != char.toUpperCase()) {
        // Converter pra ASCII
        int ascii = char.codeUnitAt(0);

        // Aplica a chave no código ASCII
        ascii = (ascii + key) % 256;

        // Converter de volta
        char = String.fromCharCode(ascii);
      }
      textoCriptografado += char;
    }
    input.corpoCriptografado = textoCriptografado;
    input.isCriptografado = true;
    return (input);
  }
}

class CapitalizarMensagem implements IOperacao<IMensagem> {
  @override
  IMensagem executar(IMensagem input) {
    return capitalizarMensagem(input);
  }

  IMensagem capitalizarMensagem(IMensagem input) {
    String? textoMensagem = input.corpo;
    var textoCapitalizado = textoMensagem![0].toUpperCase();
    for (int i = 1; i < textoMensagem.length; i++) {
      if (textoMensagem[i - 1] == " ") {
        textoCapitalizado = textoCapitalizado + textoMensagem[i].toUpperCase();
      } else {
        textoCapitalizado = textoCapitalizado + textoMensagem[i];
      }
    }
    input.corpo = textoCapitalizado;
    return input;
  }
}
