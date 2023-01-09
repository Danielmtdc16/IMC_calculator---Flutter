import 'package:flutter/material.dart';

class Cartao extends StatelessWidget {

  const Cartao({Key? key, required this.cor, required this.filhoCard}) : super(key: key);

  final Color cor;
  final Widget filhoCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: filhoCard,
    );
  }
}
