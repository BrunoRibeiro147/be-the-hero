import 'package:be_the_hero/pages/Detail.dart';
import 'package:be_the_hero/services/api.dart';
import 'package:be_the_hero/utils/ThemeChanger.dart';
import 'package:be_the_hero/utils/Themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class Incidents extends StatefulWidget {
  @override
  _IncidentsState createState() => _IncidentsState();
}

class _IncidentsState extends State<Incidents> {
  final Api api = Api();

  String count = "0";

  bool themeSwitch = false;

  @override
  Widget build(BuildContext context) {
    ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);

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
                      customAppBar(themeChanger),
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
                      Text('ONG:', style: Theme.of(context).textTheme.body1),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Text(incident['name'],
                            style: Theme.of(context).textTheme.body2),
                      ),
                      Text('CASO:', style: Theme.of(context).textTheme.body1),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Text(incident['title'],
                            style: Theme.of(context).textTheme.body2),
                      ),
                      Text('VALOR:', style: Theme.of(context).textTheme.body1),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Text(
                            NumberFormat.currency(
                                    locale: 'pt_BR', symbol: 'R\$')
                                .format(incident['value']),
                            style: Theme.of(context).textTheme.body2),
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
                            Text('Ver Mais Detalhes',
                                style: Theme.of(context).textTheme.button),
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

  customAppBar(ThemeChanger themeChanger) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset('images/logo.png'),
          Switch(
            value: themeSwitch,
            onChanged: (value) {
              setState(() {
                themeSwitch = value;
                themeSwitch
                    ? themeChanger.setTheme(Themes().dark())
                    : themeChanger.setTheme(Themes().light());
              });
            },
            activeColor: Color(0xffe03041),
            activeTrackColor: Colors.black,
          ),
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
          child: Text("Bem-Vindo!", style: Theme.of(context).textTheme.title),
        ),
        Text(
          "Escolha um dos casos abaixo e salve o dia.",
          style: Theme.of(context).textTheme.subtitle,
        ),
      ],
    );
  }
}
