import 'package:clima_interior/screens/localidade.dart';
import 'package:clima_interior/services/clima.dart';
import 'package:flutter/material.dart';

class Painel extends StatefulWidget {

  @override
  State<Painel> createState() => _PainelState();
}


class _PainelState extends State<Painel> {
  Clima clima = Clima();

  List<String> localidades = ['Tapuio', 'Açude Novo', 'Cristais', 'Tanques'];
  List<double> latitudes = [-4.518212058306935, -4.5276951480839225, -4.494944727808677, -4.537764764065196];
  List<double> longitudes = [-38.324611647601884, -38.31201350876564, -38.35697036900562, -38.30215778202035];
  List<int> temperaturas = [0, 0, 0, 0];
  List<String> iconesClima = [' ', ' ', ' ', ' '];

  @override
  void initState() {    
    super.initState();
    obtemDadosClima();
  }

  obtemDadosClima() async {
      for (int i = 0; i < localidades.length; i++) {
        print('Localidade: ${localidades[i]} - Lat: ${latitudes[i]} - Lon: ${longitudes[i]}');
        var climaData = await clima.getClimaLocalidade(latitudes[i], longitudes[i]);
        setState(() {
          temperaturas[i] = climaData['main']['temp'].toInt();
          var condition = climaData['weather'][0]['id'];
          iconesClima[i] = clima.getIcone(condition);
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('PAINEL - Clima no Interior'),
      ),
      body: Container(
        decoration: BoxDecoration(

        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 120,
                child: Row(                
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Localidade(local: localidades[0], temperatura: temperaturas[0], iconeClima: iconesClima[0]),
                    Localidade(local: localidades[1], temperatura: temperaturas[1], iconeClima: iconesClima[1]),
                  ],
                ),
              ),
              SizedBox(
                height: 120,
                child: Row(                
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Localidade(local: localidades[2], temperatura: temperaturas[2], iconeClima: iconesClima[2]),
                    Localidade(local: localidades[3], temperatura: temperaturas[3], iconeClima: iconesClima[3]),
                  ],
                ),
              )
            ]            
          )
        )
      )

    );

  }
}