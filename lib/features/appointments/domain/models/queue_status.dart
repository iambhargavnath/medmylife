enum QueueStatus {
  pending,
  syncing,
  synced,
  failed;

  String get value => name;

  static QueueStatus fromValue(String value) {
    return QueueStatus.values.firstWhere(
          (status) => status.name == value,
      orElse: () => QueueStatus.failed,
    );
  }
}