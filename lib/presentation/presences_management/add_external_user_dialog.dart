import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:meta/meta.dart';
import 'package:where_am_i/core/utils/enums.dart';
import 'package:where_am_i/domain/blocs/presences_management/actor/presences_management_actor_bloc.dart';
import 'package:where_am_i/presentation/responsive_builder.dart';

class AddExternalUserDialog extends StatelessWidget {
  final String messageText;
  final DateTime date;

  AddExternalUserDialog({
    @required this.messageText,
    @required this.date,
  });

  final TextEditingController _textEditingController =
      new TextEditingController();
  final _textFormFieldKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder.buildDialog(context,
       Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                this.messageText,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              Form(
                key: _textFormFieldKey,
                child: TextFormField(
                    controller: _textEditingController,
                    autofocus: true,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Inserire un nominativo valido';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Annulla", style: TextStyle(color: dncBlue)),
                    ),
                    SizedBox(width: 16),
                    TextButton(
                      onPressed: () {
                        if (_textFormFieldKey.currentState.validate()) {
                          context
                              .read<PresencesManagementActorBloc>()
                              .add(PresencesManagementActorEvent.added(
                                timeSlot: TimeSlot.fullDay,
                                date: date,
                                freeName: _textEditingController.text.trim(),
                              ));
                          Navigator.pop(context);
                        }
                      },
                      child: Text("Aggiungi", style: TextStyle(color: dncBlue)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
