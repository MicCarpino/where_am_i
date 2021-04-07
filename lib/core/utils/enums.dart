enum DeviceType {
  desktop,
  tablet,
  mobile,
}

enum Pages {
  workplaces_page,
  my_presences_page,
  presences_management_page,
  users_management_page
}

extension PagesTitles on Pages {
  String getPageTitle() {
    switch (this) {
      case Pages.my_presences_page:
        return 'Le mie presenze';
      case Pages.presences_management_page:
        return 'Gestione presenze';
      case Pages.users_management_page:
        return 'Gestione utenze';
      default:
        return '';
    }
  }
}

enum TimeSlot { fullDay, morning, evening }

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

  String get reservationRoomTitle {
    switch (this) {
      case Rooms.room_26B:
        return "Saletta riunioni 26/B";
      case Rooms.room_26A_Floor2:
        return "Saletta riunioni 26/A";
      case Rooms.room_24:
        return "Saletta riunioni 24";
      default:
        return null;
    }
  }
}

enum ReservationTimePicker { startPicker, endPicker }

extension Reservation on ReservationTimePicker {
  String get title {
    switch (this) {
      case ReservationTimePicker.startPicker:
        return "Ora inizio";
      case ReservationTimePicker.endPicker:
        return "Ora fine";
      default:
        return null;
    }
  }
}
