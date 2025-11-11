import 'package:easy_paisa/controller/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'more_services.dart';

class MoreServicesWithDots extends StatefulWidget {
  const MoreServicesWithDots({super.key});

  @override
  State<MoreServicesWithDots> createState() => _MoreServicesWithDotsState();
}

class _MoreServicesWithDotsState extends State<MoreServicesWithDots> {
  int currentPage = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final LanguageController languageController = Get.find();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Container(
      height: isLandscape ? screenHeight * 0.9 : screenHeight * 0.28,
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                });
              },
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MoreServices(
                          title: languageController.translate('easyload'),
                          icon: Icons.lte_mobiledata_sharp,
                          onTap: () {},
                        ),
                        MoreServices(
                          title: languageController.translate('rasst_payment'),
                          icon: Icons.payment,
                          onTap: () {},
                        ),
                        MoreServices(
                          title: languageController.translate('insurance'),
                          icon: Icons.lte_mobiledata_sharp,
                          onTap: () {},
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MoreServices(
                          title: languageController.translate('easycash_loan'),
                          icon: Icons.mobile_friendly,
                          onTap: () {},
                        ),

                        MoreServices(
                          title: languageController.translate('mini_app'),
                          icon: Icons.mobile_screen_share,
                          onTap: () {},
                        ),
                        MoreServices(
                          title: languageController.translate('donations'),
                          icon: Icons.mobile_friendly,
                          onTap: () {},
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MoreServices(
                          title: languageController.translate('savings_pocket'),
                          icon: Icons.savings,
                          onTap: () {},
                        ),
                        MoreServices(
                          title: languageController.translate('savings'),
                          icon: Icons.savings_sharp,
                          onTap: () {},
                        ),

                        MoreServices(
                          title: languageController.translate('rs1_game'),
                          icon: Icons.savings,
                          onTap: () {},
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MoreServices(
                          title: languageController.translate('invite_earn'),
                          icon: Icons.person_add_alt,
                          onTap: () {},
                        ),

                        MoreServices(
                          title: languageController.translate(
                            'buy_now_pay_later',
                          ),
                          icon: Icons.payments_sharp,
                          onTap: () {},
                        ),
                        MoreServices(
                          title: languageController.translate('see_all'),
                          icon: Icons.pageview_sharp,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),

                Container(),

                Container(),
              ],
            ),
          ),

          // Dots Indicator
          Container(
            height: screenHeight * 0.01,
            margin: EdgeInsets.only(bottom: screenHeight * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_buildDot(0), _buildDot(1)],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int pageIndex) {
    return Flexible(
      child: Container(
        width: 8,
        height: 8,
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentPage == pageIndex ? Colors.green : Colors.grey[300],
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
