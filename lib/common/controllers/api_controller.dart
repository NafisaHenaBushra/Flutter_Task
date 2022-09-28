import 'dart:convert';
import 'dart:io';
import 'package:flutter_task/utils/constants/imports.dart';
import 'package:http/http.dart' as http;

class ApiController {
  //* info:: common get
  Future<dynamic> commonGet({
    required String url,
    int? timer,
    String? appType,
  }) async {
    final http.Client client = http.Client();
    final Uri uri = Uri.parse(url);
    ll(url);
    http.Response response;
    String error = ksAnErrorOccurred.tr;
    try {
      response = await client
          .get(
        uri,
      )
          .timeout(
        Duration(seconds: timer ?? 30),
        onTimeout: () {
          error = ksConnectionTimeoutMessage.tr;
          errorSnackBar(ksError, error, 1500);
          throw TimeoutException(ksConnectionTimeoutMessage.tr);
        },
      );
      // ll("response : ${response.body}");
      return jsonDecode(utf8.decode(response.bodyBytes));
    } on SocketException {
      error = ksNoInternetConnectionMessage.tr;
      errorSnackBar(ksError.tr, error, 1500);
      return null;
    } catch (e) {
      ll(e.toString());
      errorSnackBar(ksError.tr, error, 1500);
      return null;
    } finally {
      client.close();
    }
  }
}
