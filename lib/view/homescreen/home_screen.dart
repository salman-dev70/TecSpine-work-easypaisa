import 'package:easy_paisa/core/utils/image_paths.dart';
import 'package:easy_paisa/view/common%20widgets/balance_widget.dart';
import 'package:easy_paisa/view/common%20widgets/more_services.dart';
import 'package:easy_paisa/view/common%20widgets/quick_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Container(
          height: screenWidth * 0.1,
          width: screenWidth * 0.3,
          child: Image.asset(ImagePaths.appBarLogo, fit: BoxFit.contain),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, size: screenWidth * 0.09),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, size: screenWidth * 0.09),
          ),
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                color: Colors.green,
              ),
              Positioned(
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
                bottom: screenWidth * 0.01,
                child:
                    BalanceContainer(), // ✅ Yahan context automatically pass ho jata hai
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ServiceItem(
                  title: "Send Money",
                  icon: Icons.money,
                  onTap: () {},
                ),
                ServiceItem(
                  title: "Bill payment",
                  icon: Icons.mobile_friendly,
                  onTap: () {},
                ),
                ServiceItem(
                  title: "Mobile packages",
                  icon: Icons.mobile_screen_share,
                  onTap: () {},
                ),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.02),

          // More Services
          MoreServices(),
        ],
      ),
    );
  }
}
