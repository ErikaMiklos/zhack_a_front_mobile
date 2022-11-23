import 'package:flutter/material.dart';
import 'package:zhack_a_front_mobile/model/festivals.model.dart';


class DetailsPage extends StatelessWidget {
 final Festival festival;

 DetailsPage(this.festival);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(festival.login),
      ),
      body: Padding(padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(festival.login,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17.0, fontStyle: FontStyle.italic ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(festival.htmlUrl,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 22.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}