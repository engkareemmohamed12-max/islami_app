
import 'package:flutter/material.dart';
import 'package:islami_app/Ui/Utils/app_assets.dart';
import 'package:islami_app/Ui/Utils/app_colors.dart';
import 'package:islami_app/Ui/Utils/app_theme.dart';



class HomeScreen extends StatefulWidget {

  static const String routeName = 'home';
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0 ;
  List<String> backgroundImage = [

    AppAssets.quranBg , AppAssets.hadethBg , AppAssets.sebhaBg , AppAssets.timeBg , AppAssets.radioBg

  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(backgroundImage[selectedIndex]),
        Scaffold(


          bottomNavigationBar: BottomNavigationBar(

            currentIndex: selectedIndex,
              onTap: (index){

              selectedIndex = index ;
              setState(() {

              });
              },





              items: [

              builtBottomNavBarItem(index: 0, iconName: AppAssets.iconquran, label: 'Quran'),

                builtBottomNavBarItem(index: 1, iconName: AppAssets.iconhadeth, label: 'Hadeth'),

                builtBottomNavBarItem(index: 2, iconName: AppAssets.iconsebha, label: 'Sebha'),

                builtBottomNavBarItem(index: 3, iconName: AppAssets.icontime, label: 'Time'),

                builtBottomNavBarItem(index: 4, iconName: AppAssets.iconradio, label: 'Radio'),




              ]

          ),

        ),

      ],
    );
  }

  BottomNavigationBarItem builtBottomNavBarItem({required int index , required String iconName , required String label}){

    return BottomNavigationBarItem(
        icon: bottomNavBarIcon(index: index, iconName: iconName),
        label: label);
  }

  Widget bottomNavBarIcon({required int index , required String iconName}){

    return selectedIndex == index ?


      Container(

        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(66),
          color: AppColors.blackBgColor,

        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 6,
        ),

        child: ImageIcon(AssetImage(iconName))
    ) : ImageIcon(AssetImage(iconName));
  }

}
