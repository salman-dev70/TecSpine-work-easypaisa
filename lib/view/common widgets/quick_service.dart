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

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth * 0.23, // Fixed width
        height: screenHeight * 0.125, // Fixed height (square shape)
        padding: EdgeInsets.all(screenWidth * 0.03),
        decoration: BoxDecoration(
          color: Colors.white,
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
              child: Container(
                padding: EdgeInsets.all(screenWidth * 0.025),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  shape: BoxShape.circle,
                ),
                child: Expanded(
                  flex: 6,
                  child: Icon(
                    icon,
                    color: Colors.green,
                    size: screenWidth * 0.055,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenWidth * 0.02),
            Flexible(
              child: FittedBox(
                child: Text(
                  title,

                  style: TextStyle(
                    fontSize: screenWidth * 0.028,
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
