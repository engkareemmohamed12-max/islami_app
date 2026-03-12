import 'package:flutter/material.dart';
import 'package:islami_app/Ui/Utils/app_assets.dart';
import 'package:islami_app/Ui/Utils/app_colors.dart';
import 'package:islami_app/Ui/Utils/app_mediaquery.dart';
import 'package:islami_app/Ui/Utils/app_route.dart';
import 'package:islami_app/Ui/Utils/app_style.dart';
import 'package:islami_app/Ui/tabs/quran/widget/most_recently_widget.dart';
import 'package:islami_app/Ui/tabs/quran/widget/sura_item_widget.dart';

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
          MostRecentlyWidget(),
          Text('Suras List' ,
          style: AppStyle.bold16White,

          ),
          
          Expanded(child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(AppRoute.suraDetailsRouteName ,
                      arguments: index,
                      );
                    },
                    child: SuraItemWidget(index: index,));
              },
              separatorBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: AppMediaQuery.height(context)*0.02),
                  child: Divider(
                    thickness: 2,
                    color: AppColors.whiteColor,
                  ),
                );
              },
              itemCount: 114)
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
