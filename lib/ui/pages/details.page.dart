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
      body: Padding(padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 500.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            color: Theme.of(context).primaryColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(festival.login,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 44.0, fontStyle: FontStyle.italic,
                      color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(festival.htmlUrl,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(festival.avatarUrl,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text("access for : ${festival.type}",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text("score: ${festival.score}",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}