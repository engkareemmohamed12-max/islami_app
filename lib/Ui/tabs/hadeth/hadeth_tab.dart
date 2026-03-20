import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Ui/Utils/app_mediaquery.dart';
import 'package:islami_app/Ui/tabs/hadeth/hadeth_item.dart';

class Hadeth extends StatelessWidget {


   Hadeth({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions
        (height: AppMediaQuery.height(context)*0.66,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
      ),
      items: List.generate(50, (index) => index+1).
      map((index) {
        return HadethItem(index: index,);
      }).toList(),
    );


  }
}
