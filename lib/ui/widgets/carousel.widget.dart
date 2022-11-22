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
      {"titre":"Festival de la chanson française","ville":"Aix-en-Provence"},
      {"titre":"Festival Poésie et davantage","ville":"Ajaccio"},
      {"titre":"Les Fest'imaginaires","ville":"Albertville"},
      {"titre":"Alphapodis","ville":"Alençon"},
    ];
    return CarouselSlider.builder(
        itemCount: festivalSlides.length,
        itemBuilder: (context, index, cindex){
        return CarouselItemWidget(
          titre: festivalSlides[index]['titre'],
          ville: festivalSlides[index]['ville'],
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
