import 'package:flutter_test/flutter_test.dart';
import 'package:medmylife/features/doctors/domain/entities/doctor.dart';


void main() {
  group('Doctor.fromJson', () {
    test('should correctly parse doctor JSON', () {
      final json = {
        'id': 101,
        'name': 'Dr. Rahul Sharma',
        'speciality': 'Cardiologist',
        'experience': 12,
        'consultationFee': 800,
        'available': true,
      };

      final doctor = Doctor.fromJson(json);

      expect(doctor.id, '101');
      expect(doctor.name, 'Dr. Rahul Sharma');
      expect(doctor.speciality, 'Cardiologist');
      expect(doctor.experience, 12);
      expect(doctor.consultationFee, 800.0);
      expect(doctor.available, true);
    });

    test('should convert numeric consultation fee to double', () {
      final json = {
        'id': 101,
        'name': 'Dr. Rahul Sharma',
        'speciality': 'Cardiologist',
        'experience': 12,
        'consultationFee': 800,
        'available': true,
      };

      final doctor = Doctor.fromJson(json);

      expect(doctor.consultationFee, isA<double>());
      expect(doctor.consultationFee, 800.0);
    });
  });
}