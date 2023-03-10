import 'package:flutter/material.dart';

class Calculadora1 extends StatefulWidget {
  const Calculadora1({Key? key}) : super(key: key);

  @override
  State<Calculadora1> createState() => _Calculadora1State();
}

class _Calculadora1State extends State<Calculadora1> {

  String result = "Informe seus Dados!";

  final heightController = TextEditingController();
  final weightController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  void calculate(){
    double height = double.parse(heightController.text)/100;
    double weight = double.parse(weightController.text);

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

  void resetAll(){
    setState(() {
      heightController.text = "";
      weightController.text = "";
      result = "Informe seus Dados!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Caluladora de IMC"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: resetAll, icon: const Icon(Icons.refresh))
        ],
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
                  onPressed: (){
                    if (_formkey.currentState!.validate()){
                      calculate();
                    }
                  },
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
    validator: (value){
      if (value == null || value.isEmpty){
        if (labelText == "Altura"){
          return "Informe sua Altura!";
        } else {
          return "Informe seu Peso!";
        }
      }
      return null;
    },
  );
}