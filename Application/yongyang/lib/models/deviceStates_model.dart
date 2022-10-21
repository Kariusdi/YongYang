class States {
  int fan1;
  int fan2;
  int pump;
  int battery;

  States({this.fan1 = 0, this.fan2 = 0, this.pump = 0, this.battery = 0});

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
      pump: parser(json['pump']),
      battery: parser(json['battery']),
    );
  }
}
