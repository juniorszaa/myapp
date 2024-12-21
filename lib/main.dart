import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 231, 248, 0)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Clique no botão quando estiver entediado'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color _backgroundColor = Colors.white;

  void _incrementCounter() {
    setState(() {
      _counter++;

      // Verifica se o contador é múltiplo de 10
      if (_counter % 10 == 0) {
        // Altera a cor de fundo para vermelho
        setState(() {
          _backgroundColor = const Color.fromARGB(255, 226, 100, 100);
        });

        // Exibe a mensagem "Uau, você realmente está entediado!" usando um Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Uau, você realmente está entediado! Tente se animar!'),
            duration: Duration(seconds: 2), // Duração de 2 segundos
          ),
        );

        // Retorna a cor ao estado original após 2 segundos
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            _backgroundColor = Colors.white;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: _backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Quantas vezes você ficou entediado?',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
