import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CreateQr extends StatefulWidget {
  const CreateQr({super.key});

  @override
  State<CreateQr> createState() => _CreateQrState();
}

class _CreateQrState extends State<CreateQr> {

  TextEditingController textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
            "Generate QR Code",
          style: TextStyle(
            fontFamily: "Lora",
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),

      body: Center(

        child: SingleChildScrollView(

          child: Column(
            mainAxisAlignment : MainAxisAlignment.center,
            children: [

              if(textcontroller.text.isNotEmpty)
                QrImageView(
                  data: textcontroller.text,
                  size: 200,
                  backgroundColor: Colors.white),

              if(textcontroller.text.isEmpty)
                const Text(
                  "No input Given in the form",
                  style: TextStyle(
                      fontSize: 20,
                    fontFamily: "Lora",
                  ),
                ),

              const SizedBox(
                height: 30,
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),

                child: TextField(
                  controller: textcontroller,

                  decoration: InputDecoration(
                      hintText: "Enter your data",

                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),

                      labelText: "Enter your data"
                  ),

                ),

              ),
              const SizedBox(
                height: 30,
              ),

              TextButton(
                  onPressed: (){

                setState(() {
                  if(textcontroller.text.isNotEmpty) {
                    QrImageView(
                      data: textcontroller.text,
                      size: 200,
                      backgroundColor: Colors.white
                    );
                  }
                });
              },

                child: const Text(
                  "Generate Qr code",
                  style: TextStyle(
                    fontFamily: "Lora",
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ),

              const SizedBox(
                height: 20.0,
              ),

              TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'scanqr');
                },

                child: const Text(
                  "Scan Qr code",
                  style: TextStyle(
                    fontFamily: "Lora",
                    fontWeight: FontWeight.bold,
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