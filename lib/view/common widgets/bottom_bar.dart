import 'package:easy_paisa/controller/bottomNav_controller.dart';
import 'package:easy_paisa/controller/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BuildBottonNavItem extends StatefulWidget {
  const BuildBottonNavItem({super.key});

  @override
  State<BuildBottonNavItem> createState() => _BuildBottonNavItemState();
}

class _BuildBottonNavItemState extends State<BuildBottonNavItem> {
  final LanguageController languageController = Get.find();
  final BottomnavController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Obx(
      () => Container(
        height:
            isLandscape
                ? MediaQuery.of(context).size.height * 0.2
                : MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: _buildBottomNavItem(
                Icons.home,
                languageController.translate('home'),
                0,
                0,
                context,
              ),
            ),
            Expanded(
              child: _buildBottomNavItem(
                Icons.location_on,
                languageController.translate('cash_points'),
                1,
                0,
                context,
              ),
            ),
            Expanded(
              child: _buildBottomNavItem(
                Icons.people,
                languageController.translate('promotors'),
                2,
                0,
                context,
              ),
            ),
            Expanded(
              child: _buildBottomNavItem(
                Icons.person,
                languageController.translate('my_account'),
                3,
                0,
                context,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(
    IconData icon,
    String label,
    int index,
    int currentIndex,
    BuildContext context,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final isSelected = index == controller.currentIndex.value;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            controller.changeIndex(index);
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Icon(
                  icon,
                  size: isLandscape ? screenWidth * 0.04 : screenWidth * 0.06,
                  color:
                      isSelected
                          ? Theme.of(
                            context,
                          ).bottomNavigationBarTheme.selectedItemColor
                          : Theme.of(
                            context,
                          ).bottomNavigationBarTheme.unselectedItemColor,
                ),
              ),
              SizedBox(
                height: isLandscape ? screenWidth * 0.009 : screenWidth * 0.01,
              ),
              FittedBox(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize:
                        isLandscape ? screenWidth * 0.015 : screenWidth * 0.03,
                    color:
                        isSelected
                            ? Theme.of(
                              context,
                            ).bottomNavigationBarTheme.selectedItemColor
                            : Theme.of(
                              context,
                            ).bottomNavigationBarTheme.unselectedItemColor,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
