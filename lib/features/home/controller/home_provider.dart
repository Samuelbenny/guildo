part of 'home_controller.dart';

class HomeProvider {
  Future<List<Restaurant>> getRestaurants({int offset = 0}) async {
    return await RestaurantsController.to.getRestaurants(
      offset: offset
    );
  }
}