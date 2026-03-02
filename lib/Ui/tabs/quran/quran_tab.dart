import 'package:flutter/material.dart';
import 'package:islami_app/Ui/Utils/app_assets.dart';
import 'package:islami_app/Ui/Utils/app_colors.dart';
import 'package:islami_app/Ui/Utils/app_mediaquery.dart';
import 'package:islami_app/Ui/Utils/app_style.dart';

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppMediaQuery.width(context)*0.04,
      ),
      child: Column(
        spacing: AppMediaQuery.height(context)*0.02,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          TextField(
            style: TextStyle(
              color: Colors.white,
            ),

            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(

              enabledBorder: builtDecorationBorder(),
              focusedBorder: builtDecorationBorder(),
              prefixIcon: Image.asset(AppAssets.iconSearch),
              hintText: "Sura Name" ,
              hintStyle: AppStyle.bold16White,
            ),


          ),
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

  OutlineInputBorder builtDecorationBorder(){

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: 2
      ),
    );
  }

}
