import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakala_app/models/models.dart';

//import 'firebase_options.dart';

final db = FirebaseFirestore.instance;

// Future<void> getUsers() async {
//   final data = db.collection("Usuarios");
//   await data.get().then((querySnapshot) {
//     for (var query in querySnapshot.docs) {
//       //print('${query.id} => ${query.data()}');
//     }
//   });
// }

Future<bool> handleLogin(String user, String password) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  QuerySnapshot<Map<String, dynamic>> snapshot = await db
      .collection("Usuarios")
      .where("user", isEqualTo: user)
      .where("password", isEqualTo: password)
      .get();
  if (snapshot.docs.isEmpty) {
    //print("error en logearse");
    return false;
  } else {
    //print("logeado con éxito :D");
    await prefs.setString("id", snapshot.docs[0].id);
    await prefs.setString("nombre", snapshot.docs[0].data()["nombre"]);
    await prefs.setBool("isLoggedIn", true);
    return true;
  }
}

Future<List<PublicacionesModel>> getPublicaciones() async {
  //print("LLamando a las publis");
  List<PublicacionesModel> publicaciones = [];
  try {
    var queryData = await db.collection("Publicaciones").get();

    for (var publicacion in queryData.docs) {
      // Utiliza await para esperar la resolución de la consulta
      var idAutor = publicacion.data()['Autor'];
      var usuarioDoc = await db.collection("Usuarios").doc(idAutor.id).get();
      var nombre = usuarioDoc.data()?['nombre'];

      // Recupera la lista de comentarios de la base de datos
      var comentariosData = publicacion.data()["Comentarios"] ?? [];

      // Convierte la lista de comentarios a instancias de la clase Comentarios
      List<Comentarios> comentarios = comentariosData
          .map<Comentarios>((dynamic comentario) =>
              Comentarios.fromJson(comentario as Map<String, dynamic>))
          .toList();

      publicaciones.add(PublicacionesModel(
          autor: nombre,
          descripcion: publicacion.data()["Descripcion"],
          fecha: publicacion.data()["Fecha"],
          foto1: publicacion.data()["Foto 1"],
          foto2: publicacion.data()["Foto 2"],
          titulo: publicacion.data()["Titulo"],
          id: publicacion.id,
          comentarios: comentarios));
    }
    return publicaciones;
  } catch (error) {
    // Maneja el error si es necesario
    //print("errore en tener publis :( $error");
    return publicaciones;
  }
}

Future<void> postPublicacion(PostPublicacionModel publicacion) async {
  var data = publicacion.toJson();
  db.collection("Publicaciones").add(data).then(
      (DocumentSnapshot) => print("Añadido prro ID: ${DocumentSnapshot.id}"));
}

Future<DocumentReference> getReferencia(String id) async {
  DocumentReference autorRef = db
      .collection(
          "Usuarios") // Reemplaza con el nombre de tu colección de usuarios
      .doc(id);
  return autorRef;
}

Future<Map<String, int>> actualizarContador(bool sigueAhi, String id) async {
  try {
    // Obtener la referencia del documento de la publicación
    DocumentReference publicacionRef =
        FirebaseFirestore.instance.collection("Publicaciones").doc(id);
    // Obtener los datos actuales del documento
    var publicacionSnapshot = await publicacionRef.get();
    // Obtener los valores actuales de los contadores
    var data = publicacionSnapshot.data() as Map<String, dynamic>?;

    int sigueAhiCount = data?['sigue_ahi'] ?? 0;
    int yaNoEstaCount = data?['ya_no_esta'] ?? 0;
    // Actualizar los contadores
    if (sigueAhi) {
      sigueAhiCount++;
    } else {
      yaNoEstaCount++;
    }

    // Actualizar el documento con los nuevos contadores
    await publicacionRef.update({
      'sigue_ahi': sigueAhiCount,
      'ya_no_esta': yaNoEstaCount,
    });

    // Devolver los nuevos contadores
    return {'sigueAhiCount': sigueAhiCount, 'yaNoEstaCount': yaNoEstaCount};
  } catch (e) {
    //print('Error al actualizar los contadores: $e');
    return {'sigueAhiCount': 0, 'yaNoEstaCount': 0};
  }
}

Future<ContadorPublicacion> getContador(String id) async {
  try {
    var publicacionDoc = await db.collection("Publicaciones").doc(id).get();

    if (publicacionDoc.exists) {
      // El documento existe, puedes acceder a los datos.
      //print("document $publicacionDoc");
      //      //print("data $auto");
      //print("data ${publicacionDoc.data()?['Descripcion']}");

      // Obtener los valores actuales de los contadores
      int sigueAhiCount = publicacionDoc.data()?['sigue_ahi'] ?? 0;
      int yaNoEstaCount = publicacionDoc.data()?['ya_no_esta'] ?? 0;

      return ContadorPublicacion(
        sigueAhiCount: sigueAhiCount,
        yaNoEstaCount: yaNoEstaCount,
      );
    } else {
      // El documento no existe.
      //print("El documento con ID $id no existe.");
      return ContadorPublicacion(sigueAhiCount: 0, yaNoEstaCount: 0);
    }
  } catch (e) {
    //print("Error al recuperar el contador: $e");
    return ContadorPublicacion(sigueAhiCount: 0, yaNoEstaCount: 0);
  }
}

Future<bool> addComentario(String idPublicacion, Comentarios comentario) async {
  try {
    // Obtén una referencia al documento de la publicación
    DocumentReference publicacionRef =
        db.collection('Publicaciones').doc(idPublicacion);
    //print("referencia: $publicacionRef");
    // Obtiene el documento actual de la publicación
    DocumentSnapshot publicacionSnapshot = await publicacionRef.get();
    //print("data $publicacionSnapshot");
    // Verifica si la lista de comentarios ya existe
    if (publicacionSnapshot.exists) {
      var data = publicacionSnapshot.data() as Map<String, dynamic>?;
      // La lista de comentarios ya existe, así que actualiza la lista con el nuevo comentario
      var lista = data?['Comentarios'] ?? [];
      lista.add(comentario.toJson());
      //print("mi lista: $lista");
      await publicacionRef.update({
        'Comentarios': lista,
      });
      return true;
    }
  } catch (e) {
    //print('Error al agregar comentario: $e');
    return false;
  }
  return false;
}

Future<List<Comentarios>> obtenerComentarios(String idPublicacion) async {
  try {
    // Obtén una referencia al documento de la publicación
    DocumentSnapshot publicacionSnapshot =
        await db.collection('Publicaciones').doc(idPublicacion).get();
    var data = publicacionSnapshot.data() as Map<String, dynamic>?;
    // Obtén la lista de comentarios del documento
    var comentariosData = data?['Comentarios'] ?? [];

    // Convierte los datos en instancias de la clase Comentarios
    //print("comentario $comentariosData");
    List<Comentarios> comentarios =
        comentariosData.map<Comentarios>((comentario) {
      return Comentarios(
          autor: comentario['Autor'],
          contenido: comentario['Contenido'],
          refAutor: comentario['RefAutor']);
    }).toList();
    //print("comentario lista $comentarios");
    return comentarios;
  } catch (e) {
    //print('Error al obtener comentarios: $e');
    return [];
  }
}
