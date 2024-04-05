import 'package:flutter/material.dart';
import 'package:spyware_gui/spyware/lib/spyware.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spyware GUI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Spyware GUI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isRunning = false;
  Spyware spyware = Spyware();

  void _toggleSpyware() {
    setState(() {
      if (isRunning) {
        spyware.stop();
      } else {
        spyware.start();
      }
      isRunning = !isRunning;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Spyware Status:',
            ),
            Text(
              isRunning ? 'Running' : 'Not Running',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleSpyware,
        tooltip: isRunning ? 'Stop Spyware' : 'Start Spyware',
        child: Icon(isRunning ? Icons.stop : Icons.play_arrow),
      ),
    );
  }
}
