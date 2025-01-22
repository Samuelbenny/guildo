part of 'home_controller.dart';

class HomeState {
  final RxList<Restaurant> restaurants = <Restaurant>[].obs;
  final int limit = 9;

  late final PagingController<int, Restaurant> pagingController;

  HomeState() {
    pagingController = PagingController<int, Restaurant>(
      firstPageKey: limit
    );
  }
}
