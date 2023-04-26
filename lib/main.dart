import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pipe_filter/messages.dart';
import 'package:pipe_filter/utils.dart';
import 'gerar_mensagem.dart';

void main() {
  runApp(const PipesAndFilters());
}

class PipesAndFilters extends StatelessWidget {
  const PipesAndFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: primaryBlack),
        home: const PipeFilterHome());
  }
}

class PipeFilterHome extends StatefulWidget {
  const PipeFilterHome({super.key});

  @override
  State<PipeFilterHome> createState() => _PipeFilterHomeState();
}

class _PipeFilterHomeState extends State<PipeFilterHome> {
  bool isFiltro1Checked = false;
  bool isFiltro2Checked = false;
  bool isFiltro3Checked = false;
  bool activeColor = false;
  final _textController = TextEditingController();
  IMensagem? mensagem;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          // appBar: AppBar(
          //   title: const Text("Pipes and Filters"),
          // ),
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      "Pipe and Filter",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20, top: 3),
                    child: Text(
                      "Demonstração da arquitetura Pipe and Filter",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 1),
                    child: TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                          label: Text("Digite aqui o texto"),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey))),
                    ),
                  ),
                  CheckboxTile(
                    titulo: "Criptografada",
                    subtitulo:
                        "Clique aqui se deseja que a mensagem seja criptografada",
                    isFiltroChecked: isFiltro1Checked,
                    callback: (p0) {
                      setState(() {
                        isFiltro1Checked = p0;
                      });
                    },
                  ),
                  CheckboxTile(
                    titulo: "Prioridade",
                    subtitulo:
                        "Clique aqui se deseja que a mensagem tenha alta prioridade",
                    isFiltroChecked: isFiltro2Checked,
                    callback: (p0) {
                      setState(() {
                        isFiltro2Checked = p0;
                      });
                    },
                  ),
                  CheckboxTile(
                    titulo: "Capitalizar Mensagem",
                    subtitulo: "Clique aqui se deseja capitalizar a mensagem",
                    isFiltroChecked: isFiltro3Checked,
                    callback: (p0) {
                      setState(() {
                        isFiltro3Checked = p0;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      if (_textController.text != '') {
                        setState(() {
                          mensagem = gerarMensagem(
                              _textController.text,
                              isFiltro1Checked,
                              isFiltro2Checked,
                              isFiltro3Checked);
                        });
                        _textController.clear();
                        return FocusScope.of(context).unfocus();
                      } else {
                        Fluttertoast.showToast(
                            msg: "O campo de texto está vazio",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            fontSize: 16.0);
                      }
                    },
                    customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Ink(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blue),
                      height: 50,
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            '"Enviar" a mensagem',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (mensagem != null)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: RichText(
                            text: TextSpan(
                                text: "Dados da mensagem:\n",
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                children: [
                              const TextSpan(
                                  text: "Corpo da mensagem: ",
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal)),
                              TextSpan(
                                  text: "${mensagem!.corpo}.\n",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              if (mensagem!.isMensagemCriptografada()) ...[
                                const TextSpan(
                                    text: "Corpo da mensagem (criptografado): ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal)),
                                TextSpan(
                                    text: "${mensagem!.corpoCriptografado}.\n",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ],
                              const TextSpan(
                                  text: "A mensagem tem prioridade? ",
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal)),
                              TextSpan(
                                  text:
                                      "${mensagem!.isMensagemPrioritaria() ? "Sim" : "Não"}\n",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: mensagem!.isMensagemPrioritaria()
                                          ? Colors.green[700]
                                          : Colors.black)),
                            ])),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
