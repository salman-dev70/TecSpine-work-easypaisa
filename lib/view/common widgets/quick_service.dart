import 'dart:ui';

import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ServiceItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isLandscape ? screenWidth * 0.2 : screenWidth * 0.23,
        height: isLandscape ? screenHeight * 0.2 : screenHeight * 0.125,
        padding: EdgeInsets.all(screenWidth * 0.03),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FittedBox(
                child: Icon(
                  icon,
                  color: Colors.green,
                  size: isLandscape ? screenWidth * 0.02 : screenWidth * 0.055,
                ),
              ),
            ),
            SizedBox(height: screenWidth * 0.02),
            Expanded(
              child: FittedBox(
                child: Text(
                  title,

                  style: TextStyle(
                    fontSize:
                        isLandscape ? screenWidth * 0.35 : screenWidth * 0.028,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
