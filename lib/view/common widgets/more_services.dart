import 'package:easy_paisa/view/common%20widgets/quick_service.dart';
import 'package:flutter/material.dart';

class MoreServices extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const MoreServices({
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
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(screenWidth * 0.03),
            decoration: BoxDecoration(
              color: Colors.green[50],
              shape: BoxShape.circle,
            ),
            child: FittedBox(
              child: Icon(
                icon,
                color: Colors.green,
                size: isLandscape ? screenWidth * 0.027 : screenWidth * 0.06,
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.02),
          FittedBox(
            child: Text(
              title,
              style: TextStyle(
                fontSize:
                    isLandscape ? screenWidth * 0.015 : screenWidth * 0.03,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
