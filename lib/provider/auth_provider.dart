import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void hitApi(String email, String password) async {
    setLoading(true);

    try {
      Response response = await post(Uri.parse("https://reqres.in/api/login"),
          body: {'email': email, "password": password});

      if (response.statusCode == 200) {
        print("Successful");
        setLoading(false);
      } else {
        print("FAiled");
      }
    } catch (e) {
      print(e.toString());
      setLoading(false);
    }
    setLoading(false);
  }
}
