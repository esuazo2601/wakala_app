///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';


class WakalasList extends StatelessWidget {

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Color(0xffffffff),
appBar: 
AppBar(
elevation:4,
centerTitle:false,
automaticallyImplyLeading: false,
backgroundColor:Color(0xff3a57e8),
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
),
title:Text(
"Lista de Wakalas",
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xffdfdfdf),
),
),
leading: Icon(
Icons.arrow_back,
color:Color(0xff212435),
size:24,
),
),
body:Padding(
padding:EdgeInsets.symmetric(vertical: 0,horizontal:16),
child:SingleChildScrollView(
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.start,
mainAxisSize:MainAxisSize.max,
children: [

ListView(
scrollDirection: Axis.vertical,
padding:EdgeInsets.all(0),
shrinkWrap:true,
physics:ScrollPhysics(), 
children:[

Container(
margin:EdgeInsets.fromLTRB(0, 15, 0, 16),
padding:EdgeInsets.all(12),
decoration: BoxDecoration(
color:Color(0xffffffff),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.circular(12.0),
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

Icon(
Icons.article,
color:Color(0xff3a57e8),
size:50,
),
Expanded(
flex: 1,
child: Padding(
padding:EdgeInsets.fromLTRB(16, 0, 0, 0),
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.start,
mainAxisSize:MainAxisSize.max,
children: [
Row(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children:[

Expanded(
flex: 1,
child: Row(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children:[

Expanded(
flex: 1,
child: Text(
"The Role of Cretivity in UX design?",
textAlign: TextAlign.start,
maxLines:1,
overflow:TextOverflow.ellipsis,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xff000000),
),
),
),
],),),
Icon(
Icons.arrow_forward_ios,
color:Color(0xff212435),
size:20,
),
],),
Padding(
padding:EdgeInsets.fromLTRB(0, 4, 0, 0),
child:Row(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children:[

Expanded(
flex: 1,
child: Text(
"15 Sep, 2020 02:30 Am ",
textAlign: TextAlign.start,
maxLines:1,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff393939),
),
),
),
Container(
margin:EdgeInsets.fromLTRB(8, 0, 0, 0),
padding:EdgeInsets.symmetric(vertical: 4,horizontal:8),
decoration: BoxDecoration(
color:Color(0x343a57e8),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.circular(4.0),
),
)

,
],),),
Row(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children:[

Text(
"Por: @chalalo",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
],),
],),),),
],),
],),
),
],),
Align(
alignment:Alignment.center,
child:Padding(
padding:EdgeInsets.fromLTRB(0, 15, 0, 0),
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.end,
mainAxisSize:MainAxisSize.max,
children: [
Padding(
padding:EdgeInsets.fromLTRB(0, 15, 0, 0),
child:Align(
alignment:Alignment.centerRight,
child:IconButton(
icon:Icon(
Icons.add
),
onPressed:(){},
color:Color(0xff212435),
iconSize:30,
),
),
),
],),),),
],),),),
)
;}
}