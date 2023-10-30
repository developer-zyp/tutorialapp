import 'package:json_annotation/json_annotation.dart';

part 'Currencies.g.dart';

@JsonSerializable()
class Currencies {
  String? code;
  String? name;
  String? symbol;

  Currencies({
    this.code,
    this.name,
    this.symbol,
  });

  factory Currencies.fromJson(Map<String, dynamic> json) => _$CurrenciesFromJson(json);

  Map<String, dynamic> toJson() => _$CurrenciesToJson(this);
}
