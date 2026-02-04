import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'config.dart'; // Import your config file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("BLESS A HOMIE Check")),
        body: const ConnectionTester(),
      ),
    );
  }
}

class ConnectionTester extends StatefulWidget {
  const ConnectionTester({super.key});

  @override
  State<ConnectionTester> createState() => _ConnectionTesterState();
}

class _ConnectionTesterState extends State<ConnectionTester> {
  String _status = "Press button to test connection";

  Future<void> _testConnection() async {
    setState(() => _status = "Connecting...");
    
    try {
      // USE THE CONFIG HERE!
      final url = Uri.parse('${ApiConfig.baseUrl}/db-test');
      print("Trying to connect to: $url");
      
      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() => _status = "Success! \n${response.body}");
      } else {
        setState(() => _status = "Error: ${response.statusCode}");
      }
    } catch (e) {
      setState(() => _status = "Failed: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_status, textAlign: TextAlign.center),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _testConnection,
            child: const Text("Test Database Connection"),
          ),
        ],
      ),
    );
  }
}