import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/entities/user_with_workstation.dart';
import 'package:where_am_i/domain/entities/workstation.dart';

class AssignableUsersPage extends StatelessWidget {
  final List<UserWithWorkstation> assignableUsers;
  final String selectedWorkstationCode;

  AssignableUsersPage({
    @required this.assignableUsers,
    @required this.selectedWorkstationCode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dncBlue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: assignableUsers.length > 0
          ? ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              separatorBuilder: (context, index) => Divider(
                color: Colors.black26,
              ),
              itemCount: assignableUsers.length,
              itemBuilder: (context, index) {
                var rowElement = assignableUsers[index];
                return ListTile(
                    title: Text(
                        "${rowElement.user.surname} ${rowElement.user.name}"),
                    onTap: () => Navigator.pop(
                        context,
                        Workstation(
                            idWorkstation: null,
                            idResource: rowElement.user?.idResource,
                            workstationDate: null,
                            freeName: rowElement.workstation.freeName,
                            codeWorkstation: selectedWorkstationCode)));
              },
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Al momento nessuna risorsa risulta essere disponibile per l\'assegnazione',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
    );
  }
}
