import 'package:flutter/material.dart';

const Color colorAccent = Color(0xffbe0f55);
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
const Color transparent_70 = Color(0xffB3414141);

//keys
const String SPLASH_SCREEN_KEY = 'SPLASH_SCREEN';
const String LOGIN_SCREEN_KEY = 'LOGIN_SCREEN';
const String HOME_SCREEN_KEY = 'HOME_SCREEN';
const String JWT_TOKEN_KEY = 'JWT_TOKEN';

//LocalHost
//const BASE_URL = "10.0.2.2:8080";
//Test
const BASE_URL = "test.dncsrl.com";
//Prod
//const BASE_URL = "wai.dncsrl.com";
const HTTP_TIMEOUT = Duration(seconds: 20);
//reservations constamts
const ROOM_24_CODE = 24;
const ROOM_26B_CODE = 26;
const ROOM_26A_CODE = 262;
const RESERVATION_PENDING = 0;
const RESERVATION_CONFIRMED = 1;
//roles constants
const ROLE_USER = 1;
const ROLE_STAFF = 2;
const ROLE_ADMIN = 3;
// workstations constants
const WORKSTATION_STATUS_PENDING = 0;
const WORKSTATION_STATUS_CONFIRMED = 1;
const TIME_SLOT_NINE = TimeOfDay(hour: 9, minute: 0);
const TIME_SLOT_THIRTEEN = TimeOfDay(hour: 13, minute: 0);
const TIME_SLOT_FOURTEEN = TimeOfDay(hour: 14, minute: 0);
const TIME_SLOT_EIGHTEEN = TimeOfDay(hour: 18, minute: 0);

//left current code, right old code
const getOldWorkstationCodeFor26b = {
  0: "1",
  1: "7",
  2: "13",
  3: "2",
  4: "8",
  5: "14",
  6: "3",
  7: "9",
  8: "15",
  9: "4",
  10: "10",
  11: "16",
  12: "5",
  13: "11",
  14: "17",
  15: "6",
  16: "12",
  17: "18"
};
//left current code, right old code
const getOldWorkstationCodeFor24 = {
  19: "19",
  21: "20",
  23: "21",
  25: "22",
  20: "23",
  22: "24",
  24: "25",
  26: "26",
  27: "27",
  29: "28",
  31: "29",
  33: "30",
  28: "31",
  30: "32",
  32: "33",
  34: "34"
};//left current code, right old code
const getOldWorkstationCodeFor26AF1Room1 = {
  76: "76",
  77: "77",
  78: "80",
  79: "81",
  80: "84",
  81: "85",
  82: "78",
  83: "79",
  84: "82",
  85: "83",
  86: "86",
  87: "87",
};


