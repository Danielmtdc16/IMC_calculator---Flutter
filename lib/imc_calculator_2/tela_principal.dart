import 'package:flutter/material.dart';

const Color corAtivaCard = Color(0xFF9E9E9E);

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CALCULADORA DE IMC"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: Card(
                cor: corAtivaCard,
              )),
              Expanded(child: Card(
                cor: corAtivaCard,
              )),
            ],
          )),
          Expanded(child: Card(
            cor: corAtivaCard,
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: Card(
                cor: corAtivaCard,
              )),
              Expanded(child: Card(
                cor: corAtivaCard,
              )),
            ],
          )),
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {

  Card({required this.cor});

  final Color cor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
