import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _usuario, _senha;

  void _login() {
    final form = formKey.currentState;
    if(form.validate()) {
      form.save();
      _performLogin();
    }
  }

  void _cadastro() {
      _performCadastro();

  }

  void _performLogin() {
    Navigator.of(context).pushNamed('/homepage');
  }

  void _performCadastro() {
    Navigator.of(context).pushNamed('/cadastro');
  }

  @override
  Widget build(BuildContext context) {

    var loginBtn = new MaterialButton(
      onPressed: _login,
      height: 40.0,
      minWidth: double.infinity,
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      child: new Text("ENTRAR"),
    );

    var cadBtn = new MaterialButton(
      onPressed: _cadastro,
      height: 10.0,
      minWidth: double.infinity,
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      child: new Text("Cadastrar novo usuário!"),
    );

    var loginForm = new ListView(
      children: <Widget>[
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              color: Colors.white,
              width: double.infinity,
              height: 150.0,
              child: new Padding(
                padding: const EdgeInsets.all(0.0),
                child: new Image.asset('assets/LogoTipo/logo1.jpg'),
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
                        onSaved: (val) => _usuario = val,
                        validator: (val) {
                          return val.isEmpty
                              ? "Digite seu Telefone"
                              : null;
                        },
                        decoration: new InputDecoration(labelText: "Telefone"),
                      ),
                      new Padding(
                          padding: const EdgeInsets.only(bottom: 20.0)
                      ),
                      new TextFormField(
                        onSaved: (val) => _senha = val,
                        validator: (val) {
                          return val.isEmpty
                              ? "Digite sua senha"
                              : null;
                        },
                        obscureText: true,
                        decoration: new InputDecoration(labelText: "Senha"),
                      ),
                      new Padding(
                          padding: const EdgeInsets.only(bottom: 20.0)
                      ),
                      _isLoading ? new CircularProgressIndicator() : loginBtn,

                      new Padding( padding: const EdgeInsets.only(bottom: 5.0)
                      ),
                      _isLoading ? new CircularProgressIndicator() : cadBtn
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
      body: loginForm,
    );
  }
}
