import 'package:flutter/material.dart';

class Cartao extends StatelessWidget {

  final Color cor;
  final Widget filhoCard;
  final VoidCallback aoPressionar;

  const Cartao({Key? key, required this.cor, required this.filhoCard, required this.aoPressionar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoPressionar,
      child: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: filhoCard,
      ),
    );
  }
}
