import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/Ui/Utils/app_theme.dart';
import 'package:islami_app/Ui/home_screen.dart';

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
      back: const Text(
        "Back",
        style: TextStyle(color: goldColor),
      ),
      next: const Text(
        "Next",
        style: TextStyle(color: goldColor),
      ),
      done: const Text(
        "Done",
        style: TextStyle(color: goldColor),
      ),
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
        _buildRawPage("logo.png", "center_logo.png", "Welcome To Islami App", ""),
        _buildRawPage("logo.png", "center_logo2.png", "Welcome To Islami", "We Are Very Excited To Have You In Our Community"),
        _buildRawPage("logo.png", "center_logo3.png", "Reading the Quran", "Read, and your Lord is the Most Generous"),
        _buildRawPage("logo.png", "center_logo4.png", "Bearish", "Praise the name of your Lord, the Most High"),
        _buildRawPage("logo.png", "center_logo5.png", "Holy Quran Radio" , "You can listen to the Holy Quran Radio \n through the application for free and easily" ),

      ],

      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) =>  HomeScreen()),
        );
      },

    );
  }



  Widget _buildRawPage(String logo, String image, String title, String subtitle) {
    const goldColor = Color(0xFFE2BE7F);

    return Container(
      color: const Color(0xFF202020),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset("assets/images/$logo", fit: BoxFit.fill,),
            const SizedBox(height: 20),
            Expanded(
              child: Image.asset("assets/images/$image", fit: BoxFit.contain),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  Text(title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: goldColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                  if (subtitle.isNotEmpty)
                    Text(subtitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: goldColor, fontSize: 20)),
                ],
              ),
            ),
            SizedBox(height: 60,),
          ],
        ),
      ),
    );
  }

}