
import 'package:pharmacy_app/core/database/cache/cashe_helper.dart';

class EndPoints {
  // base url
  static String baseUrl = "https://food-api-omega.vercel.app/api/v1/";

  // endpoints
  static String signIn = "user/signin";
  static String signUp = "user/signup";
  static String getUSer = "user/get-user/${CacheHelper().getData(key: ApiKeys.id)}";

}

class ApiKeys {
  static String status = "status";
  static String eMessage = "ErrorMessage";
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String id = "id";
  static String message = "message";
  static String name = "name";
  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profilePic";
  static String type = "type";
  static String coordinates = "coordinates";
  static String favorites = "favorites";
  static String createdAt = "createdAt";
  static String user = "user";
  


}
