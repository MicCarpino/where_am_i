class WorkstationCodesConverter {
  //Because of automatic generation through list in some workplaces, desks order
  // is different from the original android version which was drawn manually
  //this class map old codes to newer (flutter) codes for some workspaces
  int toOldWorkstationCode(int newWorkstationCode) {
    int workstationCode = newWorkstationCode;
    if (newWorkstationCode <= 18) {
      workstationCode = _getOldWorkstationCodeFor26b[newWorkstationCode];
    } else if (newWorkstationCode >= 19 && newWorkstationCode <= 34) {
      workstationCode = _getOldWorkstationCodeFor24[newWorkstationCode];
    } else if (newWorkstationCode >= 76 && newWorkstationCode <= 87) {
      workstationCode = _getOldWorkstationCodeFor26AF1Room1[newWorkstationCode];
    }
    return workstationCode;
  }

//left current code, right old code
  final _getOldWorkstationCodeFor26b = {
    0: 1,
    1: 7,
    2: 13,
    3: 2,
    4: 8,
    5: 14,
    6: 3,
    7: 9,
    8: 15,
    9: 4,
    10: 10,
    11: 16,
    12: 5,
    13: 11,
    14: 17,
    15: 6,
    16: 12,
    17: 18
  };

//left current code, right old code
  final _getOldWorkstationCodeFor24 = {
    19: 19,
    21: 20,
    23: 21,
    25: 22,
    20: 23,
    22: 24,
    24: 25,
    26: 26,
    27: 27,
    29: 28,
    31: 29,
    33: 30,
    28: 31,
    30: 32,
    32: 33,
    34: 34
  };

  //left current code, right old code
  final _getOldWorkstationCodeFor26AF1Room1 = {
    76: 76,
    77: 77,
    78: 80,
    79: 81,
    80: 84,
    81: 85,
    82: 78,
    83: 79,
    84: 82,
    85: 83,
    86: 86,
    87: 87,
  };
}
