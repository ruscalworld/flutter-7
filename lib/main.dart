import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  bool _isLoading = false;

  void _incrementCounter() {
    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 1)).then((value) => {
      setState(() {
        _counter++;
        _isLoading = false;
      })
    });
  }

  void _decrementCounter() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _counter--;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = _isLoading
      ? const CircularProgressIndicator()
      : Text('$_counter', style: Theme.of(context).textTheme.headlineMedium);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            content,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _incrementCounter, child: const Icon(Icons.add)),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: _decrementCounter, child: const Icon(Icons.remove)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
