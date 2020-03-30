import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatelessWidget {
  final Map<String, dynamic> incident;

  Detail(this.incident);

  @override
  Widget build(BuildContext context) {
    String message =
        "Olá ${incident['name']}, estou em contato pois gostaria de ajudar no caso ${incident['title']} com o valor de R\$ ${incident['value']}";

    void sendMail() async {
      String url =
          "mailto:<${incident['email']}>?subject=Herói do Caso: ${incident['title']}&body=$message";
      await launch(url);
    }

    void sendWhatsapp() async {
      String whatsapp =
          "whatsapp://send?phone=55${incident['phone']}&text=$message";
      await launch(whatsapp);
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            customAppBar(context),
            incidentBody(),
            contactBox(sendWhatsapp, sendMail),
          ],
        ),
      ),
    );
  }

  customAppBar(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset('images/logo.png'),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              size: 28,
              color: Color(0xffe02041),
            ),
          )
        ],
      ),
    );
  }

  incidentBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Card(
        margin: EdgeInsets.only(bottom: 16),
        child: Padding(
          padding: const EdgeInsets.all(24),
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
            ],
          ),
        ),
      ),
    );
  }

  contactBox(void sendWhatsapp(), void sendMail()) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Salve o dia!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Seja o herói desse caso',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, height: 2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                'Entre em Contato',
                style: TextStyle(fontSize: 15, color: Color(0xff737380)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => sendWhatsapp(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: Color(0xffe02041),
                    textColor: Colors.white,
                    child: Text('WhatsApp'),
                  ),
                  RaisedButton(
                    onPressed: () => sendMail(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: Color(0xffe02041),
                    textColor: Colors.white,
                    child: Text('E-Mail'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
