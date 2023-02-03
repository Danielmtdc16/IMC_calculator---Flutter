import 'package:flutter/material.dart';
import 'package:imc2/imc_calculator_2/telas/tela_resultados.dart';
import 'telas/tela_principal.dart';
import 'constantes.dart';

void main(){
  runApp(MyApp());
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
      home: TelaPrincipal(),
    );
  }
}
