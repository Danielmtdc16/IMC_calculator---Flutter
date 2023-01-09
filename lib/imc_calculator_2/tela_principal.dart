import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const Color corAtivaCard = Color(0xFF9E9E9E);
const Color corContainerInferior = Color(0xFFFF5822);
const double alturaContainerInferior = 80.0;

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
            children: const [
              Expanded(child: Card(
                cor: corAtivaCard,
                filhoCard: ConteudoIcone(
                  icone: FontAwesomeIcons.mars,
                  descricao: "MASCULINO",
                ),
              )),
              Expanded(child: Card(
                cor: corAtivaCard,
                filhoCard: ConteudoIcone(
                    icone: FontAwesomeIcons.venus,
                    descricao: "FEMININO"
                ),
              )),
            ],
          )),
          Expanded(child: Card(
            cor: corAtivaCard,
            filhoCard: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("asdasd")
              ],
            ),
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: Card(
                cor: corAtivaCard,
                  filhoCard: Text("")
              )),
              Expanded(child: Card(
                cor: corAtivaCard,
                  filhoCard: Text("")
              )),
            ],
          )),
          Container(
            color: corContainerInferior,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: alturaContainerInferior,
          )
        ],
      ),
    );
  }
}

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
        Text(descricao, style: const TextStyle(fontSize: 20, color: Colors.black),)
      ],
    );
  }
}

class Card extends StatelessWidget {

  const Card({Key? key, required this.cor, required this.filhoCard}) : super(key: key);

  final Color cor;
  final Widget filhoCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: filhoCard,
    );
  }
}

class asd extends StatelessWidget {
  const asd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
