import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:guildo/utils/custom_types.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@freezed
class Restaurant with _$Restaurant {
  const factory Restaurant({
    final String? id,
    // @JsonKey(name: 'created_at') final DateTime? createdAt,
  }) = _Restaurant;

  factory Restaurant.fromJson(Json json) => _$RestaurantFromJson(json);
}