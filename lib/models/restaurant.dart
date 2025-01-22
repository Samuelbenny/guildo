import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:guildo/models/models.dart';
import 'package:guildo/utils/custom_types.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@freezed
class Restaurant with _$Restaurant {
  const factory Restaurant({
    final String? id,
    final String? name,
    final String? link,
    @JsonKey(name: 'image_url')
    final String? imageUrl,
    @JsonKey(name: 'phone_number')
    final String? phoneNumber,
    @JsonKey(name: 'open_status')
    final OpenStatus? openStatus,
    @JsonKey(name: 'open_status_text')
    final String? openStatusText,
    @JsonKey(name: 'price_types')
    final String? priceTypes,
    final double? rating,
    @JsonKey(name: 'reviews_count')
    final double? reviewsCount,
    final Address? address,
    final List<Cuisine>? cuisines,
    @JsonKey(name: 'created_at')
    final DateTime? createdAt,
  }) = _Restaurant;

  factory Restaurant.fromJson(Json json) => _$RestaurantFromJson(json);
}

enum OpenStatus {
  open(status: 'open'),
  closed(status: 'closed'),
  unknown(status: 'unknown');

  final String status;

  const OpenStatus({required this.status});
}