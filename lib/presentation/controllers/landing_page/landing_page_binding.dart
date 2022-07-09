import 'package:get/get.dart';
import '../../../app/services/local_storage.dart';
import '../lang/lang_controller.dart';
import 'landing_page_controller.dart';

class LandingPageBinding extends Bindings {
  var store = Get.find<LocalStorageService>();

  @override
  void dependencies() {
    Get.put(LandingPageController());
    store.isFirstTimeSetUp ? null : Get.find<LangController>().onInit();
  }
}
