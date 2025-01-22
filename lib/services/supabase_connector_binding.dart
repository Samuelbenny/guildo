part of 'supabase_connector.dart';

class SupabaseConnectorBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.put(SupabaseConnector()),
    ];
  }
}