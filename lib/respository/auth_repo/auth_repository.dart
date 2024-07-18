import 'package:book_salon_app/data/Network/BaseApiServices.dart';

import '../../data/Network/NatworkapiServices.dart';

class AuthRepository {
  NetworkApis authentication = NetworkApis();

  Future<dynamic> signin(dynamic data) async {
    try {
      return authentication.authfunction(data, islogin: true);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> signup(dynamic data) async {
    try {
      return authentication.authfunction(data, islogin: false);
    } catch (e) {
      throw Exception(e);
    }
  }
}

