import 'package:flutter/material.dart';
import 'tela_principal.dart';

const Color corDeFundo = Color(0xFF616161);


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: corDeFundo,
        scaffoldBackgroundColor: corDeFundo
      ),
      home: TelaPrincipal(),
    );
  }
}
