import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'src/services/auth_service.dart';
import 'src/usuarios/login.dart';
import 'src/paginas/abastecimento_form.dart';
import 'src/paginas/abastecimento_list.dart';
import 'src/paginas/veiculos_list.dart';

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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.deepOrange,
              ),
              accountEmail: Text(usuario?.email ?? "Usuário"),
              accountName: const Text("Bem-vindo!"),
            ),
            ListTile(
              leading:
                  const Icon(Icons.directions_car_filled, color: Colors.blue),
              title: const Text("Meus Veículos"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => VeiculoListPage()),
                );
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.local_gas_station, color: Colors.orange),
              title: const Text("Registrar Abastecimento"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AbastecimentoFormPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.history,
                color: Colors.green,
              ),
              title: const Text("Meus Abastecimentos"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AbastecimentoListPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.graphic_eq,
                color: Colors.deepPurple,
              ),
              title: const Text("Grafico de Custos"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => GraficoPage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Sair", style: TextStyle(color: Colors.red)),
              onTap: () async {
                await AuthService().logout();

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
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
            ],
          ),
        ),
      ),
    );
  }
}
