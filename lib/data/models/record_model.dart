import 'package:my_wellness_mobile/data/models/doctor_model.dart';
import 'package:my_wellness_mobile/data/models/hospital_model.dart';
import 'package:my_wellness_mobile/data/models/prescription_model.dart';

class RecordModel {
  final String doctorId;
  final String patientId;
  final String hospitalId;
  final Prescription prescription;
  final String diagnosis;
  final String description;
  final DateTime admissionDate;
  final DateTime dischargeDate;
  final Doctor doctor;
  final Hospital hospital;
  final String createdAt;

  RecordModel({
    required this.doctorId,
    required this.patientId,
    required this.hospitalId,
    required this.prescription,
    required this.diagnosis,
    required this.description,
    required this.admissionDate,
    required this.dischargeDate,
    required this.doctor,
    required this.hospital,
    required this.createdAt,
  });
}
