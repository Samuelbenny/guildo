import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:guildo/models/models.dart';
import 'package:guildo/utils/custom_types.dart';

part 'cuisine.freezed.dart';
part 'cuisine.g.dart';

@freezed
class Cuisine with _$Cuisine {
  const factory Cuisine({
    final String? id,
    final String? name,
    final List<Restaurant>? restaurants,
    @JsonKey(name: 'created_at')
    final DateTime? createdAt,
  }) = _Cuisine;

  factory Cuisine.fromJson(Json json) => _$CuisineFromJson(json);
}