import 'package:flutter/material.dart';

class Pag2 extends StatefulWidget {
  const Pag2({super.key});

  @override
  State<Pag2> createState() => _Pag2State();
}

class _Pag2State extends State<Pag2> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  String _name = "";
  String _nota = "";
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
    var calc = double.tryParse(_nota.replaceAll(',', "."));
    setState(() {
      if (calc != null) {
        if (calc >= 6) {
          _resp = "Resultado: $_name foi aprovado!";
        } else {
          _resp = "Resultado: $_name foi reprovado!";
        }
      }else {
        _resp = "";
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
                        labelText: 'Nome:',
                      ),
                      onChanged: (value) {
                        _name = value;
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
                        labelText: 'Nota:',
                      ),
                      onChanged: (value) {
                        _nota = value;
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
