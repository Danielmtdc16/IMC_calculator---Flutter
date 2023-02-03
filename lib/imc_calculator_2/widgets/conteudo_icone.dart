import 'package:flutter/material.dart';
import '../constantes.dart';

class ConteudoIcone extends StatelessWidget {

  const ConteudoIcone({Key? key, required this.icone, required this.descricao}) : super(key: key);

  final IconData icone;
  final String descricao;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icone, size: 70,),
        const SizedBox(height: 10,),
        Text(descricao, style: kdescricaoTextStyle ,)
      ],
    );
  }
}