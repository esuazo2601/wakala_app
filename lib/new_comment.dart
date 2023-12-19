library;

import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakala_app/color_palette.dart';
import 'package:wakala_app/firebase/firestore.dart';
import 'package:wakala_app/models/models.dart';

class NewComment extends StatefulWidget {
  const NewComment({
    super.key,
    required this.publicacion,
  });
  final PublicacionesModel publicacion;
  @override
  State<NewComment> createState() => _NewCommentState();
}

class _NewCommentState extends State<NewComment> {
  final _comentarioController = TextEditingController();
  late SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    obtenerSharedPreferences();
  }

  Future<void> obtenerSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: topColor,
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.9,
            decoration: BoxDecoration(
              color: bottomColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.zero,
              border: Border.all(color: const Color(0xe6000000), width: 2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                      child: Text(
                        "Dentro de ${widget.publicacion.titulo}",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.all(0),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: BoxDecoration(
                    color: const Color(0x1f000000),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.zero,
                    border:
                        Border.all(color: const Color(0x4d9e9e9e), width: 1),
                  ),
                  child: TextField(
                    controller: _comentarioController,
                    obscureText: false,
                    textAlign: TextAlign.start,
                    maxLines: 100,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff000000),
                    ),
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                            color: Color(0xff000000), width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                            color: Color(0xff000000), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                            color: Color(0xff000000), width: 1),
                      ),
                      hintText: "Comentario",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                      filled: true,
                      fillColor: const Color(0xfff2f2f3),
                      isDense: false,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: MaterialButton(
                        onPressed: () async {
                          if (_comentarioController.text.isEmpty) {
                            MotionToast.error(
                              title: const Text("Debes ingresar un comentario"),
                              description: const Text(
                                  "Rellena el campo con tu comentario"),
                            ).show(context);
                            return;
                          }
                          Comentarios newComentario = Comentarios(
                              autor: prefs.getString('nombre') ?? '@johnDoe',
                              contenido: _comentarioController.text,
                              refAutor: prefs.getString('id') ?? '');
                          if (await addComentario(
                              widget.publicacion.id ?? '', newComentario)) {
                            MotionToast.success(
                              title: const Text("Éxito"),
                              description: const Text(
                                  "Comentario agregado correctamente"),
                              toastDuration: Durations.extralong4,
                            ).show(context);
                            await Future.delayed(const Duration(seconds: 2));
                            Navigator.pop(context, true);
                          } else {
                            MotionToast.error(
                              title: const Text("error al crear comentario"),
                              description:
                                  const Text("ocurrio un error inesperado"),
                            ).show(context);
                          }
                        },
                        color: topColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: const BorderSide(color: textColor, width: 2),
                        ),
                        padding: const EdgeInsets.all(16),
                        textColor: containerColor,
                        height: 40,
                        minWidth: MediaQuery.of(context).size.width * 0.6,
                        child: const Text(
                          "COMENTAR WAKALA",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: MaterialButton(
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
                        height: 40,
                        minWidth: MediaQuery.of(context).size.width * 0.6,
                        child: const Text(
                          "ME ARREPENTI",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
