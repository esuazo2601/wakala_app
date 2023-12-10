///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Color(0xffffffff),
body:Align(
alignment:Alignment.center,
child:Padding(
padding:EdgeInsets.symmetric(vertical: 0,horizontal:16),
child:SingleChildScrollView(
child:
Column(
mainAxisAlignment:MainAxisAlignment.center,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:AssetImage("assets/images/mordecai_disgusted_face_hd_by_elsnourai_ddi3fgw.jpg"),
height:100,
width:180,
fit:BoxFit.cover,
),
Padding(
padding:EdgeInsets.fromLTRB(0, 10, 0, 30),
child:Text(
"WAKALA 1.0",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:20,
color:Color(0xff3a57e8),
),
),
),
Padding(
padding:EdgeInsets.symmetric(vertical: 16,horizontal:0),
child:TextField(
controller:TextEditingController(text:"john@gmail.com"),
obscureText:false,
textAlign:TextAlign.start,
maxLines:1,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xff000000),
),
decoration:InputDecoration(
disabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:BorderSide(
color:Color(0xff9e9e9e),
width:1
),
),
focusedBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:BorderSide(
color:Color(0xff9e9e9e),
width:1
),
),
enabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:BorderSide(
color:Color(0xff9e9e9e),
width:1
),
),
labelText:"Usuario",
labelStyle:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xff9e9e9e),
),
filled:true,
fillColor:Color(0x00f2f2f3),
isDense:false,
contentPadding:EdgeInsets.symmetric(vertical: 8,horizontal:12),
),
),
),
TextField(
controller:TextEditingController(text:"12345678"),
obscureText:true,
textAlign:TextAlign.start,
maxLines:1,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xff000000),
),
decoration:InputDecoration(
disabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:BorderSide(
color:Color(0xff9e9e9e),
width:1
),
),
focusedBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:BorderSide(
color:Color(0xff9e9e9e),
width:1
),
),
enabledBorder:OutlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:BorderSide(
color:Color(0xff9e9e9e),
width:1
),
),
labelText:"Password",
labelStyle:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xff9e9e9e),
),
filled:true,
fillColor:Color(0x00f2f2f3),
isDense:false,
contentPadding:EdgeInsets.symmetric(vertical: 8,horizontal:12),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 30, 0, 16),
child:Row(
mainAxisAlignment:MainAxisAlignment.center,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children:[


SizedBox(
width:16,
),
Expanded(
flex: 1,
child: Align(
alignment:Alignment.center,
child:MaterialButton(
onPressed:(){},
color:Color(0xff3a57e8),
elevation:0,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.circular(12.0),
),
padding:EdgeInsets.all(16),
child:Text("Ingresar", style: TextStyle( fontSize:16,
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xffffffff),
height:40,
minWidth:140,
),
),
),
],),),
Container(
margin:EdgeInsets.all(0),
padding:EdgeInsets.all(0),
width:200,
height:100,
decoration: BoxDecoration(
color:Color(0x1f000000),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.circular(5.0),
border:Border.all(color:Color(0x7b000000),width:2),
),
child:

Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
Align(
alignment:Alignment.centerLeft,
child:Text(
"By:",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.italic,
fontSize:16,
color:Color(0xff000000),
),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 15, 0, 0),
child:Row(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children:[

Padding(
padding:EdgeInsets.fromLTRB(5, 0, 0, 0),
child:Text(
"- Richard González",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xff000000),
),
),
),
],),),
Padding(
padding:EdgeInsets.fromLTRB(0, 15, 0, 0),
child:Row(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children:[

Padding(
padding:EdgeInsets.fromLTRB(5, 0, 0, 0),
child:Text(
"- Esteban Suazo",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xff000000),
),
),
),
],),),
],),
),
],),),),),
)
;}
}