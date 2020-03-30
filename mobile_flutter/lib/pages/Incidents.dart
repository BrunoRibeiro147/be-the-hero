import 'package:be_the_hero/pages/Detail.dart';
import 'package:be_the_hero/services/api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class Incidents extends StatefulWidget {
  @override
  _IncidentsState createState() => _IncidentsState();
}

class _IncidentsState extends State<Incidents> {
  final Api api = Api();

  String count = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: api.getData(),
          builder: (context, dados) {
            if (!dados.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              var incidents = dados.data['incidents'];

              count = dados.data['count'];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      customAppBar(),
                      header(),
                      body(incidents),
                    ]),
              );
            }
          }),
    );
  }

  body(incidents) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 32),
        child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: incidents.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> incident = incidents[index];
              return Card(
                margin: EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 24, left: 24, right: 24, bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'ONG:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff41414d),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Text(
                          incident['name'],
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff737380),
                          ),
                        ),
                      ),
                      Text(
                        'CASO:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff41414d),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Text(
                          incident['title'],
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff737380),
                          ),
                        ),
                      ),
                      Text(
                        'VALOR:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff41414d),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Text(
                          NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
                              .format(incident['value']),
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff737380),
                          ),
                        ),
                      ),
                      TouchableOpacity(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Detail(incident),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Ver Mais Detalhes',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffe03041)),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 16,
                              color: Color(0xffe02041),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  customAppBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset('images/logo.png'),
          RichText(
            text: TextSpan(
                style: TextStyle(color: Color(0xff737380), fontSize: 15),
                children: [
                  TextSpan(text: "Total de "),
                  TextSpan(
                      text: "$count Casos",
                      style: TextStyle(fontWeight: FontWeight.bold))
                ]),
          )
        ],
      ),
    );
  }

  header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: Text(
            "Bem-Vindo!",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xff13131a),
            ),
          ),
        ),
        Text(
          "Escolha um dos casos abaixo e salve o dia.",
          style: TextStyle(
            fontSize: 16,
            height: 2.4,
            color: Color(0xff737380),
          ),
        ),
      ],
    );
  }
}
