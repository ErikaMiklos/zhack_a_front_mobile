import 'package:flutter/material.dart';
import 'package:zhack_a_front_mobile/model/festivals.model.dart';

import '../../model/github.events.model.dart';


class GitHubDetailsPage extends StatelessWidget {
 final Actor actor;

 GitHubDetailsPage(this.actor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(actor.login),
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
                  child: Text(actor.login,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 44.0, fontStyle: FontStyle.italic,
                      color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(actor.avatarUrl,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(actor.url,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text("access for : ${actor.id}",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text("score: ${actor.gravatarId}",
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