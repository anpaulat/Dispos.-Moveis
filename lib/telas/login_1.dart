import 'package:flutter/material.dart';
import 'package:flutter_trab_1/repositories/pizzas_repository.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trab_1/telas/cardapio_1.dart';
import 'package:intl/intl.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  final _form = GlobalKey<FormState>();
  final _form2 = GlobalKey<FormState>();
  final _valor = TextEditingController();
  final _valor2 = TextEditingController();

  logar() {
    if (_form.currentState!.validate() && _form2.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => Cardapio()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login realizado com sucesso!')),
      );
    }
  }

  Widget build(BuildContext context) {
    final tabela = PizzasRepository.tabela;
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
            ),
            Form(
              key: _form,
              child: TextFormField(
                controller: _valor,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Login',
                  prefixIcon: Icon(Icons.person),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o Login';
                  } else if (value.length > 20) {
                    return 'Login é muito grande';
                  } else if (value.length < 5) {
                    return 'Login é muito pequeno';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            SizedBox(height: 10),
            Form(
              key: _form2,
              child: TextFormField(
                controller: _valor2,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                  prefixIcon: Icon(Icons.vpn_key),
                ),
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe a senha';
                  } else if (value.length > 20) {
                    return 'A senha é muito grande';
                  } else if (value.length < 5) {
                    return 'A senha é muito pequena';
                  } else {
                    return null;
                  }
                },
                obscureText: true,
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(top: 24),
              child: ElevatedButton(
                onPressed: logar,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Entrar',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
