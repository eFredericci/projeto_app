import 'package:flutter/material.dart';
import 'package:rowcontrol/widgets/Login/Index.dart';
import 'package:rowcontrol/widgets/Login/SplashControl.dart';
import 'package:rowcontrol/widgets/Login/Cadastro.dart';
import 'package:rowcontrol/widgets/Home/Index.dart';
import 'package:rowcontrol/widgets/Home/DetalhesLoja.dart';



class RowControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const colorTheme = Colors.blue;
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primaryColor: colorTheme
      ),
      home: new SplashControl(colorTheme),
      routes: {
        '/HomeLogin': (context) => LoginPage(),
        '/cadastro': (context) => CadastroLogin(),
        '/homepage': (context) => HomePage(),
        '/detalhes': (context) => DetalhesLoja()
      },
    );
  }
}
class Routes {
  Routes() {
    runApp(RowControl(
  ));
}
}