import 'package:clima_interior/utilities/constantes.dart';
import 'package:flutter/material.dart';

class Localidade extends StatefulWidget {
  Localidade({required this.local, required this.temperatura, required this.iconeClima});

  final String local;
  final int temperatura;
  final String iconeClima;

  @override
  _LocalidadeState createState() => _LocalidadeState();
}

class _LocalidadeState extends State<Localidade> {

  @override
  Widget build(BuildContext context) {
    return 
       Column(
          children: <Widget>[
            Text(
              '${widget.local}',
              style: kLocalidadeTextStyle,
            ),            
            Text(
              '${widget.temperatura}°',
              style: kTempTextStyle,
            ),
            Text(
              '${widget.iconeClima}',
              style: kConditionTextStyle,
            ),
          ],
        );
  }

}