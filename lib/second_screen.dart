import 'package:flutter/material.dart';

import 'messages.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key, required this.mensagem});
  final IMensagem mensagem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: const [
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Text(
              "Conteúdo da mensagem",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ),
        ]),
      ),
    );
  }
}
