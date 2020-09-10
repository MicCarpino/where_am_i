import 'package:flutter/material.dart';

const Color  colorAccent = Color(0xffbe0f55);
const Color dncLightGray = Color(0xffEEEEEE);
const Color dncDarkGray = Color(0xffCCCCCC);
const Color dncBlue = Color(0xff0057A1);
const Color dncDarkBlue = Color(0xff004179);
const Color dncLightBlue = Color(0xff5083D3);
const Color dncTransparentBlue = Color(0xf20057A1);
const Color azure = Color(0xff8AB3FF);
const Color dncOrange = Color(0xffF27E19);
const Color dncOrangeLight = Color(0xCCF27E19);
const Color dncOrangeTransparent = Color(0x80F27E19);
const Color yellow = Color(0xffFFEB3B);
const Color yellowLight = Color(0xCCFFEB3B);
const Color yellowTransparent = Color(0x66FFEB3B);
const Color violet = Color(0xffD83BFF);

const Color blackLight = Color(0xCC000000);
const Color divider_color = Color(0xffaaaaaa);
//Datepicker
const Color transparent_70 = Color(0xffB3414141);

const String loginRoute = '/login';
const String homeRoute = '/home';

final kLabelStyle = TextStyle(
  color: dncBlue,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);