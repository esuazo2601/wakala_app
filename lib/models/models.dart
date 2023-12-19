import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String user;
  final String password;

  const UserModel({
    required this.user,
    required this.password,
  });

  toJson() {
    return {"user": user, "password": password};
  }
}

class ContadorPublicacion {
  final int sigueAhiCount;
  final int yaNoEstaCount;

  const ContadorPublicacion(
      {required this.sigueAhiCount, required this.yaNoEstaCount});
}

class PublicacionesModel {
  final String autor;
  final String descripcion;
  final Timestamp fecha;
  final String foto1;
  final String foto2;
  final String titulo;
  String? id;
  List<Comentarios> comentarios;
  PublicacionesModel(
      {required this.autor,
      required this.descripcion,
      required this.fecha,
      required this.foto1,
      required this.foto2,
      required this.titulo,
      this.id,
      required this.comentarios});

  toJson() {
    return {
      "Autor": autor,
      "Descripcion": descripcion,
      "Fecha": fecha,
      "Foto 1": foto1,
      "Foto 2": foto2,
      "Titulo": titulo,
    };
  }
}

class PostPublicacionModel {
  final DocumentReference autor;
  final String descripcion;
  final Timestamp fecha;
  final String foto1;
  final String foto2;
  final String titulo;
  final List<Comentarios> comentarios;
  const PostPublicacionModel(
      {required this.autor,
      required this.descripcion,
      required this.fecha,
      required this.foto1,
      required this.foto2,
      required this.titulo,
      required this.comentarios});

  toJson() {
    return {
      "Autor": autor,
      "Descripcion": descripcion,
      "Fecha": fecha,
      "Foto 1": foto1,
      "Foto 2": foto2,
      "Titulo": titulo
    };
  }
}

class SigueAhiModel {
  final Map<String, bool> presionados;

  const SigueAhiModel({required this.presionados});

  toJson() {
    return {"Sigue ahi": presionados};
  }

  addPressed(String idPublicacion) {
    if (!checkPressed(idPublicacion)) {
      presionados[idPublicacion] = true;
    } else {
      Exception("No puedes presionar dos veces");
    }
  }

  bool checkPressed(String idPublicacion) {
    if (presionados[idPublicacion] == true) return true;
    return false;
  }
}

class Comentarios {
  final String autor;
  final String contenido;
  final String refAutor;
  const Comentarios(
      {required this.autor, required this.contenido, required this.refAutor});

  toJson() {
    return {"Autor": autor, "Contenido": contenido, "RefAutor": refAutor};
  }

  factory Comentarios.fromJson(Map<String, dynamic> json) {
    return Comentarios(
      autor: json['autor'] ?? '',
      contenido: json['contenido'] ?? '',
      refAutor: json['refAutor'] ?? '',
    );
  }
}
