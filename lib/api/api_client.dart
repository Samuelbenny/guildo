import 'package:dio/dio.dart' hide Headers;
import 'package:guildo/api/api.dart';
import 'package:guildo/config/guildo_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: GuildoConstants.baseUrl)
sealed class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(Apis.getRestaurants)
  @Headers({"Accept": "application/json", "Content-Type": "application/json"})
  Future<HttpResponse> getRestaurants(
      @Header("Authorization") String token,
      @Path('eq') String? eq
  );
}