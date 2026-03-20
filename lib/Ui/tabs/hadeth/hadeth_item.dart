import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Ui/Utils/app_assets.dart';
import 'package:islami_app/Ui/Utils/app_colors.dart';
import 'package:islami_app/Ui/Utils/app_mediaquery.dart';
import 'package:islami_app/Ui/Utils/app_route.dart';
import 'package:islami_app/Ui/Utils/app_style.dart';
import 'package:islami_app/Ui/tabs/hadeth/hadeth_text_widget.dart';
import 'package:islami_app/model/hadeth.dart';
import 'package:islami_app/model/hadeth_details.dart';

class HadethItem extends StatefulWidget {

  final int index ;


   HadethItem({super.key , required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
   Hadeth? hadeth ;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadHadethFile();
  }

  @override
  Widget build(BuildContext context) {
     
     
    return InkWell(
      onTap: (){

        Navigator.of(context).pushNamed(AppRoute.hadethDetails1RouteName , arguments: HadethDetailsArgs(hadeth: hadeth, index: widget.index));

      },
      child: Container(
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.primaryColor,
      
          image: DecorationImage(image: AssetImage(
              AppAssets.hadeethBg)),
        ),
      
        child: hadeth == null ?
           Center(child: CircularProgressIndicator(
      
             color: AppColors.blackBgColor,
           ),)
        : Column(
      
      
          children: [
      
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppMediaQuery.width(context)*0.04,
                vertical: AppMediaQuery.height(context)*0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppAssets.left_corner ,
                  width: AppMediaQuery.width(context)*0.16,
                  ),
                  Expanded(child: HadethTextWidget(text: hadeth?.title??'', textStyle: AppStyle.bold20black)),
                  Image.asset(AppAssets.right_corner ,
                    width: AppMediaQuery.width(context)*0.16,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppMediaQuery.width(context)*0.02,
                ),
                child:  HadethTextWidget(text: hadeth?.content??'', textStyle: AppStyle.bold16black),
              ),
            ),
            
            Image.asset(AppAssets.hadeethmosque),
      
      
      
          ],
        ) ,
      
      ),
    );
  }

  void LoadHadethFile() async {
    String hadethContent = await rootBundle.loadString(
        'assets/files/Hadeeth/h${widget.index}.txt');
    String title = hadethContent.substring(0 , hadethContent.indexOf('\n'));
    String content = hadethContent.substring(hadethContent.indexOf('\n')+1);
    hadeth = Hadeth(title: title, content: content);
    Future.delayed(Duration(seconds: 1),() => setState(() {

    }),);



  }
}
