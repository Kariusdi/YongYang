class States {
  int fan1;
  int fan2;
  int heater;

  States({this.fan1 = 0, this.fan2 = 0, this.heater = 0});

  factory States.fromJson(Map<dynamic, dynamic> json) {
    int parser(dynamic source) {
      try {
        return int.parse(source.toString());
      } on FormatException {
        return -1;
      }
    }

    return States(
      fan1: parser(json['Fan1']),
      fan2: parser(json['Fan2']),
      heater: parser(json['Heater']),
    );
  }
}
