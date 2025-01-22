part of 'home_controller.dart';

class HomeState {
  final RxList<Restaurant> restaurants = <Restaurant>[].obs;
  final int limit = 10;

  // Filters
  final RxList<String> cuisineIds = <String>[].obs;

  late final PagingController<int, Restaurant> pagingController;

  HomeState() {
    pagingController = PagingController<int, Restaurant>(
      firstPageKey: limit
    );
  }
}
