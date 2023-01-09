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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Caluladora de IMC"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildTextField("Altura", "cm"),
            const SizedBox(height: 20,),
            buildTextField("Peso", "kg"),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(0, 50)
                ),
                child: const Text("Calcular", style: TextStyle(fontSize: 19),)
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildTextField(String labelText, String suffixText){
  return TextField(
    decoration: InputDecoration(
      labelText: labelText,
      suffixText: suffixText,
      border: const OutlineInputBorder(),
    ),
  );
}