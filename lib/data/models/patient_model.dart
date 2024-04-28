class Patient {
  final String patientId;
  final String firstName;
  final String middleName;
  final String lastName;
  final String email;
  final String contact;
  final int age;
  final String gender;
  final bool isAlive;
  final String address;
  final String city;
  final String state;
  final String pincode;
  final String country;
  final String createdAt;
  final String updatedAt;
  final String dob;

  Patient({
    required this.patientId,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.email,
    required this.contact,
    required this.age,
    required this.gender,
    required this.isAlive,
    required this.address,
    required this.city,
    required this.state,
    required this.pincode,
    required this.country,
    required this.createdAt,
    required this.updatedAt,
    required this.dob,
  });
}
