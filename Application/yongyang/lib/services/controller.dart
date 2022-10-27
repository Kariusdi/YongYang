import 'package:yongyang/models/feedback_form_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FormController {
  final void Function(String) callback;
  static const String URL =
      "https://script.google.com/macros/s/AKfycbzg-gCkCi1STbyilpPaEtmdJJdrECZSRzwrdHGILqx2ap_nLavTqOKHRiH-td3jJlIiwQ/exec";
  static const STATUS_SUCCESS = "SUCCESS";

  FormController(this.callback);
  void submitForm(FeedbackForm feedbackForm) async {
    try {
      await http.get(Uri.parse(URL + feedbackForm.toParams())).then(
          (response) => callback(convert.jsonDecode(response.body)['status']));
    } catch (e) {
      print(e);
    }
  }
}
