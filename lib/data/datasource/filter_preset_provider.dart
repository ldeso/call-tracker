import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:call_tracker/data/datasource/filter_preset_datasource.dart';

final filterPresetsDatasourceProvider = Provider<FilterPresetDatasource>((ref) {
  return FilterPresetDatasource();
});
