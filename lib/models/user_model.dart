import 'dart:convert';

class User {
  final String? uuid;
  final String? fullname;
  final String? phoneNumber;
  final String? email;
  final String? dob;
  final String? gender;
  final String? maritalStatus;
  final String? bloodGroup;
  final String? nationality;
  final String? address;
  final String? identificationNo;
  final String? fieldOfStudy;
  final String? institute;
  final String? emergencyContact;
  final String? emergencyPhone;
  final String? avatar;

  User({
    this.uuid,
    this.fullname,
    this.phoneNumber,
    this.email,
    this.dob,
    this.gender,
    this.maritalStatus,
    this.bloodGroup,
    this.nationality,
    this.address,
    this.identificationNo,
    this.fieldOfStudy,
    this.institute,
    this.emergencyContact,
    this.emergencyPhone,
    this.avatar,
  });

  User copyWith({
    String? uuid,
    String? fullname,
    String? phoneNumber,
    String? email,
    String? dob,
    String? gender,
    String? maritalStatus,
    String? bloodGroup,
    String? nationality,
    String? address,
    String? identificationNo,
    String? fieldOfStudy,
    String? institute,
    String? emergencyContact,
    String? emergencyPhone,
    String? avatar,
  }) =>
      User(
        uuid: uuid ?? this.uuid,
        fullname: fullname ?? this.fullname,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        dob: dob ?? this.dob,
        gender: gender ?? this.gender,
        maritalStatus: maritalStatus ?? this.maritalStatus,
        bloodGroup: bloodGroup ?? this.bloodGroup,
        nationality: nationality ?? this.nationality,
        address: address ?? this.address,
        identificationNo: identificationNo ?? this.identificationNo,
        fieldOfStudy: fieldOfStudy ?? this.fieldOfStudy,
        institute: institute ?? this.institute,
        emergencyContact: emergencyContact ?? this.emergencyContact,
        emergencyPhone: emergencyPhone ?? this.emergencyPhone,
        avatar: avatar ?? this.avatar,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        uuid: json["uuid"],
        fullname: json["fullname"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        dob: json["dob"],
        gender: json["gender"],
        maritalStatus: json["maritalStatus"],
        bloodGroup: json["bloodGroup"],
        nationality: json["nationality"],
        address: json["address"],
        identificationNo: json["identificationNo"],
        fieldOfStudy: json["fieldOfStudy"],
        institute: json["institute"],
        emergencyContact: json["emergencyContact"],
        emergencyPhone: json["emergencyPhone"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "fullname": fullname,
        "phoneNumber": phoneNumber,
        "email": email,
        "dob": dob,
        "gender": gender,
        "maritalStatus": maritalStatus,
        "bloodGroup": bloodGroup,
        "nationality": nationality,
        "address": address,
        "identificationNo": identificationNo,
        "fieldOfStudy": fieldOfStudy,
        "institute": institute,
        "emergencyContact": emergencyContact,
        "emergencyPhone": emergencyPhone,
        "avatar": avatar,
      };
}
