class UserModel{

  /* You can remove many of your initState/ constructor calls because
  late runs "lazily", which means it is not run at all until it is
  referenced for the first time.
   */
  late String _username;
  late String _password;


  UserModel();
  UserModel.name(this._username, this._password);

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get username => _username;

  set username(String value) {
    _username = value;
  }
}
