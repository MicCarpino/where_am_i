import 'package:auto_size_text/auto_size_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/entities/workstation.dart';

class Workstations extends StatefulWidget {
  const Workstations({Key key,
    @required this.quantity,
    @required this.columnsNumber,
    this.columnsSpacing = 0,
    @required this.workstations,
    @required this.startingIndex})
      : super(key: key);

  final int quantity;
  final int columnsNumber;
  final double columnsSpacing;
  final List<Workstation> workstations;
  final int startingIndex;

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
        return FlatButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Colors.black54)),
            onPressed: () {},
            child: AutoSizeText(
              getText(index + widget.startingIndex),
              maxLines: 1,
            ));
      }),
    );
  }

   String getText(int gridIndex) {
    if (widget.workstations == null) {
      return "";
    } else {
      var workstationCode = gridIndex;
      */
/*in the older app, room 26 b and room 24 indexes were increasing in vertical order
        instead of horizontal, so here they are mapped to match the original position*//*

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
      return workstationOfIndex != null
          ? workstationOfIndex.resourceSurname
          : "";
    }
  }
}
*/
