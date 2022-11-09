import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Conversor - MinTic'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class calculadora {
  final titulo;
  final color;
  final icono;

  calculadora(this.titulo, this.color, this.icono);
}

List<calculadora> cal = <calculadora>[
  calculadora("9", Colors.blueAccent, Icon(Icons.abc)),
  calculadora("8", Colors.blueAccent, Icon(Icons.abc)),
  calculadora("7", Colors.blueAccent, Icon(Icons.abc)),
  calculadora("6", Colors.blueAccent, Icon(Icons.abc)),
  calculadora("5", Colors.blueAccent, Icon(Icons.abc)),
  calculadora("4", Colors.blueAccent, Icon(Icons.abc)),
  calculadora("3", Colors.blueAccent, Icon(Icons.abc)),
  calculadora("2", Colors.blueAccent, Icon(Icons.abc)),
  calculadora("1", Colors.blueAccent, Icon(Icons.abc)),
  calculadora("0", Colors.blueAccent, Icon(Icons.abc)),
  calculadora("Limpiar", Colors.blueAccent, Icon(Icons.cleaning_services)),
  calculadora("=", Colors.blueAccent, Icon(Icons.abc)),
];

final textOrigen = TextEditingController();
final textDestino = TextEditingController();

String opcion_1 = "USD";
String opcion_2 = "COP";

int USD_COP = 4974;
int EUR_COP = 4966;
int USD_EUR = 1;

List<DropdownMenuItem<String>> ListaMoneda = <DropdownMenuItem<String>>[
  DropdownMenuItem(value: "USD", child: Text("USD")),
  DropdownMenuItem(value: "EUR", child: Text("EUR")),
  DropdownMenuItem(value: "COP", child: Text("COP")),
];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              children: [
                Text("Moneda Origen: "),
                DropdownButton(
                    value: opcion_1,
                    items: ListaMoneda,
                    onChanged: (String? x) {
                      setState(() {
                        opcion_1 = x.toString();
                      });
                    }),
                Text("Moneda Destino: "),
                DropdownButton(
                    value: opcion_2,
                    items: ListaMoneda,
                    onChanged: (String? x) {
                      setState(() {
                        opcion_2 = x.toString();
                      });
                    }),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textOrigen,
                decoration: InputDecoration(
                    labelText: "Moneda de Origen",
                    hintText: "0",
                    icon: Icon(Icons.monetization_on_outlined)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textDestino,
                decoration: InputDecoration(
                    labelText: "Moneda de Destino",
                    hintText: "0",
                    icon: Icon(Icons.monetization_on_outlined)),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: cal.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      color: cal[index].color,
                      child: ListTile(
                        title: Center(
                          child: index == 10
                              ? cal[index].icono
                              : Text(
                                  cal[index].titulo,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35),
                                ),
                        ),
                        onTap: () {
                          if (index < 10) {
                            textOrigen.text =
                                textOrigen.text + cal[index].titulo;
                          } else if (index == 10) {
                            textOrigen.clear();
                            textDestino.clear();
                          } else if (index == 11) {
                            if (opcion_1 == "USD" && opcion_2 == "COP") {
                              textDestino.text =
                                  (double.parse(textOrigen.text) * USD_COP)
                                      .toString();
                            } else if (opcion_1 == "COP" && opcion_2 == "USD") {
                              textDestino.text =
                                  (double.parse(textOrigen.text) / USD_COP)
                                      .toString();
                            } else if (opcion_1 == "EUR" && opcion_2 == "COP") {
                              textDestino.text =
                                  (double.parse(textOrigen.text) * EUR_COP)
                                      .toString();
                            } else if (opcion_1 == "COP" && opcion_2 == "EUR") {
                              textDestino.text =
                                  (double.parse(textOrigen.text) / EUR_COP)
                                      .toString();
                            } else if (opcion_1 == "USD" && opcion_2 == "EUR") {
                              textDestino.text =
                                  (double.parse(textOrigen.text) * USD_EUR)
                                      .toString();
                            } else if (opcion_1 == "EUR" && opcion_2 == "USD") {
                              textDestino.text =
                                  (double.parse(textOrigen.text) / USD_EUR)
                                      .toString();
                            } else {
                              textDestino.text = textOrigen.text;
                            }
                            print(cal[index].titulo);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
