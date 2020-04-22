import 'package:flutter/material.dart';

class DetalhesLoja extends StatefulWidget {
  @override
  _DetalhesState createState() => _DetalhesState();
}

class _DetalhesState extends State<DetalhesLoja> {
  int _counter = 0;

  void _contadorCrescente() {
    setState(() {
      if(_counter <= 99) {
        _counter++;
      }
    });
  }
  void _contadorDecrescente() {
    setState(() {
      if(_counter > 0) {
        _counter--;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Detalhes"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Text(
              'Quantidade de pessoas?',
            ),
            new Container(
              margin: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0, bottom: 20.0),
              alignment: Alignment(0, 1),
              child: new Row(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(left: 20.0, top: 2.0, right: 10.0, bottom: 5.0),
                    child: MaterialButton(onPressed: _contadorDecrescente,
                      child: new Icon(Icons.exposure_neg_1),),
                  ),
                  new Container(
                    margin: EdgeInsets.only(left: 45.0, top: 2.0, right: 45.0, bottom: 5.0),
                    alignment: Alignment(0, 1),
                    child: new Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(left: 10.0, top: 2.0, right: 20.0, bottom: 5.0),
                    child: MaterialButton(onPressed: _contadorCrescente,
                      child: new Icon(Icons.exposure_plus_1),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
