import 'package:flutter/material.dart';
import 'package:imc2/imc_calculator_2/constantes.dart';
import '../widgets/cartao.dart';
import '../widgets/botao_inferior.dart';

class TelaResultados extends StatelessWidget {

  const TelaResultados({Key? key, required this.resultadoIMC, required this.resultadoTexto, required this.interpretacao}) : super(key: key);

  final String resultadoIMC;
  final String resultadoTexto;
  final String interpretacao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RESULTADO"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: const Text(
                "Resultado",
                style: ktituloTextStyle,
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: Cartao(
                cor: kcorAtivaCartao,
                filhoCard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultadoTexto.toUpperCase(),
                      style: kresultadoTextStyle,
                    ),
                    Text(
                      resultadoIMC,
                      style: kimcTextStyle,
                    ),
                    Text(
                      interpretacao,
                      style: kdescricaoResultadoTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
          ),
          BotaoInferior(
            aoPressionar: () {
              Navigator.pop(context);
            },
            infoBotao: "RECALCULAR",
          )
        ],
      ),
    );
  }
}
