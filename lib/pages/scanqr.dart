import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQr extends StatefulWidget {
  const ScanQr({super.key});

  @override
  State<ScanQr> createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {
  String qrresult = "Scanned data will be displayed";

  Future<void> scanqr() async{
    try{

      final qrcode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
      if(!mounted)
      {
        return;
      }

      setState(() {
        this.qrresult = qrcode.toString();
      });

    }

    on PlatformException{

      qrresult = 'Failed to fetch data';

    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
            "QR Code Scanner",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Lora",
          ),
        ),

        centerTitle: true,

      ),

      body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const SizedBox(
                height:30,
              ),

              Text(
                qrresult,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Lora"
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              TextButton(onPressed: (){
                scanqr();
              },

                child: const Text(
                  "Scan Code",
                  style: TextStyle(
                    fontFamily: "Lora",
                    fontWeight: FontWeight.bold
                  ),
                ),

              ),

            ],
          )

      ),

    );
  }
}