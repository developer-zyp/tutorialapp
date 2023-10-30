import 'package:json_annotation/json_annotation.dart';

part 'Flags.g.dart';

@JsonSerializable()
class Flags {
  String? svg;
  String? png;

  Flags({
    this.svg,
    this.png,
  });

  factory Flags.fromJson(Map<String, dynamic> json) => _$FlagsFromJson(json);

  Map<String, dynamic> toJson() => _$FlagsToJson(this);
}
