import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
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
  final QuerySnapshot<Map<String, dynamic>> snapshot = await db
      .collection("Usuarios")
      .where("user", isEqualTo: user)
      .where("password", isEqualTo: password)
      .get();
  if (snapshot.docs.isEmpty) {
    print("error en logearse");
    return false;
  } else {
    print("logeado con éxito :D");
    return true;
  }
}
