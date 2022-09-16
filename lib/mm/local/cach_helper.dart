/*


 import 'package:shared_preferences/shared_preferences.dart';

 class CachHealper
 {
   static SharedPreferences? sharedPreferences;
   static init() async
   {
     sharedPreferences=await SharedPreferences.getInstance();
   }
   static Future<bool> putBoll({
     required bool value,
     required String key,
   })async
   {
     return await sharedPreferences!.setBool(key, value);
   }
   static bool? getDBoollen({
     required String key,
   })
   {
     return  sharedPreferences!.getBool(key);
   }
 }*/
import 'package:shared_preferences/shared_preferences.dart';

class CachHealper {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBoll({
    required bool value,
    required String key,
  }) async {
    return await sharedPreferences.setBool(key, value);
  }

  static dynamic getDBoollen({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }

  static Future<bool> SaveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);

    return await sharedPreferences.setDouble(key, value);
  }

  static Future<bool> removeData({
    required String key,
  })async  {
    return await sharedPreferences.remove(key);

  }


}
