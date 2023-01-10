import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cartao.dart';
import 'conteudo_icone.dart';
import 'constantes.dart';

enum Sexo {
  masculino,
  feminino,
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {

  Sexo? sexoSelecionado;
  int altura = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CALCULADORA DE IMC"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: Cartao(
                  aoPressionar: (){
                    setState(() {
                      sexoSelecionado = Sexo.masculino;
                    });
                  },
                  cor: sexoSelecionado == Sexo.masculino
                      ? kcorAtivaCartao : kcorInativaCartao,
                  filhoCard: const ConteudoIcone(
                      icone: FontAwesomeIcons.mars,
                      descricao: "MASCULINO",
                  ),
                ),
              ),
              Expanded(child: Cartao(
                aoPressionar: () {
                  setState(() {
                    sexoSelecionado = Sexo.feminino;
                  });
                },
                  cor: sexoSelecionado == Sexo.feminino
                      ? kcorAtivaCartao : kcorInativaCartao,
                  filhoCard: const ConteudoIcone(
                    icone: FontAwesomeIcons.venus,
                    descricao: "FEMININO",
                  ),
                ),
              ),
            ],
          ),),
          Expanded(child: Cartao(
            aoPressionar: (){},
            cor: kcorAtivaCartao,
            filhoCard: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("ALTURA", style: kdescricaoTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(altura.toString(), style: knumeroTextStyle),
                    Text("cm", style: kdescricaoTextStyle,)
                  ],
                ),
                Slider(
                    activeColor: kcorContainerInferior,
                    inactiveColor: kcorInativaCartao,
                    value: altura.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double value){
                      setState(() {
                        altura = value.round();
                      });
                    },
                ),
              ],
            ),
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: Cartao(
                  aoPressionar: (){},
                cor: kcorAtivaCartao,
                  filhoCard: Text("")
              )),
              Expanded(child: Cartao(
                  aoPressionar: (){},
                cor: kcorAtivaCartao,
                  filhoCard: Text("")
              )),
            ],
          )),
          Container(
            color: kcorContainerInferior,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: kalturaContainerInferior,
          )
        ],
      ),
    );
  }
}

