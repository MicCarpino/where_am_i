import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:where_am_i/domain/blocs/workstation/actor/workstation_actor_bloc.dart';
import 'package:where_am_i/domain/entities/workstation.dart';

class PresencesChecklist extends StatefulWidget {
  const PresencesChecklist({
    @required this.codeWorkstation,
    @required this.presences,
  });

  final int codeWorkstation;
  final List<Workstation> presences;

  @override
  _PresencesChecklistState createState() => _PresencesChecklistState();
}

class _PresencesChecklistState extends State<PresencesChecklist> {
  Map<Workstation, bool> _presencesChecked = new Map<Workstation, bool>();

  @override
  void initState() {
    super.initState();
    widget.presences.forEach((element) {
      _presencesChecked.putIfAbsent(element, () => true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...List<Widget>.generate(widget.presences.length, (index) {
        var item = widget.presences[index];
        return CheckboxListTile(
            title: Text(
              DateFormat.yMMMMd('it_IT').format(item.workstationDate),
            ),
            subtitle: _buildSlotTimeLabel(context, item),
            value: _presencesChecked.values.elementAt(index),
            onChanged: index == 0
                ? null
                : (bool) => setState(() => _presencesChecked[item] = bool));
      }),
      OutlinedButton(
          child: Text('CONFERMA', style: TextStyle(color: Colors.blue)),
          onPressed: () {
            final updatedWorkstations = _presencesChecked.entries
                .where((mapEntry) => mapEntry.value)
                .map<Workstation>((mapEntry) => mapEntry.key.copyWith(
                    codeWorkstation: widget.codeWorkstation.toString()))
                .toList();
            context.read<WorkstationActorBloc>().add(
                  WorkstationActorEvent.multipleUpdates(updatedWorkstations),
                );
          })
    ]);
  }

  Widget _buildSlotTimeLabel(BuildContext context, Workstation workstation) {
    String startTime = workstation.startTime.format(context);
    String endTime = workstation.endTime.format(context);
    return Text(
      "$startTime - $endTime",
      style: TextStyle(color: Colors.black54, fontSize: 14),
    );
  }
}
