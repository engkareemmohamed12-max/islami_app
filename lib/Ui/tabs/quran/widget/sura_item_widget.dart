import 'package:flutter/material.dart';
import 'package:islami_app/Ui/Utils/app_assets.dart';
import 'package:islami_app/Ui/Utils/app_mediaquery.dart';
import 'package:islami_app/Ui/Utils/app_style.dart';
import 'package:islami_app/model/quran_reasources.dart';

class SuraItemWidget extends StatelessWidget {

  int index ;
   SuraItemWidget({super.key , required this.index });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppMediaQuery.width(context)*0.04,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.frame),
            Text("${index+1}" ,
            style: AppStyle.bold16White,

            ),
          ],
            ),
        Column(
          spacing: AppMediaQuery.height(context)*0.01,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(QuranReasources.englishQuranSurahs[index] ,
            style: AppStyle.bold20white,
            ),

            Text('${QuranReasources.AyaNumber[index]} Verses' ,
              style: AppStyle.bold20white,
            )
          ],
        ),
        Spacer(),
        Text(QuranReasources.arabicAuranSuras[index] ,
          style: AppStyle.bold20white,
        ),

      ],
    );
  }
}
