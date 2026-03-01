import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:call_tracker/data/datasource/filter_preset_provider.dart';
import 'package:call_tracker/data/repostiory/presets_repository.dart';

final filterPresetsRepositoryProvider = Provider<PresetsRepository>((ref) {
  final datasource = ref.read(filterPresetsDatasourceProvider);
  return PresetsRepository(datasource);
});
