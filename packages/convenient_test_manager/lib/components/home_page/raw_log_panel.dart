import 'package:convenient_test_manager/components/misc/enhanced_selectable_text.dart';
import 'package:convenient_test_manager/stores/organization_store.dart';
import 'package:convenient_test_manager/stores/raw_log_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePageRawLogPanel extends StatelessWidget {
  const HomePageRawLogPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final organizationStore = GetIt.I.get<OrganizationStore>();
    final rawLogStore = GetIt.I.get<RawLogStore>();

    return Observer(builder: (_) {
      final activeTestEntryId = organizationStore.activeTestEntryId;
      if (activeTestEntryId == null) {
        return const Center(
          child: Text('Tap log entries on the left to view screenshots'),
        );
      }

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: ListView(
          primary: false,
          children: [
            EnhancedSelectableText(
              rawLogStore.rawLogInTest[activeTestEntryId],
              style: const TextStyle(fontSize: 13, fontFamily: 'RobotoMono'),
            ),
          ],
        ),
      );
    });
  }
}
