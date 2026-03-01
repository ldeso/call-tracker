import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:call_tracker/data/datasource/tracklist_provider.dart';
import 'package:call_tracker/data/repostiory/tracklist_repository.dart';

final trackListRepositoryProvider = Provider<TrackListRepository>((ref) {
  final datasource = ref.read(trackListDatasourceProvider);
  return TrackListRepository(datasource);
});
