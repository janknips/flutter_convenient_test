import 'package:convenient_test_common/convenient_test_common.dart';
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';

extension ExtConvenientTestManagerClient on ConvenientTestManagerClient {
  static ConvenientTestManagerClient create() {
    final channel = ClientChannel(
      kConvenientTestManagerHost,
      port: kConvenientTestManagerPort,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    return ConvenientTestManagerClient(channel,
        options: CallOptions(timeout: null));
  }

  Future<void> reportSingle(ReportItem item) async {
    if (!kIsWeb) {
      await report(ReportCollection(items: [item]));
    }
  }
}
