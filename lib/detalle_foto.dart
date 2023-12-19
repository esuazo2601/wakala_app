///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/
library;

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:wakala_app/color_palette.dart';

class DetalleFoto extends StatefulWidget {
  final Uint8List imageBytes;

  const DetalleFoto({super.key, required this.imageBytes});

  @override
  State<DetalleFoto> createState() => _DetalleFotoState();
}

class _DetalleFotoState extends State<DetalleFoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 50),
                    child: Text(
                      "Detalle foto wakala",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.all(0),
                width: 500,
                height: 500,
                decoration: BoxDecoration(
                  color: const Color(0x1f000000),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.zero,
                  border: Border.all(color: const Color(0x4d9e9e9e), width: 1),
                ),
                child: Image.memory(
                  widget.imageBytes,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: cancelButtonColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: const BorderSide(color: textColor, width: 2),
                      ),
                      padding: const EdgeInsets.all(16),
                      textColor: containerColor,
                      height: 50,
                      minWidth: MediaQuery.of(context).size.width * 0.6,
                      child: const Text(
                        " Volver al listado",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
