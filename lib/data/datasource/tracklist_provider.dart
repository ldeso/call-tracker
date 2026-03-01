import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:call_tracker/data/datasource/tracklist_datasource.dart';

final trackListDatasourceProvider = Provider<TrackListDatasource>((ref) {
  return TrackListDatasource();
});
