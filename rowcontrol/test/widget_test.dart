import 'package:flutter/material.dart';



class CadastroLogin extends StatelessWidget {
  // This widget is the root of your application.
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorTelefone = TextEditingController();
  final TextEditingController _controladorSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Novo Cadastro!'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controladorNome,
                decoration: InputDecoration(labelText: 'Nome'),
                keyboardType: TextInputType.text,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controladorTelefone,
                  decoration: InputDecoration(labelText: 'Telefone'),
                  keyboardType: TextInputType.phone,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  obscureText: true,
                  controller: _controladorSenha,
                  decoration: InputDecoration(labelText: 'Senha'),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: RaisedButton(
                    child: Text('Cadastrar'),
                    onPressed: () {
                      final String nome = _controladorNome.text;
                      final int telefone = int.tryParse(_controladorTelefone.text);
                      final String senha = _controladorSenha.text;

                      final Usuario usuarioNovo = Usuario(nome, telefone, senha);
                      print(usuarioNovo);
                    },
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Usuario {
  final String nome;
  final int telefone;
  final String senha;

  Usuario(
      this.nome,
      this.telefone,
      this.senha,
      );

  @override
  String toString() {
    return 'Usuario{nome: $nome, Telefone: $telefone, Senha: $senha}';
  }
}