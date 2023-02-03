import 'dart:math';

class CalculadoraIMC {

  CalculadoraIMC({required this.altura, required this.peso});

  final int altura;
  final int peso;
  double _imc = 0;

  String calcularIMC(){
    _imc = peso / pow(altura/100, 2);
    return _imc.toStringAsFixed(1);
  }

  String obterResultado(){
    if(_imc >= 25){
      return "Acima do Peso";
    } else if(_imc > 18.5){
      return "Peso Normal";
    } else {
      return "Abaixo do Peso";
    }
  }

  String obterInterpretacao(){
    if(_imc >= 25){
      return "Você está acima do peso, tente se exercitar mais!";
    } else if(_imc > 18.5){
      return "Parabéns! Seu peso está normal, mas não deixe de se exercitar.";
    } else {
      return "Oww, tente comer mais...";
    }
  }

}

