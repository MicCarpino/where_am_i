import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/extensions.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/workstation.dart';
import 'package:where_am_i/presentation/pages/assignable_users_page.dart';

class Workstations extends StatefulWidget {
  final int quantity;
  final int columnsNumber;
  final double columnsSpacing;
  final List<UserWithWorkstation> usersWithWorkstations;
  final int startingIndex;
  final Function(Workstation workstationAssigned) onWorkstationUpdated;

  const Workstations({
    Key key,
    @required this.quantity,
    @required this.columnsNumber,
    this.columnsSpacing = 0,
    @required this.usersWithWorkstations,
    @required this.startingIndex,
    @required this.onWorkstationUpdated,
  }) : super(key: key);

  @override
  _WorkstationsState createState() => _WorkstationsState();
}

class _WorkstationsState extends State<Workstations> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      childAspectRatio: 1 / 1,
      crossAxisCount: widget.columnsNumber,
      mainAxisSpacing: 0,
      crossAxisSpacing: widget.columnsSpacing,
      children: List.generate(widget.quantity, (index) {
        //TODO: fix label size to fit container
        var userWithWorkstation =
            _getWorkstationForIndex(index + widget.startingIndex);
        String resourceLabel = "";
        if (userWithWorkstation?.user != null) {
          resourceLabel = userWithWorkstation.user.surname +
              " \n" +
              userWithWorkstation.user.name;
        } else if (userWithWorkstation?.workstation?.freeName != null ) {
          resourceLabel = userWithWorkstation.workstation.freeName.capitalize();
        }
        return FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Colors.black54)),
            onPressed: () => _onWorkstationClick(index + widget.startingIndex),
            onLongPress: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Attenzione"),
                      content: Text(
                          "Continuando la risorsa verrà rimossa dalla postazione assegnatale"),
                      actions: [
                        FlatButton(
                          child: Text("Annulla"),
                          onPressed: () => Navigator.pop(context),
                        ),
                        FlatButton(
                            child: Text("OK"),
                            onPressed: () => userWithWorkstation != null
                                ? _onWorkstationLongClick(
                                    userWithWorkstation.workstation)
                                : null)
                      ],
                    );
                  },
                ),
            child: AutoSizeText(
              resourceLabel,
              textAlign: TextAlign.center,
              maxLines: resourceLabel.split(" ").length,
              wrapWords: true,
              overflow: TextOverflow.clip,
            ));
      }),
    );
  }

  UserWithWorkstation _getWorkstationForIndex(int gridIndex) {
    var workstationCode = gridIndex.toString();
    //room 26b
    if (gridIndex <= 18) {
      workstationCode =
          getOldWorkstationCodeFor26b[gridIndex + widget.startingIndex];
    }
    //room 24
    if (gridIndex >= 19 && gridIndex <= 34) {
      workstationCode = getOldWorkstationCodeFor24[gridIndex];
    }
    var workstationOfIndex = widget.usersWithWorkstations.firstWhere(
        (element) =>
            element.workstation.codeWorkstation == workstationCode.toString(),
        orElse: () => null);
    return workstationOfIndex;
  }

  _onWorkstationClick(int gridIndex) {
    String workstationCode = gridIndex.toString();
    if (gridIndex <= 18) {
      workstationCode = getOldWorkstationCodeFor26b[gridIndex];
    }
    //room 24
    if (gridIndex >= 19 && gridIndex <= 34) {
      workstationCode = getOldWorkstationCodeFor24[gridIndex];
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AssignableUsersPage(
          assignableUsers: widget.usersWithWorkstations
              .where((element) => element.workstation.codeWorkstation == null)
              .toList(),
          selectedWorkstationCode: workstationCode,
        ),
      ),
    ).then((selectedWorkstation) {
      if (selectedWorkstation != null) {
        widget.onWorkstationUpdated(selectedWorkstation);
      }
    });
  }

  _onWorkstationLongClick(Workstation selectedWorkstation) {
    var clearedWorkstation = Workstation(
      idWorkstation: selectedWorkstation.idWorkstation,
      idResource: selectedWorkstation.idResource,
      codeWorkstation: null,
      workstationDate: selectedWorkstation.workstationDate,
      freeName: selectedWorkstation.freeName,
    );
    widget.onWorkstationUpdated(clearedWorkstation);
    Navigator.pop(context);
  }
}
