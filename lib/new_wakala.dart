import 'package:flutter/material.dart';
import 'package:wakala_app/color_palette.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wakala_app/utils.dart';
import 'package:wakala_app/color_palette.dart';
import 'dart:io';

class NewWakala extends StatefulWidget {
  const NewWakala({super.key});

  @override
  State<NewWakala> createState() => _NewWakalaState();
}

class _NewWakalaState extends State<NewWakala> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _sectorController = TextEditingController();
  final _descripcionController = TextEditingController();
  File? image1;
  File? image2;
  String? imagePath1;
  String? imagePath2;

  Future<String?> _showImageSourceDialog() async {
    return await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Fuente de imagen"),
          backgroundColor: backGroundColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Cámara"),
                textColor: textColor,
                iconColor: topColor,
                onTap: () {
                  Navigator.pop(context, 'camera');
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text("Galería"),
                textColor: textColor,
                iconColor: topColor,
                onTap: () {
                  Navigator.pop(context, 'gallery');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<String?> pickMedia() async {
    String? source = await _showImageSourceDialog();
    if (source == null) {
      return null;
    }

    XFile? file;
    if (source == 'camera') {
      file = await ImagePicker().pickImage(source: ImageSource.camera);
    } else {
      file = await ImagePicker().pickImage(source: ImageSource.gallery);
    }

    if (file != null) {
      return file.path;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 120, 0, 15),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "AVISO POR NUEVO WAKALA",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      color: textColor,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    padding: const EdgeInsets.all(0),
                    width: 300,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: backGroundColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.zero,
                    ),
                    child: TextFormField(
                      controller: _sectorController,
                      obscureText: false,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: textColor,
                      ),
                      decoration: InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                              color: Color(0xff000000), width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                              color: Color(0xff000000), width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                              color: Color(0xff000000), width: 2),
                        ),
                        hintText: "Sector",
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          color: textColor,
                        ),
                        filled: true,
                        fillColor: containerColor,
                        isDense: false,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por Favor, Ingrese un sector';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                padding: const EdgeInsets.all(0),
                width: 300,
                height: 100,
                child: TextFormField(
                  controller: _descripcionController,
                  obscureText: false,
                  textAlign: TextAlign.start,
                  maxLines: 6,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: textColor,
                  ),
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:
                          const BorderSide(color: Color(0xff000000), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:
                          const BorderSide(color: Color(0xff000000), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide:
                          const BorderSide(color: Color(0xff000000), width: 2),
                    ),
                    hintText: "Descripcion",
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: textColor,
                    ),
                    filled: true,
                    fillColor: containerColor,
                    isDense: false,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese la descripción (minimo 15 caracteres)';
                    } else if (value.length < 15) {
                      return 'La descripción debe tener al menos 15 caracteres';
                    }
                    return null;
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                          child: Text(
                            "Foto 1",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Foto 2",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            fontSize: 20,
                            color: Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 15, 10),
                        child: InkWell(
                          onTap: () async {
                            String? imagePath = await pickMedia();
                            if (imagePath != null) {
                              setState(() {
                                imagePath1 = imagePath;
                              });
                            }
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: const Color(0xff212435),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: imagePath1 != null
                                ? Image.file(
                                    File(imagePath1!),
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(Icons.photo_camera,
                                    color: Colors.white, size: 40),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                        child: InkWell(
                          onTap: () async {
                            String? imagePath = await pickMedia();
                            if (imagePath != null) {
                              setState(() {
                                imagePath2 = imagePath;
                              });
                            }
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: const Color(0xff212435),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: imagePath2 != null
                                ? Image.file(
                                    File(imagePath2!),
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(Icons.photo_camera,
                                    color: Colors.white, size: 40),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            imagePath1 = null;
                          });
                        },
                        color: topColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: const BorderSide(
                              color: Color(0xff000000), width: 1),
                        ),
                        padding: const EdgeInsets.all(16),
                        textColor: containerColor,
                        height: 40,
                        minWidth: 100,
                        child: const Text(
                          "BORRAR",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            imagePath2 = null;
                          });
                        },
                        color: topColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: const BorderSide(
                              color: Color(0xff000000), width: 1),
                        ),
                        padding: const EdgeInsets.all(16),
                        textColor: containerColor,
                        height: 40,
                        minWidth: 100,
                        child: const Text(
                          "BORRAR",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          print("complete los campos faltantes");
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Complete los campos correctamente")));
                          return;
                        } else if (imagePath1 == null) {
                          print("debe subir por lo menos la imagen 1");
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Debe subir al menos la Foto 1")));
                          return;
                        } else {
                          print("validado con éxito");
                        }
                      },
                      color: topColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(
                            color: Color(0xff000000), width: 1),
                      ),
                      padding: const EdgeInsets.all(16),
                      textColor: containerColor,
                      height: 40,
                      minWidth: 230,
                      child: const Text(
                        "DENUNCIAR WAKALA",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: const Color(0xffA52228),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: const BorderSide(color: topColor, width: 3),
                      ),
                      padding: const EdgeInsets.all(16),
                      textColor: containerColor,
                      height: 40,
                      minWidth: 140,
                      child: const Text(
                        "ME ARREPENTÍ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
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
