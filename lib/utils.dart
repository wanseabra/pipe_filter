import 'package:flutter/material.dart';

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;

class CheckboxTile extends StatelessWidget {
  const CheckboxTile({
    super.key,
    required this.titulo,
    required this.subtitulo,
    required this.isFiltroChecked,
    required this.callback,
  });

  final String titulo;
  final String subtitulo;
  final bool isFiltroChecked;
  final Function(bool) callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: CheckboxListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          titulo,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitulo,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        value: isFiltroChecked,
        tileColor:
            isFiltroChecked ? Colors.grey[300] : Theme.of(context).canvasColor,
        onChanged: (value) {
          callback(value!);
        },
      ),
    );
  }
}
