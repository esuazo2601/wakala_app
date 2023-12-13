import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakala_app/color_palette.dart';
import 'package:wakala_app/login_screen.dart';
import 'package:wakala_app/models/models.dart';
import 'package:wakala_app/new_wakala.dart';
import 'package:wakala_app/wakala.dart';
import 'package:wakala_app/firebase/firestore.dart';

class WakalasList extends StatefulWidget {
  const WakalasList({super.key});

  @override
  State<WakalasList> createState() => _WakalasListState();
}

class _WakalasListState extends State<WakalasList> {
  GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  late List<PublicacionesModel> publicaciones;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    // Inicializar la lista de publicaciones al inicio
    publicaciones = [];
    // Cargar las publicaciones por primera vez
    refresh();
    initSharedPreferences();
  }

  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> refresh() async {
    try {
      var newPublicaciones = await getPublicaciones();
      setState(() {
        publicaciones = newPublicaciones;
      });
    } catch (error) {
      // Manejar errores, por ejemplo, mostrar un Snackbar con el error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al actualizar: $error'),
        ),
      );
    }
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
            onPressed: () {
              prefs.remove('id');
              prefs.remove('nombre');
              prefs.remove('isLoggedIn');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            icon: const Icon(
              Icons.logout,
              color: backGroundColor,
              size: 24,
            )),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        key: refreshIndicatorKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: FutureBuilder(
                  future: getPublicaciones(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Wakala(publicacion: snapshot.data![index]);
                        },
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 5, 30),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Ink(
                      decoration: const ShapeDecoration(
                          color: topColor, shape: CircleBorder()),
                      child: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewWakala()));
                        },
                        color: backGroundColor,
                        iconSize: 50,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
