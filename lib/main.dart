import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String result = "Informe seus Dados!";

  final heightController = TextEditingController();
  final weightController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  void calculate(){
    double height = double.parse(heightController.text)/100;
    double weight = double.parse(heightController.text);

    setState(() {
      double imc = weight / (height * height);

      if (imc < 18.5){
        result = "Magreza. Imc = ${imc.toStringAsFixed(2)}";
      }
      else if (imc >= 18.5 && imc <= 24.9){
        result = "Normal. Imc = ${imc.toStringAsFixed(2)}";
      }
      else if (imc >= 25 && imc <= 29.9){
        result = "Sobrepeso. Imc = ${imc.toStringAsFixed(2)}";
      }
      else if (imc >= 30 && imc <= 34.9){
        result = "Obesidade Grau I. Imc = ${imc.toStringAsFixed(2)}";
      }
      else if (imc >= 35 && imc <= 39.9){
        result = "Obesidade Grau II. Imc = ${imc.toStringAsFixed(2)}";
      }
      else if (imc > 40){
        result = "Obesidade Grau III. Imc = ${imc.toStringAsFixed(2)}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Caluladora de IMC"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 40),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildTextField("Altura", "cm", heightController),
              const SizedBox(height: 20,),
              buildTextField("Peso", "kg", weightController),
              const SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: calculate,
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(0, 50)
                  ),
                  child: const Text("Calcular", style: TextStyle(fontSize: 19),)
              ),
              const SizedBox(height: 20,),
              Container(
                height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blue
                ),
                child: Center(child: Text(result,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 19
                  ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildTextField(String labelText, String suffixText, TextEditingController controller){
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: labelText,
      suffixText: suffixText,
      border: const OutlineInputBorder(),
    ),
    keyboardType: TextInputType.number,
  );
}