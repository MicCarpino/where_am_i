import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/entities/workstation.dart';

class Workstations extends StatefulWidget {
  final int quantity;
  final int columnsNumber;
  final double columnsSpacing;
  final List<Workstation> workstations;
  final int startingIndex;

  const Workstations(
      {Key key,
      @required this.quantity,
      @required this.columnsNumber,
      this.columnsSpacing = 0,
      @required this.workstations,
      @required this.startingIndex})
      : super(key: key);

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
        var workstation = getWorkstationForIndex(index + widget.startingIndex);
        var resourceLabel = workstation != null
            ? workstation.resourceSurname +" " + "\n" + workstation.resourceName
            : "";
        return FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Colors.black54)),
            onPressed: () {},
            child: AutoSizeText(
              resourceLabel,
              textAlign: TextAlign.center,
              maxLines: resourceLabel.split(" ").length,
            ));
      }),
    );
  }

  Workstation getWorkstationForIndex(int gridIndex) {
    var workstationCode = gridIndex;
    //room 26b
    if (gridIndex <= 18) {
      workstationCode = getOldWorkstationCodeFor26b[gridIndex];
    }
    //room 24
    if (gridIndex >= 18 && gridIndex <= 34) {
      workstationCode = getOldWorkstationCodeFor24[gridIndex];
    }
    var workstationOfIndex = widget.workstations.firstWhere(
        (element) => element.codeWorkstation == workstationCode.toString(),
        orElse: () => null);
    return workstationOfIndex;
  }
}
