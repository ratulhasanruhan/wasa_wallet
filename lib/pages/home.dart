import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wasa_wallet/controller/nfc_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final NfcController nfcController = Get.put(NfcController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wasa Wallet'),
      ),
      body: Obx( () {
          return Center(
            child: Column(
              children: [
                Text('NFC Handle: ${nfcController.handle.value}'),
                const SizedBox(height: 20),
                Text('NFC Data: ${nfcController.data.value}'),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    Clipboard.setData(ClipboardData(text: nfcController.data.value));
                  },
                  child: const Text('Copy NFC Data'),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
