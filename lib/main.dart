import 'package:flutter/material.dart';

void main() {
  runApp(const TechFixApp());
}

class TechFixApp extends StatelessWidget {
  const TechFixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechFix OS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Map<String, String>> _ordens = [
    {
      'os': '1001',
      'cliente': 'João Silva',
      'aparelho': 'iPhone 11',
      'status': 'Aguardando Peça',
      'valor': '350.00'
    },
    {
      'os': '1002',
      'cliente': 'Maria Souza',
      'aparelho': 'Samsung S21',
      'status': 'Em Conserto',
      'valor': '480.00'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TechFix OS - Balcão'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: _ordens.length,
        itemBuilder: (context, index) {
          final item = _ordens[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: Text('#${item['os']}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight: FontWeight.bold)),
              ),
              title: Text('${item['cliente']} - ${item['aparelho']}'),
              subtitle: Text('Status: ${item['status']}'),
              trailing: Text('R\$ ${item['valor']}', style: const TextStyle(fontWeight: FontWeight: FontWeight.bold, color: Colors.green)),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Formulário de Nova O.S. pronto para integração!')),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Nova O.S.'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
    );
  }
}
