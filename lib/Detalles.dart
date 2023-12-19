import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakala_app/color_palette.dart';
import 'package:wakala_app/comentario.dart';
import 'package:wakala_app/firebase/firestore.dart';
import 'package:wakala_app/models/models.dart';
import 'package:intl/intl.dart';
import 'package:wakala_app/new_comment.dart';
import 'dart:typed_data';
import 'package:wakala_app/detalle_foto.dart';

class Detalles extends StatefulWidget {
  const Detalles({
    super.key,
    required this.publicacion,
  });
  final PublicacionesModel publicacion;

  @override
  State<Detalles> createState() => _DetallesState();
}

class _DetallesState extends State<Detalles> {
  int sigueAhiCount = 0;
  int yaNoEstaCount = 0;

  late SharedPreferences prefs;

  late Future<List<Comentarios>> comentariosFuture;

  @override
  void initState() {
    super.initState();
    obtenerSharedPreferences();
    // Llamada a la función para obtener los contadores
    obtenerContadores();
    comentariosFuture = obtenerComentarios(widget.publicacion.id ?? '');
  }

  Future<void> obtenerSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  // Función para obtener los contadores
  Future<void> obtenerContadores() async {
    try {
      ContadorPublicacion contadores =
          await getContador(widget.publicacion.id ?? '');
      setState(() {
        sigueAhiCount = contadores.sigueAhiCount;
        yaNoEstaCount = contadores.yaNoEstaCount;
      });
    } catch (e) {
      print('Error al obtener contadores: $e');
    }
  }

  void showImage(String? base64String) {
    if (base64String != null && base64String.isNotEmpty) {
      try {
        List<int> bytes = base64.decode(base64String);
        Uint8List imageBytes = Uint8List.fromList(bytes);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalleFoto(imageBytes: imageBytes),
          ),
        );
      } catch (e) {
        print('Error al decodificar la imagen base64: $e');
      }
    }
  }

  Widget createImage(String? base64String) {
    if (base64String != null && base64String.isNotEmpty) {
      try {
        List<int> bytes = base64.decode(base64String);
        Uint8List imageBytes = Uint8List.fromList(bytes);

        return Image.memory(
          imageBytes,
          height: 150,
          width: MediaQuery.of(context).size.width * 0.4,
          fit: BoxFit.contain,
        );
      } catch (e) {
        print('Error al decodificar la imagen base64: $e');
      }
    }
    return Container(
      width: 0,
      height: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        elevation: 3,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: topColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          widget.publicacion.titulo,
          style: const TextStyle(
              color: containerColor, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: containerColor,
            )),
      ),
      body: Builder(builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: widget.publicacion.foto2.isNotEmpty
                            ? MainAxisAlignment.spaceEvenly
                            : MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          GestureDetector(
                            onTap: () => showImage(widget.publicacion.foto1),
                            child: createImage(widget.publicacion.foto1),
                          ),
                          if (widget.publicacion.foto2.isNotEmpty)
                            GestureDetector(
                              onTap: () => showImage(widget.publicacion.foto2),
                              child: createImage(widget.publicacion.foto2),
                            ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              child: Text(
                                "Por @${widget.publicacion.autor} |",
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18,
                                  color: textColor,
                                ),
                              ),
                            ),
                            Text(
                              DateFormat('dd-MM-yyyy')
                                  .format(widget.publicacion.fecha.toDate()),
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                                fontSize: 18,
                                color: textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        widget.publicacion.descripcion,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                          color: textColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            MaterialButton(
                              onPressed: () async {
                                // Llamada a la función para actualizar el contador
                                await actualizarContador(
                                        true, widget.publicacion.id ?? "")
                                    .then((value) {
                                  setState(() {
                                    sigueAhiCount = value['sigueAhiCount'] ?? 0;
                                    yaNoEstaCount = value['yaNoEstaCount'] ?? 0;
                                  });
                                });
                                // Actualiza los contadores después de la acción
                                //await obtenerContadores();
                              },
                              color: topColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                side: const BorderSide(
                                    color: textColor, width: 2),
                              ),
                              padding: const EdgeInsets.all(16),
                              textColor: const Color(0xff000000),
                              height: 40,
                              minWidth: MediaQuery.of(context).size.width * 0.3,
                              child: Row(
                                children: [
                                  const Text(
                                    "Sigue ahi (C)",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      color: containerColor,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '$sigueAhiCount', // Muestra el contador sigueAhi
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      color: containerColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            MaterialButton(
                              onPressed: () async {
                                // Llamada a la función para actualizar el contador
                                await actualizarContador(
                                        false, widget.publicacion.id ?? "")
                                    .then((value) {
                                  setState(() {
                                    sigueAhiCount = value['sigueAhiCount'] ?? 0;
                                    yaNoEstaCount = value['yaNoEstaCount'] ?? 0;
                                  });
                                });
                              },
                              color: topColor,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                side: const BorderSide(
                                    color: textColor, width: 2),
                              ),
                              padding: const EdgeInsets.all(16),
                              textColor: const Color(0xff000000),
                              height: 40,
                              minWidth: MediaQuery.of(context).size.width * 0.3,
                              child: Row(
                                children: [
                                  const Text(
                                    "Ya no está (C)",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      color: containerColor,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '$yaNoEstaCount', // Muestra el contador yaNoEsta
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      color: containerColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Text(
                                  "Comentarios",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16,
                                    color: textColor,
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () async {
                                    bool comentarioAgregado =
                                        await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NewComment(
                                            publicacion: widget.publicacion),
                                      ),
                                    );

                                    // Actualiza Detalles si el comentario se agregó correctamente
                                    if (comentarioAgregado == true) {
                                      setState(() {
                                        comentariosFuture = obtenerComentarios(
                                            widget.publicacion.id ?? '');
                                        // También puedes realizar otras actualizaciones según sea necesario
                                      });
                                    }
                                  },
                                  color: topColor,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    side: const BorderSide(
                                        color: textColor, width: 2),
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  textColor: const Color(0xff000000),
                                  height: 40,
                                  minWidth:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: const Text(
                                    "Comentar",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        color: containerColor),
                                  ),
                                ),
                              ],
                            ),
                            FutureBuilder<List<Comentarios>>(
                              future: comentariosFuture,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator(); // Muestra un indicador de carga mientras se obtienen los comentarios
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  List<Comentarios> comentarios =
                                      snapshot.data ?? [];

                                  // Aquí puedes usar la lista de comentarios para construir tus widgets
                                  return Column(
                                    children: comentarios.map((comentario) {
                                      return Comentario(comentario: comentario);
                                    }).toList(),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.bottomCenter,
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
                    height: 50,
                    minWidth: MediaQuery.of(context).size.width,
                    child: const Text(
                      " Volver al listado",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
