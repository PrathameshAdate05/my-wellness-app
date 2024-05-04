import 'package:my_wellness_mobile/data/models/medicine_model.dart';

class Prescription {
  final String pid;
  final List<Medicine> medicines;
  final String patientId;
  final String doctorId;
  final String hospitalId;
  final String createdAt;

  Prescription({
    required this.pid,
    required this.medicines,
    required this.patientId,
    required this.doctorId,
    required this.hospitalId,
    required this.createdAt,
  });
}
