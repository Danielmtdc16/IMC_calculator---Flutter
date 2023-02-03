import 'package:flutter/material.dart';
import '../constantes.dart';

class BotaoInferior extends StatelessWidget {
  const BotaoInferior({
    super.key,
    required this.aoPressionar,
    required this.infoBotao,
  });

  final VoidCallback aoPressionar;
  final String infoBotao;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoPressionar,
      child: Container(
        color: kcorContainerInferior,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(bottom: 25),
        width: double.infinity,
        height: kalturaContainerInferior,
        child: Center(child: Text(infoBotao, style: const TextStyle(color: Colors.white, fontSize: 30),)),
      ),
    );
  }
}