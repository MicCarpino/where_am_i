enum Pages {
  workplaces_page,
  my_presences_page,
  presences_management_page,
  users_management_page
}

enum TimeSlot { fullDay, morning, evening }

enum TimePickerType { startPicker, endPicker }

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

enum Rooms { room_26B, room_26A_Floor1, room_26A_Floor2, room_24, room_staff }

extension RoomsTitles on Rooms {

  String reservationTitle() {
    switch (this) {
      case Rooms.room_26B:
        return "Civico 26/B";
      case Rooms.room_26A_Floor1:
        return "Civico 26/A";
      case Rooms.room_24:
        return "Civico 24";
      default:
        return null;
    }
  }

  String get title {
    switch (this) {
      case Rooms.room_26B:
        return 'Civico 26/B';
      case Rooms.room_26A_Floor1:
        return 'Civico 26/A 1°piano';
      case Rooms.room_26A_Floor2:
        return 'Civico 26/A 2°piano';
      case Rooms.room_24:
        return 'Civico 24';
      case Rooms.room_staff:
        return 'Amministrazione/Dirigenza';
      default:
        return null;
    }
  }

  int get idRoom {
    switch (this) {
      case Rooms.room_26B:
        return 26;
      case Rooms.room_26A_Floor2:
        return 262;
      case Rooms.room_24:
        return 24;
      default:
        return null;
    }
  }

  String get reservationRoomLabel {
    Map<int, String> reservationsRoomTitles = {
      26: "Civico 26/B",
      262: "Civico 26/A",
      24: "Civico 24",
    };
    return reservationsRoomTitles[this.idRoom];
  }

  String get reservationRoomSuffix {
    Map<int, String> reservationsRoomTitles = {
      26: "26/B",
      262: "26/A",
      24: "24",
    };
    return reservationsRoomTitles[this.idRoom];
  }
}
