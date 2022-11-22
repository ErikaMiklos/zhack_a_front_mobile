import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:zhack_a_front_mobile/ui/widgets/carousel.item.widget.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({Key? key}) : super(key: key);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {

  @override
  Widget build(BuildContext context) {
    List<dynamic> festivalSlides = [
      {"titre":"Festival de la chanson française","ville":"Aix-en-Provence","date":"6 septembre - 31 décembre"},
      {"titre":"Festival Poésie et davantage","ville":"Ajaccio","date":"6 septembre - 31 décembre"},
      {"titre":"Les Fest'imaginaires","ville":"Albertville","date":"21 juin - 5 septembre"},
      {"titre":"Alphapodis","ville":"Alençon","date":"21 juin - 5 septembre"},
    ];
    return CarouselSlider.builder(
        itemCount: festivalSlides.length,
        itemBuilder: (context, index, cindex){
        return CarouselItemWidget(
          titre: festivalSlides[index]['titre'],
          ville: festivalSlides[index]['ville'],
          date: festivalSlides[index]['date'],
        );
      },
        options: CarouselOptions(
          height: 200,
          autoPlay: false,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 600)
        ),
    );
  }


}
