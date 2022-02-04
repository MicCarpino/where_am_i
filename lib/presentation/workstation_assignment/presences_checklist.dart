import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:where_am_i/domain/blocs/workstation/actor/workstation_actor_bloc.dart';
import 'package:where_am_i/domain/entities/workstation.dart';

//checkable list of resource presences
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
    //set all dates checked by default
    widget.presences.forEach((element) {
      _presencesChecked.putIfAbsent(element, () => true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //generate a checkbox tile for each date corresponding a presence
      ...List<Widget>.generate(widget.presences.length, (index) {
        var item = widget.presences[index];
        return CheckboxListTile(
            title: Text(
              DateFormat.yMMMMd('it_IT').format(item.workstationDate),
            ),
            subtitle: _buildSlotTimeLabel(context, item),
            value: _presencesChecked.values.elementAt(index),
            //action to perform when a checkbox value changes
            //cannot uncheck the first date
            onChanged: index == 0
                ? null
                : (bool) => setState(() => _presencesChecked[item] = bool));
      }),
      //the confirm button to perform the assignment action once done with the dates selection
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
