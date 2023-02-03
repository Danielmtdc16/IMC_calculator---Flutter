import 'package:flutter/material.dart';
import 'package:imc2/tela_exibicao.dart';
import 'imc_calculator_2/constantes.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: kcorDeFundo,
        scaffoldBackgroundColor: kcorDeFundo
      ),
      home: const TelaExibicao(),
    );
  }
}
