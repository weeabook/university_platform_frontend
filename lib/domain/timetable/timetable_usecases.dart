import 'timetable_repository.dart';

class DownloadTimetableUseCase {
  const DownloadTimetableUseCase(this._repository);

  final TimetableRepository _repository;

  Future<void> exec(int groupId) async {
    return await _repository.downloadTimetable(groupId);
  }
}
