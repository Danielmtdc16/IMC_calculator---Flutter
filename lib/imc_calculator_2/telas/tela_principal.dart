import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imc2/imc_calculator_2/telas/tela_resultados.dart';
import '../widgets/botao_arredondado.dart';
import '../widgets/botao_inferior.dart';
import '../widgets/cartao.dart';
import '../widgets/conteudo_icone.dart';
import '../constantes.dart';
import '../models/calculadora_imc.dart';

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
          BotaoInferior(
            aoPressionar: (){

              CalculadoraIMC calc = CalculadoraIMC(
                  altura: altura,
                  peso: peso
              );

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TelaResultados(
                        resultadoIMC: calc.calcularIMC(),
                        resultadoTexto: calc.obterResultado(),
                        interpretacao: calc.obterInterpretacao(),
                      )
                  )
              );
            },
            infoBotao: "CALCULAR",
          )
        ],
      ),
    );
  }
}


