import 'package:flutter/material.dart';
import 'package:wakala_app/color_palette.dart';
import 'package:wakala_app/login_screen.dart';
import 'package:wakala_app/models/models.dart';
import 'package:wakala_app/wakala.dart';
import 'package:wakala_app/firebase/firestore.dart';

class WakalasList extends StatefulWidget {
  const WakalasList({super.key});

  @override
  State<WakalasList> createState() => _WakalasListState();
}

class _WakalasListState extends State<WakalasList> {
  late List<Wakala> wakalaList;
  late List<PublicacionesModel> publicaciones;

  // getPub() async {
  //   publicaciones = await getPublicaciones();
  //   wakalaList = publicaciones
  //       .map((publicacion) => Wakala(publicacion: publicacion))
  //       .toList();
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   wakalaList = [];
  //   publicaciones = [];
  //   getPub();
  // }

  Widget buildWakalasList() {
    return FutureBuilder<List<PublicacionesModel>>(
      future: getPublicaciones(),
      builder: (BuildContext context,
          AsyncSnapshot<List<PublicacionesModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Mientras está en progreso la obtención de datos
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Si hay un error
          return Text('Error: ${snapshot.error}');
        } else {
          // Cuando la operación ha sido completada exitosamente
          List<Wakala> wakalaList = snapshot.data!
              .map((publicacion) => Wakala(publicacion: publicacion))
              .toList();

          return ListView.builder(
            itemCount: wakalaList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(wakalaList[index].toString()),
                // Otros elementos de tu lista
              );
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        elevation: 4,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: topColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: const Text(
          "Lista de Wakalas",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: backGroundColor,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: backGroundColor,
            size: 24,
          ),
          onPressed: () {
            // Regresar a la pantalla de login
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              buildWakalasList(),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Ink(
                              decoration: const ShapeDecoration(
                                  color: topColor, shape: CircleBorder()),
                              child: IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () async {
                                  getPublicaciones();
                                },
                                color: backGroundColor,
                                iconSize: 30,
                              ),
                            )),
                      ),
                    ],
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
