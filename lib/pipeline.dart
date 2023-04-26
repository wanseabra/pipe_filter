import 'messages.dart';
import 'operations.dart';

abstract class PipelineBase<T> {
  final List<IOperacao<T>> operacoes = [];

  PipelineBase<T> registrar(IOperacao<T> operacao) {
    operacoes.add(operacao);
    return this;
  }

  T performarOperacao(T input) {
    return operacoes.fold(
        input, (current, operation) => operation.executar(current));
  }
}

class PipelineEnvio extends PipelineBase<IMensagem> {
  PipelineEnvio(
      bool encryptMessage, bool setPriority, bool capitalizarMensagem) {
    if (encryptMessage) {
      registrar(EncryptMessage());
    }
    if (setPriority) {
      registrar(PriorizarMensagem());
    }
    if (capitalizarMensagem) {
      registrar(CapitalizarMensagem());
    }
  }
}
