import 'package:guildo/config/guildo_constants.dart';
import 'package:refreshed/refreshed.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Binding;

part 'supabase_connector_binding.dart';

/// A service that initializes and provides access to the Supabase client.
class SupabaseConnector extends GetxService {
  // Late initialization of the SupabaseClient instance.
  late final SupabaseClient supabase;

  // Provides a singleton instance of SupabaseConnector.
  static SupabaseConnector get to => Get.find<SupabaseConnector>();

  @override
  void onInit() async {
    super.onInit();

    // Initializes Supabase when the service starts.
    await initSupabase();
  }

  /// Initializes the Supabase client with specified configurations.
  initSupabase() async {
    await Supabase.initialize(
      url: GuildoConstants.baseUrl, // Supabase project URL
      anonKey: GuildoConstants.anonKey, // Supabase anonymous key
      debug: true,
      realtimeClientOptions: const RealtimeClientOptions(
        eventsPerSecond: 20,
        logLevel: RealtimeLogLevel.error,
      ),
      authOptions: const FlutterAuthClientOptions(
        authFlowType: AuthFlowType.pkce,
      ),
    );

    // Assigns the initialized Supabase client to the 'supabase' variable.
    supabase = Supabase.instance.client;
  }
}
