import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double distancia = 0.0;
  double corrente = 0.0;

  double bitola110 = 0.0;
  double bitola220 = 0.0;

  String resultado = "Resultado";

  void calcular() {
    setState(() {
      bitola110 = (2 * corrente * distancia) / 294.64;
      bitola220 = (2 * corrente * distancia) / 510.4;

      resultado =
          " A bitola recomendada para Tensão 110V é: ${bitola110.toStringAsFixed(2)} mm²\n"
          " A bitola recomendada para Tensão 220V é: ${bitola220.toStringAsFixed(2)} mm²";
    });

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Resultado"),
          content: Text(resultado),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),

        appBar: AppBar(
          title: const Text(
            "Calculadora de Bitola (mm²)",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF4F3195), 
        ),

        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Elétrica residencial (cabos de cobre)",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),

                TextField(
                  decoration: const InputDecoration(
                    hintText: "Distância (metros)",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    distancia = double.parse(value);
                  },
                ),

                const SizedBox(height: 20),

                TextField(
                  decoration: const InputDecoration(
                    hintText: "Corrente (A)",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    corrente = double.parse(value);
                  },
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: calcular,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4F3195), 
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Calcular"),
                ),

                const SizedBox(height: 20),

                Text(
                  "A bitola recomendada para Tensão 110V é: ${bitola110.toStringAsFixed(2)} mm²\n"
                  "A bitola recomendada para Tensão 220V é: ${bitola220.toStringAsFixed(2)} mm²",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}