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
  int peso = 60;
  int idade = 18;

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
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Cartao(
                    aoPressionar: () {
                      setState(() {
                        sexoSelecionado = Sexo.masculino;
                      });
                    },
                    cor: sexoSelecionado == Sexo.masculino
                        ? kcorAtivaCartao
                        : kcorInativaCartao,
                    filhoCard: const ConteudoIcone(
                      icone: FontAwesomeIcons.mars,
                      descricao: "MASCULINO",
                    ),
                  ),
                ),
                Expanded(
                  child: Cartao(
                    aoPressionar: () {
                      setState(() {
                        sexoSelecionado = Sexo.feminino;
                      });
                    },
                    cor: sexoSelecionado == Sexo.feminino
                        ? kcorAtivaCartao
                        : kcorInativaCartao,
                    filhoCard: const ConteudoIcone(
                      icone: FontAwesomeIcons.venus,
                      descricao: "FEMININO",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Cartao(
                cor: kcorAtivaCartao,
                filhoCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "ALTURA",
                      style: kdescricaoTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(altura.toString(), style: knumeroTextStyle),
                        const Text(
                          "cm",
                          style: kdescricaoTextStyle,
                        )
                      ],
                    ),
                  Slider(
                    activeColor: kcorContainerInferior,
                    inactiveColor: kcorInativaCartao,
                    value: altura.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double value) {
                      setState(() {
                        altura = value.round();
                      });
                    },
                  ),
                ],
              ),
          ),),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Cartao(
                          cor: kcorAtivaCartao,
                          filhoCard: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "PESO",
                                style: kdescricaoTextStyle,
                              ),
                              Text(
                                peso.toString(),
                                style: knumeroTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BotaoArredondado(
                                    icone: FontAwesomeIcons.minus,
                                    aoPressionar: (){
                                      setState(() {
                                        peso--;
                                      });
                                    },
                                  ),

                                  const SizedBox(width: 10,),

                                  BotaoArredondado(
                                    icone: FontAwesomeIcons.plus,
                                    aoPressionar: (){
                                      setState(() {
                                        peso++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                      ),
                  ),
                  Expanded(
                      child: Cartao(
                          cor: kcorAtivaCartao,
                          filhoCard: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                  "IDADE",
                                  style: kdescricaoTextStyle,
                              ),
                              Text(
                                idade.toString(),
                                style: knumeroTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BotaoArredondado(
                                      icone: FontAwesomeIcons.minus,
                                      aoPressionar: (){
                                        setState(() {
                                          idade--;
                                        });
                                      }
                                  ),

                                  const SizedBox(width: 10,),

                                  BotaoArredondado(
                                      icone: FontAwesomeIcons.plus,
                                      aoPressionar: (){
                                        setState(() {
                                          idade++;
                                        });
                                      }
                                  ),
                                ],
                              ),
                            ],
                          ),
                      ),
                  ),
                ],
              )
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/segunda');
            },
            child: Container(
              color: kcorContainerInferior,
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: kalturaContainerInferior,
              alignment: Alignment.center,
              child: const Text("CALCULAR", style: TextStyle(color: Colors.white, fontSize: 30),),
            ),
          )
        ],
      ),
    );
  }
}

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
