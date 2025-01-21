part of 'addresses_controller.dart';

class AddressesBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [Bind.lazyPut(() => AddressesController())];
  }
}