import 'package:json_annotation/json_annotation.dart';

part 'RegionalBlocs.g.dart';

@JsonSerializable()
class RegionalBlocs {
  RegionalBlocs({
    this.acronym,
    this.name,
  });

  String? acronym;
  String? name;

  factory RegionalBlocs.fromJson(Map<String, dynamic> json) => _$RegionalBlocsFromJson(json);

  Map<String, dynamic> toJson() => _$RegionalBlocsToJson(this);
}
