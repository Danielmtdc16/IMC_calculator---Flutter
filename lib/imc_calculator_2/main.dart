import 'package:flutter/material.dart';
import 'tela_principal.dart';
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
