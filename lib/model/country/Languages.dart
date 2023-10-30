import 'package:json_annotation/json_annotation.dart';

part 'Languages.g.dart';

@JsonSerializable()
class Languages {
  String? iso6391;
  String? iso6392;
  String? name;
  String? nativeName;

  Languages({
    this.iso6391,
    this.iso6392,
    this.name,
    this.nativeName,
  });

  factory Languages.fromJson(Map<String, dynamic> json) => _$LanguagesFromJson(json);

  Map<String, dynamic> toJson() => _$LanguagesToJson(this);
}
