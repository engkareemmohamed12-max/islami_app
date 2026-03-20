import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/Ui/Utils/app_colors.dart';
import 'package:islami_app/Ui/Utils/app_mediaquery.dart';
import 'package:islami_app/Ui/Utils/app_route.dart';
import 'package:islami_app/Ui/Utils/app_theme.dart';
import 'package:islami_app/Ui/home_screen.dart';
import 'package:islami_app/Ui/tabs/quran/details/sura_details_screen.dart';

import 'Ui/tabs/hadeth/details/hadeth_details_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnBoardingPage(),
      routes: {
        AppRoute.homeRouteName: (context) =>  HomeScreen(),
        AppRoute.suraDetailsRouteName: (context) =>
        const SuraDetailsScreen(),
        AppRoute.hadethDetails1RouteName: (context) =>
        const HadethDetailsScreen(),
      },
      darkTheme: AppTheme.dartTheme,
      themeMode: ThemeMode.dark,
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const goldColor = Color(0xFFE2BE7F);
    const bgColor = Color(0xFF202020);

    return IntroductionScreen(
      globalBackgroundColor: bgColor,

      showBackButton: true,
      showSkipButton: false,

      back: const Text('Back' , style: TextStyle(color: AppColors.primaryColor),),
      next: const Text('Next' , style: TextStyle(color: AppColors.primaryColor),),
      done: const Text('Done' , style: TextStyle(color: AppColors.primaryColor),),

      dotsFlex: 3,
      nextFlex: 1,
      

      controlsPadding: const EdgeInsets.symmetric(horizontal: 12),

      dotsDecorator: const DotsDecorator(
        color: Colors.grey,
        activeColor: goldColor,
        size: Size(8, 8),
        activeSize: Size(22, 8),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
      ),

      rawPages: [
        _buildRawPage(context, "logo.png", "center_logo.png",
            "Welcome To Islami App", ""),

        _buildRawPage(context, "logo.png", "center_logo2.png",
            "Welcome To Islami",
            "We Are Very Excited To Have You In Our Community"),

        _buildRawPage(context, "logo.png", "center_logo3.png",
            "Reading the Quran",
            "Read, and your Lord is the Most Generous"),

        _buildRawPage(context, "logo.png", "center_logo4.png",
            "Bearish",
            "Praise the name of your Lord, the Most High"),

        _buildRawPage(context, "logo.png", "center_logo5.png",
            "Holy Quran Radio",
            "You can listen to the Holy Quran Radio through the application for free and easily"),
      ],

      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) =>  HomeScreen(),
          ),
        );
      },
    );
  }

  Widget _buildRawPage(
      BuildContext context,
      String logo,
      String image,
      String title,
      String subtitle) {

    const goldColor = Color(0xFFE2BE7F);

    return Container(
      color: const Color(0xFF202020),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: AppMediaQuery.height(context) * 0.04),

              Image.asset(
                "assets/images/$logo",
                width: AppMediaQuery.width(context) * 0.45,
                fit: BoxFit.contain,
              ),

              SizedBox(height: AppMediaQuery.height(context) * 0.05),

              Image.asset(
                "assets/images/$image",
                height: AppMediaQuery.height(context) * 0.35,
                fit: BoxFit.contain,
              ),

              SizedBox(height: AppMediaQuery.height(context) * 0.05),

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppMediaQuery.width(context) * 0.08),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: goldColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: AppMediaQuery.height(context) * 0.02),

              if (subtitle.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppMediaQuery.width(context) * 0.08),
                  child: Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: goldColor,
                      fontSize: 20,
                    ),
                  ),
                ),

              SizedBox(height: AppMediaQuery.height(context) * 0.06),
            ],
          ),
        ),
      ),
    );
  }
}