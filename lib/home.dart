import 'package:atividadefinal/src/paginas/abastecimento_list.dart';
import 'package:atividadefinal/src/paginas/veiculos_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final usuario = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Bem-vindo\n${usuario?.email}\n",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                child: Text("Gerenciar Veículos"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => VeiculoListPage()),
                  );
                },
              ),
              ElevatedButton(
                child: Text("Gerenciar Abastecimentos"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => AbastecimentoListPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
