import 'package:easy_paisa/controller/bottomNav_controller.dart';
import 'package:easy_paisa/controller/language_controller.dart';
import 'package:easy_paisa/controller/theme_controller.dart';
import 'package:easy_paisa/core/utils/image_paths.dart';
import 'package:easy_paisa/view/common%20widgets/balance_widget.dart';
import 'package:easy_paisa/view/common%20widgets/bottom_bar.dart';
import 'package:easy_paisa/view/common%20widgets/more_serviceswithscroll.dart';
import 'package:get/get.dart';
import 'package:easy_paisa/view/common%20widgets/more_services.dart';
import 'package:easy_paisa/view/common%20widgets/quick_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final LanguageController languageController = Get.find();
  final ThemeController themeController = Get.find();
  final BottomnavController bottomnavController = Get.find();

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Container(
          height: isLandscape ? screenHeight * 0.1 : screenWidth * 0.08,
          width: isLandscape ? screenHeight * 0.25 : screenWidth * 0.25,
          child: Image.asset(ImagePaths.appBarLogo, fit: BoxFit.contain),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              themeController.toggleTheme();
            },
            icon: Obx(
              () => Icon(
                themeController.isDarkMode.value
                    ? Icons.light_mode
                    : Icons.dark_mode,
                size: isLandscape ? screenHeight * 0.04 : screenWidth * 0.06,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              _showLanguageDialog(context);
            },
            icon: Icon(
              Icons.language,
              size: isLandscape ? screenHeight * 0.04 : screenWidth * 0.06,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BuildBottonNavItem(),
      body:
          isLandscape
              ? _buildLandscapeLayout(context)
              : _BuildPotraitLayout(context),
    );
  }

  Widget _BuildPotraitLayout(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Stack(
          children: [
            Container(height: screenHeight * 0.18, color: Colors.green),
            Positioned(
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
              bottom: screenHeight * 0.002,
              child: BalanceContainer(),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.01),
        Container(
          height: screenHeight * 0.12,
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.02,
            vertical: screenHeight * 0.01,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ServiceItem(
                title: languageController.translate('send_money'),
                icon: Icons.money,
                onTap: () {},
              ),
              ServiceItem(
                title: languageController.translate('bill_payment'),
                icon: Icons.mobile_friendly,
                onTap: () {},
              ),
              ServiceItem(
                title: languageController.translate('mobile_packages'),
                icon: Icons.mobile_screen_share,
                onTap: () {},
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(9.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "More with Easypaisa",
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),

        // More Services
        Flexible(
          fit: FlexFit.tight,
          flex: 20,
          child: Container(
            width: screenWidth * 0.9,

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: MoreServicesWithDots(),
          ),
        ),
      ],
    );
  }

  Widget _buildLandscapeLayout(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.width;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Column(
      children: [
        Expanded(
          flex: 3,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height:
                          isLandscape
                              ? screenHeight * 0.25
                              : screenHeight * 0.18,
                      color: Colors.green,
                    ),
                    Positioned(
                      left: screenWidth * 0.05,
                      right: screenWidth * 0.05,
                      bottom: screenHeight * 0.002,
                      child: BalanceContainer(),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ServiceItem(
                      title: languageController.translate('send_money'),
                      icon: Icons.money,
                      onTap: () {},
                    ),
                    ServiceItem(
                      title: languageController.translate('bill_payment'),
                      icon: Icons.mobile_friendly,
                      onTap: () {},
                    ),
                    ServiceItem(
                      title: languageController.translate('mobile_packages'),
                      icon: Icons.mobile_screen_share,
                      onTap: () {},
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "More with Easypaisa",
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                // More Services
                Container(
                  width: screenWidth * 0.9,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: MoreServicesWithDots(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Select Language'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.language),
                  title: Text('English'),
                  onTap: () {
                    languageController.changeLanguage('en');
                    Get.back();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.language),
                  title: Text('اردو'),
                  onTap: () {
                    languageController.changeLanguage('ur');
                    Get.back();
                  },
                ),
              ],
            ),
          ),
    );
  }
}
