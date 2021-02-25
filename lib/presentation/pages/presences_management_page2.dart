import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/domain/repositories/user_repository.dart';
import 'package:where_am_i/domain/repositories/workstation_repository.dart';
import 'package:where_am_i/presentation/bloc/presences_management/actor/presences_management_actor_bloc.dart';
import 'package:where_am_i/presentation/bloc/presences_management/watcher/presences_management_watcher_bloc.dart';
import 'package:where_am_i/presentation/widgets/date_picker.dart';
import 'package:where_am_i/presentation/widgets/retry_widget.dart';
import 'package:where_am_i/presentation/widgets/text_input_dialog.dart';
import 'package:where_am_i/presentation/widgets/time_slot_dialog2.dart';
import 'package:where_am_i/presentation/widgets/users_presences_list_widget.dart';
import '../../injection_container.dart';

class PresencesManagementPage2 extends StatefulWidget {
  @override
  _PresencesManagementPage2State createState() =>
      _PresencesManagementPage2State();
}

class _PresencesManagementPage2State extends State<PresencesManagementPage2> {
  TextEditingController _textFieldController = TextEditingController();
  DateTime visualizedDate;

  @override
  void initState() {
    visualizedDate = DateTime.now().zeroed();
    _textFieldController.addListener(() {
      context.read<PresencesManagementWatcherBloc>().add(
            PresencesManagementWatcherEvent.onFilterUpdated(
                _textFieldController.text),
          );
    });
    super.initState();
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PresencesManagementActorBloc>(
          create: (context) => PresencesManagementActorBloc(
            getIt<WorkstationRepository>(),
          ),
        ),
        BlocProvider<PresencesManagementWatcherBloc>(
          create: (context) => PresencesManagementWatcherBloc(
            getIt<WorkstationRepository>(),
            getIt<UserRepository>(),
            context.read<PresencesManagementActorBloc>(),
          ),
        ),
      ],
      child: BlocListener<PresencesManagementActorBloc,
          PresencesManagementActorState>(
        listener: (context, state) {
          state.maybeMap(
              initial: (value) {},
              actionInProgress: (value) {},
              actionFailure: (f) =>
                  showSnackbar(context, f.failure.getErrorMessageFromFailure()),
              showTimeSlotDialog: (value) => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return TimeSlotDialog2(
                          selectedDate: value.date,
                          workstation: value.workstation,
                          user: value.user,
                        );
                      }).then((result) {
                    /*if (result != null &&
                    result is Map<TimeSlot, List<DateTime>>) {
                  _handleDialogResult(context, result, value.workstation);
                }*/
                  }),
              orElse: () {});
        },
        child: Column(
          children: [
            Builder(
              builder: (context) => DatePicker(
                (newDate) => _onDateChanged(context, newDate)
              ),
            ),
            Row(children: [_buildSearchBar(), _buildAddExternalUserButton()]),
            BlocBuilder<PresencesManagementWatcherBloc,
                PresencesManagementWatcherState>(
              builder: (context, state) {
                return state.map(
                  initial: (_) => Container(),
                  loadInProgress: (_) => Expanded(
                      child: const Center(child: CircularProgressIndicator())),
                  loadSuccess: (state) => UsersPresencesList(visualizedDate),
                  loadFailure: (_) => Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Center(
                        child: RetryWidget(
                          onTryAgainPressed: () => context
                              .read<PresencesManagementWatcherBloc>()
                              .add(PresencesManagementWatcherEvent
                                  .getAllUsersPresencesByDate(visualizedDate)),
                        ),
                      )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Expanded(
      child: TextField(
        controller: _textFieldController,
        maxLines: 1,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 14.0),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            prefixIcon: _textFieldController.text.isEmpty
                ? Icon(Icons.search, color: Colors.black)
                : IconButton(
                    onPressed: () => _textFieldController.clear(),
                    icon: Icon(Icons.clear, color: Colors.black),
                  )),
      ),
    );
  }

  Widget _buildAddExternalUserButton() {
    return IconButton(
        icon: Icon(Icons.person_add,
            color: visualizedDate.isBeforeTimeLess(DateTime.now())
                ? Colors.black87
                : Colors.grey),
        onPressed: () => visualizedDate.isBeforeTimeLess(DateTime.now())
            ? showDialog(
                context: context,
                builder: (BuildContext context) {
                  return TextInputDialog(
                      messageText: "Aggiungi risorsa non presente in elenco",
                      //TODO: add external user event
                      onAddButtonPressed: (String externalUser) => null);
                })
            : null);
  }

  _onDateChanged(BuildContext context, DateTime newDate) {
    setState(() {
      visualizedDate = newDate;
    });
    context.read<PresencesManagementWatcherBloc>().add(
          PresencesManagementWatcherEvent.getAllUsersPresencesByDate(
              visualizedDate),
        );
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
