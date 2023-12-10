///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';


class Detalles extends StatelessWidget {

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Color(0xffffffff),
appBar: 
AppBar(
elevation:3,
centerTitle:false,
automaticallyImplyLeading: false,
backgroundColor:Color(0xffffffff),
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
),
title:Text(
"Dentro de wakala",
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
leading: Icon(
Icons.arrow_back,
color:Color(0xff212435),
size:24,
),
),
body:SizedBox(
height:MediaQuery.of(context).size.height,
width:MediaQuery.of(context).size.width,
child:
Stack(
alignment:Alignment.topLeft,
children: [
Padding(
padding:EdgeInsets.fromLTRB(16, 16, 16, 80),
child:SingleChildScrollView(
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
Row(
mainAxisAlignment:MainAxisAlignment.spaceEvenly,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children:[


Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:NetworkImage("https://picsum.photos/250?image=9"),
height:100,
width:100,
fit:BoxFit.contain,
),
],),

Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:NetworkImage("https://picsum.photos/250?image=9"),
height:100,
width:100,
fit:BoxFit.contain,
),
],),
],),
Padding(
padding:EdgeInsets.symmetric(vertical: 10,horizontal:0),
child:Row(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children:[


Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
Padding(
padding:EdgeInsets.fromLTRB(0, 0, 25, 0),
child:Text(
"Subido por @user el",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w800,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
),
],),

Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
Text(
"22/09/2022",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w500,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
],),
],),),
Text(
"Spinach is a herbaceous plant whose leaves, green and arranged in rosette, are eaten raw or cooked. The leaves have an oval shape and are wrinkled; they can be whole or sawed. It is a very nutritious, tasteful and easy-to-digest plant. The Arabs regarded it as the queen of vegetables.",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 15, 0, 20),
child:Row(
mainAxisAlignment:MainAxisAlignment.spaceEvenly,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children:[


Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
MaterialButton(
onPressed:(){},
color:Color(0xffffffff),
elevation:0,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
side:BorderSide(color:Color(0xff000000),width:1),
),
padding:EdgeInsets.all(16),
child:Text("Sigue ahi (C)", style: TextStyle( fontSize:14,
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xff000000),
height:40,
minWidth:MediaQuery.of(context).size.width * 0.3,
),
],),

Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
MaterialButton(
onPressed:(){},
color:Color(0xffffffff),
elevation:2,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
side:BorderSide(color:Color(0xff000000),width:1),
),
padding:EdgeInsets.all(16),
child:Text("Ya no está (C)", style: TextStyle( fontSize:14,
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xff000000),
height:40,
minWidth:MediaQuery.of(context).size.width * 0.3,
),
],),
],),),
Container(
margin:EdgeInsets.all(0),
padding:EdgeInsets.all(0),
width:MediaQuery.of(context).size.width,
height:MediaQuery.of(context).size.height,
decoration: BoxDecoration(
color:Color(0x00000000),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.zero,
border:Border.all(color:Color(0x4d9e9e9e),width:1),
),
child:
Padding(
padding:EdgeInsets.fromLTRB(0, 10, 0, 0),
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
Row(
mainAxisAlignment:MainAxisAlignment.spaceEvenly,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children:[


Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
Text(
"Comentarios",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w600,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
],),

Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
MaterialButton(
onPressed:(){},
color:Color(0xffffffff),
elevation:0,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
side:BorderSide(color:Color(0xff808080),width:1),
),
padding:EdgeInsets.all(16),
child:Text("Comentar", style: TextStyle( fontSize:14,
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xff000000),
height:40,
minWidth:MediaQuery.of(context).size.width * 0.2,
),
],),
],),
Container(
margin:EdgeInsets.fromLTRB(0, 12, 0, 0),
padding:EdgeInsets.all(0),
width:MediaQuery.of(context).size.width * 0.8,
height:MediaQuery.of(context).size.height * 0.1,
decoration: BoxDecoration(
color:Color(0x19000000),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.zero,
border:Border.all(color:Color(0x4d9e9e9e),width:1),
),
child:

Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
Row(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children:[

Padding(
padding:EdgeInsets.fromLTRB(0, 0, 0, 5),
child:Text(
"lasdklaskla",
textAlign: TextAlign.start,
overflow:TextOverflow.visible,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
),
],),
Row(
mainAxisAlignment:MainAxisAlignment.end,
crossAxisAlignment:CrossAxisAlignment.end,
mainAxisSize:MainAxisSize.max,
children:[

Padding(
padding:EdgeInsets.fromLTRB(0, 0, 5, 0),
child:Text(
"por @user",
textAlign: TextAlign.justify,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
),
],),
],),
),
],),),
),
],),),),
Padding(
padding:EdgeInsets.all(16),
child:Align(
alignment:Alignment.bottomCenter,
child:MaterialButton(
onPressed:(){},
color:Color(0xff3a57e8),
elevation:0,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.circular(12.0),
side:BorderSide(color:Color(0xffffffff),width:1),
),
padding:EdgeInsets.all(16),
child:Text(" Volver al listado", style: TextStyle( fontSize:16,
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xffffffff),
height:50,
minWidth:MediaQuery.of(context).size.width,
),
),
),
],),),
)
;}
}