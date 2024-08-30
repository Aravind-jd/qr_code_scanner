import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  bool isScanCompleted = false;

  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final double screenHeight = size.height;
    final double screenWidth = size.width;
    final bool isPortrait = screenHeight > screenWidth;

    return Scaffold(

      appBar: AppBar(
        title: const Text(
            "QR Code Scanner",
          style: TextStyle(
            fontFamily: "Lora",
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Center(

        child: Container(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                setState(() {
                  Navigator.pushNamed(context, "Create");
                });
              },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Create QR"),
                  ),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(onPressed: (){
                  setState(() {
                    Navigator.pushNamed(context, "Scan");
                  });
                },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Scan QR"),
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
