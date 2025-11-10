import 'package:easy_paisa/core/utils/image_paths.dart';
import 'package:flutter/material.dart';

class BalanceContainer extends StatelessWidget {
  const BalanceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.9,
      padding: EdgeInsets.all(screenWidth * 0.04),
      margin: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
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
                  Container(
                    height: screenHeight * 0.04,
                    width: screenWidth * 0.25,
                    child: Image.asset(
                      ImagePaths.appBarLogo,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    "Available Balance",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                  Text(
                    "Rs. 26000",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Updated Just Now",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: screenWidth * 0.028,
                    ),
                  ),
                ],
              ),
            ),

            // Right Side
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "My Rewards",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth * 0.032,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.045,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        "Add Cash",
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
