import 'package:easy_paisa/controller/language_controller.dart';
import 'package:easy_paisa/core/utils/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BalanceContainer extends StatelessWidget {
  BalanceContainer({super.key});
  final LanguageController languageController = Get.find();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Container(
      width: isLandscape ? screenWidth * 0.35 : screenWidth * 0.9,

      padding: EdgeInsets.all(screenWidth * 0.04),
      margin: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left Side
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height:
                        isLandscape ? screenHeight * 0.08 : screenHeight * 0.04,
                    width: isLandscape ? screenWidth * 0.2 : screenWidth * 0.25,
                    child: Image.asset(
                      ImagePaths.appBarLogo,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    languageController.translate('available_balance'),
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      fontSize:
                          isLandscape
                              ? screenWidth * 0.025
                              : screenWidth * 0.035,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Rs. 26000  ",
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          fontSize:
                              isLandscape
                                  ? screenWidth * 0.025
                                  : screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        size:
                            isLandscape
                                ? screenWidth * 0.03
                                : screenWidth * 0.05,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        languageController.translate('updated_just_now'),
                        style: TextStyle(
                          color:
                              Theme.of(context).textTheme.bodySmall?.color ??
                              Colors.grey,
                          fontSize:
                              isLandscape
                                  ? screenWidth * 0.02
                                  : screenWidth * 0.028,
                        ),
                      ),
                      Icon(
                        Icons.refresh,
                        size:
                            isLandscape
                                ? screenWidth * 0.03
                                : screenWidth * 0.04,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.attach_money_outlined,
                      size:
                          isLandscape ? screenWidth * 0.03 : screenWidth * 0.05,
                    ),
                    Text(
                      languageController.translate('my_rewards'),
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize:
                            isLandscape
                                ? screenWidth * 0.024
                                : screenWidth * 0.032,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: isLandscape ? screenWidth * 0.2 : screenWidth * 0.2,
                    height:
                        isLandscape ? screenHeight * 0.08 : screenHeight * 0.03,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        languageController.translate('add_cash'),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.03,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
