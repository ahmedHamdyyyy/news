
/*


import 'package:dio/dio.dart';

class Diohlper{
  static Dio? dio;
  static init()
  {
    dio= Dio(
        BaseOptions(
          baseUrl:"https://newsapi.org/",
          receiveDataWhenStatusError: true,
        )
    );
  }
  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> quiry,
  })async
  {
    return await dio!.get(
      url,
      queryParameters:quiry,
    );
  }
}*/


import 'package:dio/dio.dart';

class Diohlper{
  static late Dio dio;
  static init()
  {
    dio= Dio(
        BaseOptions(
          baseUrl:"https://student.valuxapps.com/api/",
          receiveDataWhenStatusError: true,)
    );
  }
  static Future<Response> getData({
    required String url,
     Map<String, dynamic>? quiry,
    String lang="ar",
    String? token,

  })async
  {
    dio.options.headers=
    {
      "lang": lang,
      "Authorization":token??"",
      "Content-Type":"application/json",
    };
    return await dio.get(
      url,
      queryParameters:quiry,
    );
  }
  static Future<Response> postDataa({
    required String url,
     Map<String, dynamic>? quiry,
    String lang="en",
    String? token,
    required Map<String, dynamic> data,
})async
  {
    dio.options.headers=
    {
      "lang":lang,
      "Authorization":token??"",
      "Content-Type":"application/json",
    };
    return dio.post(url,
        queryParameters: quiry,
        data:data ,
    );
  }

  static Future<Response> putDataa({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? quiry,
    String lang="en",
    String? token,

  })async
  {
    dio.options.headers=
    {
      "lang":lang,
      "Authorization":token??"",
      "Content-Type":"application/json",
    };
    return dio.put(url,
      queryParameters: quiry,
      data:data ,
    );
  }
  static Future<Response> deleteData ({
    required String url,
    String lang = 'en',
    String ?token
  })async
  {
    dio.options.headers =
    {
      'lang':'$lang',
      'Content-Type':'application/json',
      'Authorization' : '$token'
    };
    return await dio.delete(url);
  }


}
