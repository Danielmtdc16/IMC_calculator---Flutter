import 'package:flutter/material.dart';
import '../constantes.dart';


class BotaoArredondado extends StatelessWidget {

  const BotaoArredondado({Key? key, required this.icone, required this.aoPressionar}) : super(key: key);

  final IconData icone;
  final VoidCallback aoPressionar;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: aoPressionar,
      elevation: 6,
      shape: const CircleBorder(),
      fillColor: kcorDeFundo,
      constraints: const BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      child: Icon(icone),
    );
  }
}