import 'package:flutter/material.dart';

class Imc extends StatefulWidget {
  const Imc({super.key});

  @override
  State<Imc> createState() => _ImcState();
}

class _ImcState extends State<Imc> {
  final _peso = TextEditingController();
  final _altura = TextEditingController();
  List<String> lista = [];
  double imc = 0;
  String resultado = '';

  void calcularIMC() {
    setState(() {
      if (double.parse(_altura.text) > 0) {
        imc = double.parse(_peso.text) /
            (double.parse(_altura.text) * double.parse(_altura.text));
        resultado = imc.roundToDouble().toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        backgroundColor: Colors.greenAccent,
      ),
      body: ListView(children: [
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Peso: ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 200,
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                style: const TextStyle(fontSize: 18),
                controller: _peso,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Altura: ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 200,
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                style: const TextStyle(fontSize: 18),
                controller: _altura,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
            ),
          ],
        ),
        const Divider(),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton(
            onPressed: () {
              if (_peso.text != "" && _altura.text != "") {
                calcularIMC();
                if (imc.roundToDouble() < 16) {
                  resultado += (' Magreza grave');
                  lista.add(resultado);
                } else if (imc.roundToDouble() >= 16 &&
                    imc.roundToDouble() < 17) {
                  resultado += (' Magreza moderada');
                  lista.add(resultado);
                } else if (imc.roundToDouble() >= 17 &&
                    imc.roundToDouble() < 18.5) {
                  resultado += (' Magreza leve');
                  lista.add(resultado);
                } else if (imc.roundToDouble() >= 18.5 &&
                    imc.roundToDouble() < 25) {
                  resultado += (' Saudável');
                  lista.add(resultado);
                } else if (imc.roundToDouble() >= 25 &&
                    imc.roundToDouble() < 30) {
                  resultado += (' Sobrepeso');
                  lista.add(resultado);
                } else if (imc.roundToDouble() >= 30 &&
                    imc.roundToDouble() < 35) {
                  resultado += (' Obesidade Grau I');
                  lista.add(resultado);
                } else if (imc.roundToDouble() >= 35 &&
                    imc.roundToDouble() < 40) {
                  resultado += (' Obesidade Grau II (severa)');
                  lista.add(resultado);
                } else if (imc.roundToDouble() >= 40) {
                  resultado += (' Obesidade Grau III (mórbida)');
                  lista.add(resultado);
                }
              } else {
                if (_peso.text == "" && _altura.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Informe seu peso e altura"),
                    backgroundColor: Colors.red,
                  ));
                } else {
                  if (_peso.text == "") {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Peso inválido"),
                      backgroundColor: Colors.red,
                    ));
                  } else if (_altura.text == "") {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Altura inválida"),
                      backgroundColor: Colors.red,
                    ));
                  }
                }
              }
            },
            child: Container(
              color: Colors.red,
              width: 130,
              height: 30,
              child: const Center(
                  child: Text(
                'CALCULAR IMC',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ]),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'IMC: ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              resultado,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(lista[index]),
              );
            },
          ),
        ),
      ]),
    );
  }
}
