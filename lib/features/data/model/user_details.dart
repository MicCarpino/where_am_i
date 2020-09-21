
class UserDetails {
  final String idResource;
  final int idRole;
  final String username;
  final String name;
  final String surname;

  UserDetails(this.idResource, this.idRole, this.username, this.name, this.surname);

  factory UserDetails.fromData(dynamic data) {
    final String idResource = data["idResource"];
    final int idRole = data["idRole"];
    final String username = data["username"];
    final String name = data["name"];
    final String surname = data["surname"];
    return UserDetails(idResource, idRole, username, name, surname);
  }
}
