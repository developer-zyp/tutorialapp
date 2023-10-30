// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Currencies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currencies _$CurrenciesFromJson(Map<String, dynamic> json) => Currencies(
      code: json['code'] as String?,
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
    );

Map<String, dynamic> _$CurrenciesToJson(Currencies instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'symbol': instance.symbol,
    };
