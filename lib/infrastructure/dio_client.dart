import 'package:dio/dio.dart';

Future<dynamic> getRequest(String url) async {
  try {
    final Response<dynamic> response = await Dio().get(url);
    return response.data;
  } catch (e) {
    print('feiled');
    return 'Failed';
  }
}
