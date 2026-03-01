import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:call_tracker/components/tracklist/tracklist_placeholder.dart';
import 'package:call_tracker/providers/tracklist_provider.dart';
import 'package:call_tracker/screens/tracklist/fragments/tracklist_item_ui_builder.dart';
import 'package:call_tracker/l10n/app_localizations.dart';

class TrackListScreen extends ConsumerWidget {
  const TrackListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tracklistItemUiBuilder = TracklistItemUiBuilder();
    final trackListItems = ref.watch(trackListProvider).value ?? [];

    final uiWidgets = tracklistItemUiBuilder.build(trackListItems);

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if ((ref.watch(trackListProvider).value ?? []).isEmpty)
                Column(
                  children: [
                    TrackListPlaceholder(
                      message:
                          AppLocalizations.of(context).tracklistPlaceholderText,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              for (var widget in uiWidgets) ...[
                widget,
                SizedBox(height: 10),
              ],
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: Icon(Icons.delete),
                      onPressed:
                          (ref.watch(trackListProvider).value ?? []).isNotEmpty
                              ? () async {
                                  await ref
                                      .read(trackListProvider.notifier)
                                      .purge();
                                  return;
                                }
                              : null,
                      label: Text(
                        AppLocalizations.of(context)
                            .removeAllText
                            .toUpperCase(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
