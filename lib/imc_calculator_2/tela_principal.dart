import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cartao.dart';
import 'conteudo_icone.dart';

const Color corAtivaCartao = Color(0xFF9E9E9E);
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
              Expanded(child: Cartao(
                  cor: corAtivaCartao,
                  filhoCard: ConteudoIcone(
                      icone: FontAwesomeIcons.mars,
                      descricao: "MASCULINO",
                  ),
                ),
              ),
              Expanded(child: Cartao(
                  cor: corAtivaCartao,
                  filhoCard: ConteudoIcone(
                    icone: FontAwesomeIcons.venus,
                    descricao: "FEMININO",
                  ),
                ),
              ),
            ],
          ),),
          Expanded(child: Cartao(
            cor: corAtivaCartao,
            filhoCard: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("asdasd")
              ],
            ),
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: Cartao(
                cor: corAtivaCartao,
                  filhoCard: Text("")
              )),
              Expanded(child: Cartao(
                cor: corAtivaCartao,
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

