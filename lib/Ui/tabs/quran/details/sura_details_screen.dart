import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Ui/Utils/app_assets.dart';
import 'package:islami_app/Ui/Utils/app_colors.dart';
import 'package:islami_app/Ui/Utils/app_mediaquery.dart';
import 'package:islami_app/Ui/Utils/app_style.dart';
import 'package:islami_app/Ui/tabs/quran/widget/sura_content.dart';
import 'package:islami_app/model/quran_reasources.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {

  List<String> verses = [];
  bool isListMode = true;

  @override
  Widget build(BuildContext context) {

    var index = ModalRoute.of(context)!.settings.arguments as int;

    if (verses.isEmpty) {
      loadSuraFile(index);
    }

    return Scaffold(
      backgroundColor: AppColors.blackBgColor,

      appBar: AppBar(
        title: Text(
          QuranReasources.englishQuranSurahs[index],
          style: AppStyle.bold24primary,
        ),
        actions: [

          IconButton(
            icon: const Icon(Icons.view_agenda),
            onPressed: () {
              setState(() {
                isListMode = true;
              });
            },
          ),

          IconButton(
            icon: const Icon(Icons.menu_book),
            onPressed: () {
              setState(() {
                isListMode = false;
              });
            },
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [

            SizedBox(height: AppMediaQuery.height(context) * 0.02),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppMediaQuery.width(context) * 0.02,
              ),
              child: Row(
                children: [

                  Image.asset(
                    AppAssets.leftCorne,
                    width: 40,
                    fit: BoxFit.contain,
                  ),

                  Expanded(
                    child: Text(
                      QuranReasources.arabicAuranSuras[index],
                      style: AppStyle.bold20primary,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  Image.asset(
                    AppAssets.rightCorner,
                    width: 40,
                    fit: BoxFit.contain,
                  ),

                ],
              ),
            ),

            SizedBox(height: AppMediaQuery.height(context) * 0.02),

            Expanded(
              child: verses.isEmpty
                  ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              )

                  : isListMode

                  ? ListView.separated(

                padding: EdgeInsets.symmetric(
                  horizontal: AppMediaQuery.width(context) * 0.04,
                ),

                itemBuilder: (context, index) {

                  return SuraContent(
                    content: verses[index],
                    index: index,
                  );

                },

                separatorBuilder: (context, index) {

                  return SizedBox(
                    height: AppMediaQuery.height(context) * 0.02,
                  );

                },

                itemCount: verses.length,

              )

                  : SingleChildScrollView(

                padding: EdgeInsets.symmetric(
                  horizontal: AppMediaQuery.width(context) * 0.04,
                ),

                child: Text.rich(

                  TextSpan(

                    children: List.generate(verses.length, (i) {

                      return TextSpan(

                        text: ' [${i + 1}] ${verses[i]} ',
                        style: AppStyle.bold20primary,

                      );

                    }),

                  ),

                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,

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

  void loadSuraFile(int index) async {

    String content = await rootBundle
        .loadString('assets/files/Suras/${index + 1}.txt');

    List<String> lines = content.split('\n');

    verses = lines.where((line) => line.trim().isNotEmpty).toList();

    setState(() {});
  }
}