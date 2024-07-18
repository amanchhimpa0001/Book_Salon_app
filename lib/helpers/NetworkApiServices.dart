// import 'dart:convert';

// import 'package:book_salon_app/backanddata/dummydata.dart';
// import 'package:book_salon_app/data/Network/BaseApiServices.dart';
// import 'package:book_salon_app/main.dart';
// import 'package:book_salon_app/model/usermodel.dart';

// class NetworkApis extends BaseUrls {
//   @override
//   Future<dynamic> AuthenticationBasedata(data, {bool islogin = true}) async {
//     try {
//       String email = data["email"];
//       String password = data["password"];
//       if (islogin) {
//         bool isuserExist = allUsers.any((element) => element.email == email);
//         if (isuserExist) {
//           UserModel user =
//               allUsers.firstWhere((element) => element.email == email);
//           bool isPasswordSame = user.password == password;
//           if (isPasswordSame) {
//             prefs!.setString("user", user.toJson());
//             return user;
//           } else {
//             throw "Wrong Password";
//           }
//         } else {
//           throw "User Not Found";
//         }
//       } else {
//         bool isuserExist = allUsers.any((element) => element.email == email);
//         if (isuserExist) {
//           throw "Already user sexist please use any other email";
//         } else {
//           String name = data["name"];
//           String gender = data["gender"];
//           String username = data["username"];
//           String dob = data["username"];
//           UserModel user = UserModel(
//               name: name,
//               email: email,
//               password: password,
//               gender: gender,
//               username: username,
//               dob: dob);
//           allUsers.add(user);
//         }
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }
