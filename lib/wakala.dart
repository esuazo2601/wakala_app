import 'package:flutter/material.dart';
import 'package:wakala_app/detalles.dart';
import 'package:wakala_app/color_palette.dart';
import 'package:wakala_app/models/models.dart';
import 'package:intl/intl.dart';

class Wakala extends StatelessWidget {
  final PublicacionesModel publicacion;

  const Wakala({super.key, required this.publicacion});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 13, 0, 0),
      padding: const EdgeInsets.fromLTRB(12, 0, 0, 2),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 243, 242, 241),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: textColor, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.article,
            color: topColor,
            size: 50,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          publicacion.titulo,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: textColor,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => Detalles(
                                    publicacion: publicacion,
                                  )),
                            ),
                          );
                        },
                        icon: const Icon(Icons.arrow_forward_ios, size: 20),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                    child: Text(
                      DateFormat('dd-MM-yyyy')
                          .format(publicacion.fecha.toDate()),
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xff393939),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Por: @${publicacion.autor}",
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
