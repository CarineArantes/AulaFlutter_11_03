import 'package:flutter/material.dart';

class Pag2 extends StatefulWidget {
  const Pag2({super.key});

  @override
  State<Pag2> createState() => _Pag2State();
}

class _Pag2State extends State<Pag2> with SingleTickerProviderStateMixin {
  late AnimationController _controller;


  String _nota1 = "";
  String _nota2 = "";
  String _nota3 = "";
  String _nota4 = "";
  String _resp = "";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _verification() {
    var n1 = double.tryParse(_nota1.replaceAll(',', "."));
    var n2 = double.tryParse(_nota2.replaceAll(',', "."));
    var cb1 = n1! / n2!;
    var n3 = double.tryParse(_nota3.replaceAll(',', "."));
    var n4 = double.tryParse(_nota4.replaceAll(',', "."));
    var cb2 = n3! / n4!;

    setState(() {
      if (cb1 > cb2) {
        _resp = "Mais barato: Produto A.";
      } else if (cb1 < cb2) {
        _resp = "Mais barato: Produto B.";
      } else {
        _resp = "Voce escolhe !!!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado final:'),
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.all(15),
                    width: 500,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Qtd Produto A:',
                      ),
                      onChanged: (value) {
                        _nota1 = value;
                      },
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.all(15),
                    width: 500,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Valor prduto A:',
                      ),
                      onChanged: (value) {
                        _nota2 = value;
                      },
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.all(15),
                    width: 500,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Qtd Prduto B:',
                      ),
                      onChanged: (value) {
                        _nota3 = value;
                      },
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.all(15),
                    width: 500,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Valor produto B:',
                      ),
                      onChanged: (value) {
                        _nota4 = value;
                      },
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.all(15),
                    width: 500,
                    child: Text(_resp)),
              ],
            ),
            ElevatedButton(
                onPressed: _verification, child: const Text('Resultado')),
          ],
        ),
      ),
    );
  }
}
