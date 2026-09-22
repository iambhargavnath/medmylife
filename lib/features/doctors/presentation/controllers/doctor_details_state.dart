import '../../domain/entities/doctor.dart';

class DoctorDetailsState {
  final Doctor? doctor;
  final bool isLoading;
  final bool isRefreshing;
  final String? errorMessage;

  const DoctorDetailsState({
    this.doctor,
    this.isLoading = true,
    this.isRefreshing = false,
    this.errorMessage,
  });

  bool get hasDoctor => doctor != null;

  bool get hasError => errorMessage != null;

  DoctorDetailsState copyWith({
    Doctor? doctor,
    bool? isLoading,
    bool? isRefreshing,
    String? errorMessage,
    bool clearDoctor = false,
    bool clearError = false,
  }) {
    return DoctorDetailsState(
      doctor: clearDoctor
          ? null
          : doctor ?? this.doctor,
      isLoading: isLoading ?? this.isLoading,
      isRefreshing:
      isRefreshing ?? this.isRefreshing,
      errorMessage:
      clearError
          ? null
          : errorMessage ?? this.errorMessage,
    );
  }
}