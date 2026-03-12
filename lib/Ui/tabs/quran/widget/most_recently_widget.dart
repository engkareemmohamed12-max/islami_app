import 'package:flutter/material.dart';
import 'package:islami_app/Ui/Utils/app_assets.dart' show AppAssets;
import 'package:islami_app/Ui/Utils/app_colors.dart' show AppColors;
import 'package:islami_app/Ui/Utils/app_mediaquery.dart' show AppMediaQuery;
import 'package:islami_app/Ui/Utils/app_style.dart' show AppStyle;

class MostRecentlyWidget extends StatelessWidget {
  const MostRecentlyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppMediaQuery.width(context)*0.02),
      child: Column(
        spacing: AppMediaQuery.height(context)*0.02,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Most Recently' ,
            style: AppStyle.bold16White,

          ),

          SizedBox(
            height: AppMediaQuery.height(context)*0.16,

            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context , index){
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: AppMediaQuery.width(context)*0.04),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Row(
                    children: [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Al-Anbiya' ,

                              style: AppStyle.bold24black
                          ),
                          Text('الأنبياء' ,
                              style: AppStyle.bold24black

                          ),
                          Text('112 Verses' ,
                              style: AppStyle.bold14black

                          ),

                        ],
                      ),
                      Image.asset(AppAssets.mostRecent),

                    ],
                  ),

                );
              },



              separatorBuilder: (context , index){
                return SizedBox(width: AppMediaQuery.width(context)*0.04,);


              },

              itemCount: 10,

            ),
          ),
        ],
      ),
    );

  }
}
