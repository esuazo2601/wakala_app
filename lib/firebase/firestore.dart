import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakala_app/models/models.dart';

//import 'firebase_options.dart';

final db = FirebaseFirestore.instance;

Future<void> getUsers() async {
  final data = db.collection("Usuarios");
  await data.get().then((querySnapshot) {
    for (var query in querySnapshot.docs) {
      print('${query.id} => ${query.data()}');
    }
  });
}

Future<bool> handleLogin(String user, String password) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  QuerySnapshot<Map<String, dynamic>> snapshot = await db
      .collection("Usuarios")
      .where("user", isEqualTo: user)
      .where("password", isEqualTo: password)
      .get();
  if (snapshot.docs.isEmpty) {
    print("error en logearse");
    return false;
  } else {
    print("logeado con éxito :D");
    await prefs.setString("id", snapshot.docs[0].id);
    await prefs.setString("nombre", snapshot.docs[0].data()["nombre"]);
    await prefs.setBool("isLoggedIn", true);
    return true;
  }
}

Future<List<PublicacionesModel>> getPublicaciones() async {
  print("LLamando a las publis");
  List<PublicacionesModel> publicaciones = [];
  try {
    var queryData = await db.collection("Publicaciones").get();

    for (var publicacion in queryData.docs) {
      // Utiliza await para esperar la resolución de la consulta
      var idAutor = publicacion.data()['Autor'];
      var usuarioDoc = await db.collection("Usuarios").doc(idAutor.id).get();
      var nombre = usuarioDoc.data()?['nombre'];
      publicaciones.add(PublicacionesModel(
          autor: nombre,
          descripcion: publicacion.data()["Descripcion"],
          fecha: publicacion.data()["Fecha"],
          foto1: publicacion.data()["Foto 1"],
          foto2: publicacion.data()["Foto 2"],
          titulo: publicacion.data()["Titulo"]));
    }
    return publicaciones;
  } catch (error) {
    // Maneja el error si es necesario
    print(error);
    return publicaciones;
  }
}

Future<void> postPublicacion(PostPublicacionModel publicacion) async {
  var data = publicacion.toJson();
  db.collection("Publicaciones").add(data).then(
      (DocumentSnapshot) => print("Añadido prro ID: ${DocumentSnapshot.id}"));
}

Future<DocumentReference> getReferencia(String id) async {
  DocumentReference autorRef = FirebaseFirestore.instance
      .collection(
          "Usuarios") // Reemplaza con el nombre de tu colección de usuarios
      .doc(id);
  return autorRef;
}
