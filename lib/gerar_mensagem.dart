import 'messages.dart';
import 'pipeline.dart';

IMensagem gerarMensagem(String msg, bool filtro1, bool filtro2, bool filtro3) {
  IMensagem message = Mensagem(corpo: msg);
  PipelineEnvio pipelineEnvio = PipelineEnvio(filtro1, filtro2, filtro3);
  return pipelineEnvio.performarOperacao(message);
}
