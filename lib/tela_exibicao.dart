import 'package:flutter/material.dart';
import 'package:imc2/imc_calculator_1/calculadora_imc_1.dart';
import 'package:imc2/imc_calculator_2/telas/tela_principal.dart';
import 'imc_calculator_2/constantes.dart';

class TelaExibicao extends StatefulWidget {
  const TelaExibicao({Key? key}) : super(key: key);

  @override
  State<TelaExibicao> createState() => _TelaExibicaoState();
}

class _TelaExibicaoState extends State<TelaExibicao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Escolha uma das duas calculadoras.",
                style: kdescricaoTextStyle,
              ),
              const Text(
                "A calculadora 2 é a mais elaborada. ;)",
                style: kdescricaoTextStyle,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Calculadora1()));
                },
                child: const Text("Calculadora 1"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TelaPrincipal()));
                },
                child: const Text("Calculadora 2"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
