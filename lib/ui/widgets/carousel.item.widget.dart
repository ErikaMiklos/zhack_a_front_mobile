import 'package:flutter/material.dart';

class CarouselItemWidget extends StatelessWidget {
  final String titre;
  final String ville;

  const CarouselItemWidget({Key? key,
    required this.titre,
    required this.ville
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        color:  Theme.of(context).primaryColor,
        elevation: 3,
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white, Theme.of(context).primaryColor]
                )
            ),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(titre, style: Theme.of(context).textTheme.headline6,),
                Text(ville, style: Theme.of(context).textTheme.headline5,),
              ],
            )
          ),
        )
      ),
    );
  }
}
