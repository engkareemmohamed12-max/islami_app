import 'package:flutter/material.dart';
import 'package:islami_app/Ui/Utils/app_assets.dart';
import 'package:islami_app/Ui/Utils/app_colors.dart';
import 'package:islami_app/Ui/Utils/app_mediaquery.dart';
import 'package:islami_app/Ui/Utils/app_style.dart';
import 'package:islami_app/Ui/tabs/hadeth/hadeth_text_widget.dart';
import 'package:islami_app/model/hadeth_details.dart';

class HadethDetailsScreen extends StatelessWidget {
  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var args = ModalRoute.of(context)!.settings.arguments as HadethDetailsArgs;

    return Scaffold(
      backgroundColor: AppColors.blackBgColor,

      appBar: AppBar(
        title: Text(
          'Hadeth ${args.index}',
          style: AppStyle.bold24primary,
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [

            SizedBox(
              height: AppMediaQuery.height(context) * 0.02,
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppMediaQuery.width(context) * 0.02,
              ),
              child: Row(
                children: [

                  Image.asset(
                    AppAssets.leftCorne,
                    width: 40,
                  ),

                  Expanded(
                    child: Text(
                      args.hadeth?.title ?? '',
                      style: AppStyle.bold24primary,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  Image.asset(
                    AppAssets.rightCorner,
                    width: 40,
                  ),

                ],
              ),
            ),

            SizedBox(
              height: AppMediaQuery.height(context) * 0.02,
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: AppMediaQuery.width(context) * 0.04,
                ),
                child: HadethTextWidget(
                  text: args.hadeth?.content ?? '',
                  textStyle: AppStyle.bold16primary,
                ),
              ),
            ),

            Image.asset(
              AppAssets.mosqueImage,
              fit: BoxFit.contain,
            ),

          ],
        ),
      ),
    );
  }
}