import 'package:clima_interior/utilities/constantes.dart';
import 'package:flutter/material.dart';

class Localidade extends StatefulWidget {
  Localidade({required this.local, required this.temperatura, required this.sensacao, required this.iconeClima});

  final String local;
  final double temperatura;
  final double sensacao;
  final String iconeClima;

  @override
  _LocalidadeState createState() => _LocalidadeState();
}

class _LocalidadeState extends State<Localidade> {

  @override
  Widget build(BuildContext context) {
    return 
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${widget.local}',
                  style: kLocalidadeTextStyle,
                ),            
                Text(''),
                Text(
                  'Temperatura: ${widget.temperatura.toStringAsFixed(1)}°',
                  style: kTempTextStyle,
                ),
                Text(
                  'Sensação: ${widget.sensacao.toStringAsFixed(1)}°',
                  style: kTempTextStyle,
                ),                
                Text(
                  '${widget.iconeClima}',
                  style: kConditionTextStyle,
                ),
              ],
            )
        );
  }

}