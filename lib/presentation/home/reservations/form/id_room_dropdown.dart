import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/domain/blocs/reservation/form/reservation_form_bloc.dart';

//the widget for the "room selection" field in the reservation form
//just staff/admin can use this function to move reservations within workspaces
class IdRoomDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationFormBloc, ReservationFormState>(
        buildWhen: (p, c) =>
            p.reservationForm.idRoom != c.reservationForm.idRoom,
        //update the idRoom when an option in the dropdown is chosen
        builder: (context, state) => DropdownButton(
              value: state.reservationForm.idRoom,
              items: Rooms.values
                  .where((element) => element.idRoom != null)
                  .map((e) => DropdownMenuItem(
                        value: e.idRoom,
                        child: Text(e.title.toString()),
                      ))
                  .toList(),
              onChanged: (int idRoom) => context
                  .read<ReservationFormBloc>()
                  .add(ReservationFormEvent.idRoomChanged(idRoom)),
            ));
  }
}
