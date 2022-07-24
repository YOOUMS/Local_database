import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  static SharedPreferences? sp;
  static initS() async {
    sp = await SharedPreferences.getInstance();
  }

  static writeOnSp(String value) {
    sp!.setString('name', value);
  }

  static String? readFromSp() {
    String? name = sp!.getString('name');
    return name;
  }

  static newUserToOldUser() {
    sp!.setBool('newuser', true);
  }

  static bool? readNewUser() {
    return sp!.getBool('newuser');
  }
}
