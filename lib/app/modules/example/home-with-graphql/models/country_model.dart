class CountryModel {
  CountryModel({
    Data? data,
  }) {
    _data = data;
  }

  CountryModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? _data;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    List<Countries>? countries,
  }) {
    _countries = countries;
  }

  Data.fromJson(dynamic json) {
    if (json['countries'] != null) {
      _countries = [];
      json['countries'].forEach((v) {
        _countries?.add(Countries.fromJson(v));
      });
    }
  }
  List<Countries>? _countries;

  List<Countries>? get countries => _countries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_countries != null) {
      map['countries'] = _countries?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Countries {
  Countries({
    String? code,
    String? name,
    String? emoji,
  }) {
    _code = code;
    _name = name;
    _emoji = emoji;
  }

  Countries.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
    _emoji = json['emoji'];
  }
  String? _code;
  String? _name;
  String? _emoji;

  String? get code => _code;
  String? get name => _name;
  String? get emoji => _emoji;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    map['emoji'] = _emoji;
    return map;
  }
}
