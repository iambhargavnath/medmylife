class DoctorListState {
  final String query;
  final bool isOffline;

  const DoctorListState({
    this.query = '',
    this.isOffline = false,
  });

  DoctorListState copyWith({
    String? query,
    bool? isOffline,
  }) {
    return DoctorListState(
      query: query ?? this.query,
      isOffline: isOffline ?? this.isOffline,
    );
  }
}