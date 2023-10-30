import 'package:json_annotation/json_annotation.dart';

part 'Translations.g.dart';

@JsonSerializable()
class Translations {
  Translations({
    this.br,
    this.pt,
    this.nl,
    this.hr,
    this.fa,
    this.de,
    this.es,
    this.fr,
    this.ja,
    this.it,
    this.hu,
  });

  String? br;
  String? pt;
  String? nl;
  String? hr;
  String? fa;
  String? de;
  String? es;
  String? fr;
  String? ja;
  String? it;
  String? hu;

  factory Translations.fromJson(Map<String, dynamic> json) => _$TranslationsFromJson(json);

  Map<String, dynamic> toJson() => _$TranslationsToJson(this);
}
