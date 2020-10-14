import 'package:flutter/material.dart';
import 'package:where_am_i/core/utils/constants.dart';
import 'package:where_am_i/domain/entities/workstation.dart';

class AssignableUsersPage extends StatelessWidget {
  final List<Workstation> assignableUsers;

  AssignableUsersPage({@required this.assignableUsers});

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
                var workstation = assignableUsers[index];
                return ListTile(
                  title: Text(
                    "${workstation.resourceSurname} ${workstation.resourceName}"),
                  onTap: () =>  Navigator.pop(context, workstation),
                );
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
