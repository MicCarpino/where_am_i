import 'file:///C:/Users/DNC/FlutterProjects/where_am_i/lib/features/data/model/user_details.dart';

class LoggedUser {
  final UserDetails userInfo;
  final String authenticationToken;
  final int expiration;

  LoggedUser(this.userInfo, this.authenticationToken,this.expiration);

  factory LoggedUser.fromData(dynamic data) {
    final UserDetails userInfo = UserDetails.fromData(data["user"]);
    final String authenticationToken = data["token"];
    final int expiration = data["expiration"];
    return LoggedUser(userInfo, authenticationToken,expiration);
  }
}
