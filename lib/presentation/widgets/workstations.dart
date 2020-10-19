import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
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
  final Function(
          Workstation workstationAssigned, Workstation currentWorkstation)
      onWorkstationUpdated;

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
        var resourceLabel = userWithWorkstation != null
            ? userWithWorkstation.user.name +
                " " +
                "\n" +
                userWithWorkstation.user.surname
            : "";
        //(workstation.freeName != null ? workstation.freeName : "");
        return FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Colors.black54)),
            onPressed: () {
              _onWorkstationClick(userWithWorkstation?.workstation,
                  getOldWorkstationCodeFor26b[index]);
            },
            child: AutoSizeText(
              resourceLabel,
              textAlign: TextAlign.center,
              maxLines: resourceLabel.split(" ").length,
            ));
      }),
    );
  }

  UserWithWorkstation _getWorkstationForIndex(int gridIndex) {
    var workstationCode = gridIndex.toString();
    //room 26b
    if (gridIndex <= 18) {
      workstationCode = getOldWorkstationCodeFor26b[gridIndex];
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

  _onWorkstationClick(Workstation currentWorkstation, String workstationCode) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AssignableUsersPage(
                assignableUsers: widget.usersWithWorkstations
                    .where((element) =>
                        element.workstation.codeWorkstation == null)
                    .toList(),
                selectedWorkstationCode: workstationCode,
              )),
    ).then((selectedWorkstation) =>
        widget.onWorkstationUpdated(selectedWorkstation, currentWorkstation));
  }
}
