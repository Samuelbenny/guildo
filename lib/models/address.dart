import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:guildo/models/models.dart';
import 'package:guildo/utils/custom_types.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  const factory Address({
    final String? id,
    @JsonKey(name: 'full_address')
    final String? fullAddress,
    final double? latitude,
    final double? longitude,
    final String? country,
    @JsonKey(name: 'postal_code')
    final String? postalCode,
    final Restaurant? restaurant,
    @JsonKey(name: 'created_at')
    final DateTime? createdAt,
  }) = _Address;

  factory Address.fromJson(Json json) => _$AddressFromJson(json);
}