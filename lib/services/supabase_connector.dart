import 'package:guildo/config/guildo_constants.dart';
import 'package:refreshed/refreshed.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConnector extends GetxService {
  late final SupabaseClient supabase;
  static SupabaseConnector get to => Get.find<SupabaseConnector>();

  @override
  void onInit() async {
    super.onInit();

    await initSupabase();
  }

  initSupabase () async {
    await Supabase.initialize(
      url: GuildoConstants.baseUrl,
      anonKey: GuildoConstants.anonKey,
      debug: true,
      realtimeClientOptions: const RealtimeClientOptions(
          eventsPerSecond: 20,
          logLevel: RealtimeLogLevel.error
      ),
      authOptions: const FlutterAuthClientOptions(
          authFlowType: AuthFlowType.pkce,
      )
    );

    supabase = Supabase.instance.client;
  }
}