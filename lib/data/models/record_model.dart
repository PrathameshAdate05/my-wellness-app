import 'package:my_wellness_mobile/data/models/prescription_model.dart';

class Record {
  final String doctorId;
  final String patientId;
  final String hospitalId;
  final Prescription prescription;
  final String diagnosis;
  final String description;
  final DateTime admissionDate;
  final DateTime dischargeDate;

  Record({
    required this.doctorId,
    required this.patientId,
    required this.hospitalId,
    required this.prescription,
    required this.diagnosis,
    required this.description,
    required this.admissionDate,
    required this.dischargeDate,
  });
}
