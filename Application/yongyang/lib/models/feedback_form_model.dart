class FeedbackForm {
  String time;
  String temp;
  String humi;

  FeedbackForm(this.time, this.temp, this.humi);

  String toParams() => "?time=$time&temp=$temp&humi=$humi";
}
