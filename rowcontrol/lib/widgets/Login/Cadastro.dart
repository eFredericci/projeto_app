import 'package:flutter/material.dart';

class CadastroLogin extends StatefulWidget {
  @override
  _CadastroLoginState createState() => _CadastroLoginState();
}

class _CadastroLoginState extends State<CadastroLogin> {

  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorTelefone = TextEditingController();
  final TextEditingController _controladorSenha = TextEditingController();

  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  void _login() {
      _performLogin();
  }

  void _cadastro() {
    _performCadastro();

  }

  void _performLogin() {
    Navigator.of(context).pushNamed('/HomeLogin');
  }

  void _performCadastro() {
    final String nome = _controladorNome.text;
    final int telefone = int.tryParse(_controladorTelefone.text);
    final String senha = _controladorSenha.text;

    final Usuario usuarioNovo = Usuario(nome, telefone, senha);
    print(usuarioNovo);
  }

  @override
  Widget build(BuildContext context) {

    var loginBtn = new MaterialButton(
      onPressed: _login,
      height: 10.0,
      minWidth: double.infinity,
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      child: new Text("Voltar para tela de login!"),
    );

    var cadBtn = new MaterialButton(
      onPressed: _cadastro,
      height: 40.0,
      minWidth: double.infinity,
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      child: new Text("Cadastrar!"),
    );

    var cadform = new ListView(
      children: <Widget>[
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              color: Colors.blue.shade50,
              width: double.infinity,
              height: 80.0,
              child: new Padding(
                padding: const EdgeInsets.all(2.0),
                child: new AppBar(
                  title: new Text("Controle de fila"),
                ),
              ),
            ),
            new Divider(
              height: 1.0,
              color: Theme.of(context).primaryColor,
            ),
            new Padding(
              padding: const EdgeInsets.all(30.0),
              child: new Form(
                  key: formKey,
                  child: new Column(
                    children: <Widget>[
                      new TextFormField(
                        controller: _controladorNome,
                        decoration: InputDecoration(labelText: 'Nome'),
                        keyboardType: TextInputType.text,
                      ),
                      new TextFormField(
                        controller: _controladorTelefone,
                        decoration: InputDecoration(labelText: 'Telefone'),
                        keyboardType: TextInputType.phone,
                      ),
                      new TextFormField(
                        obscureText: true,
                        controller: _controladorSenha,
                        decoration: InputDecoration(labelText: 'Senha'),
                        keyboardType: TextInputType.text,
                      ),
                      new Padding(
                          padding: const EdgeInsets.only(bottom: 20.0)
                      ),
                      _isLoading ? new CircularProgressIndicator() : cadBtn,

                      new Padding( padding: const EdgeInsets.only(bottom: 5.0)
                      ),
                      _isLoading ? new CircularProgressIndicator() : loginBtn
                    ],
                  )
              ),
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      key: scaffoldKey,
      body: cadform,
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