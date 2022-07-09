import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../app/config/app_colors.dart';
import '../../app/config/constant.dart';
import '../../app/config/dimentions.dart';
import '../../app/constants/images.dart';
import '../controllers/landing_page/landing_page_controller.dart';



class LandingPage extends GetView<LandingPageController> {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Constants.deviceHeight = MediaQuery.of(context).size.height;
    Constants.deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.lightPurple,
      bottomNavigationBar: buildBottomNavigationMenu(context, controller),
      body: SafeArea(
        child: Obx(() => _getallclasse()),
      ),
    );
  }

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: Dimensions.FONT_SIZE_DEFAULT,
            unselectedFontSize: Dimensions.FONT_SIZE_SMALL,
            onTap: landingPageController.setSelectedIndex,
            currentIndex: landingPageController.selectedIndex.value,
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.darkBlue,
            selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
            unselectedIconTheme: const IconThemeData(
              color: AppColors.darkGray,
            ),
            unselectedItemColor: AppColors.darkGray,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Images.icon_inactive_vehicle_icon),
                label: 'my_vehicle'.tr,
                activeIcon: SvgPicture.asset(
                  Images.icon_active_vehicle_icon,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Images.icon_inactive_my_loan),
                label: 'loan_details'.tr,
                activeIcon: SvgPicture.asset(
                  Images.icon_active_my_loan,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Images.icon_inactive_support),
                label: 'help'.tr,
                activeIcon: SvgPicture.asset(
                  Images.icon_active_support,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Images.icon_inactive_profile),
                label: 'profile'.tr,
                activeIcon: SvgPicture.asset(
                  Images.icon_active_profile,
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Images.icon_inactive_more),
                label: 'more'.tr,
                activeIcon: SvgPicture.asset(
                  Images.icon_active_more,
                ),
              ),
            ],
          ),
        )));
  }

  _getallclasse() {
   /* switch (controller.selectedIndex.value) {
      case 0:
        VehicleBinding().dependencies();
        Get.find<VehicleDetailsController>().fetchVehicleData();
        return const MyVehicle();
      case 1:
        LoanBinding().dependencies();
        Get.find<LoanController>().fetchLoanDetails();
        return const LoanView();
      case 2:
        SupportBinding().dependencies();
        Get.find<SupportController>().fetchSupportDetails();
        return const SupportView();
      case 3:
        ProfileBinding().dependencies();
        return const Profile();
      case 4:
        MoreBinding().dependencies();
        return const More();
    }*/
  }
}
