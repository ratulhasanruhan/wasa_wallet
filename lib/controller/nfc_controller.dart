import 'dart:convert';

import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:get/get.dart';

class NfcController extends GetxController {

  var data = ''.obs;
  var handle = ''.obs;
  var raw = ''.obs;

  @override
  onInit() {
    super.onInit();
    getNfcData();
  }

  getNfcData() async{
    var tag = await FlutterNfcKit.poll();
     handle.value = '${tag.ndefType} // ${tag.protocolInfo}';

    if (tag.ndefAvailable!) {
      /// decoded NDEF records (see [ndef.NDEFRecord] for details)
      /// `UriRecord: id=(empty) typeNameFormat=TypeNameFormat.nfcWellKnown type=U uri=https://github.com/nfcim/ndef`
      for (var record in await FlutterNfcKit.readNDEFRecords(cached: false)) {
        data.value = record.toString();
      }
      /// raw NDEF records (data in hex string)
      /// `{identifier: "", payload: "00010203", type: "0001", typeNameFormat: "nfcWellKnown"}`
      for (var record in await FlutterNfcKit.readNDEFRawRecords(cached: false)) {
        raw.value = jsonEncode(record).toString();
      }
    }

  }

}