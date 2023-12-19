## Wakala_App
# Proyecto desarrollado por:

* Richard Alejandro Gonzalez Lara
* Esteban Daniel Suazo Montalba

# Descripción

El layout de las vistas principales fue realizado utilizando la plataforma de low code FlutterViz y luego fueron modificadas a mano.

La base de datos fue realizada en Firebase y se realizaron las llamadas directamente desde Dart, los archivos asociados a esto se encuentran en la carpeta

```
lib/firebase
```

La cuenta se guarda mediante SharedPreferences, de modo que si has sido logueado anteriormente, la landing page será el listado de Wakalas, de lo contrario
será enviado a la pantalla de login.

Puede ingresar con una de las dos cuentas creadas:

```
user: dido@dido.com
password: 123
```
o

```
user: rialgou@rialgou.com
password: 123
```

Una vez dentro se pueden revisar los wakalas o agregar nuevos.

Enjoy! =) 

* PD:

No olvidar:

```
flutter pub get
```
