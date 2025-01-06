import 'package:get/get.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NfcController extends GetxController {

  var data = ''.obs;
  var handle = ''.obs;

  @override
  onInit() {
    super.onInit();
    getNfcData();
  }

  getNfcData() {

    NfcManager.instance.startSession(
      onDiscovered: (NfcTag tag) async {
        data.value = tag.data.toString();
        handle.value = tag.handle.toString();

        Get.snackbar(
          'NFC Data',
          tag.data.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
        return Future.value(true);
      },
      onError: (Object error) {
        Get.snackbar(
          'Error',
          error.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
        return Future.value(false);
      },
    );
  }

}