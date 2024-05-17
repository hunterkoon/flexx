class UserDTO {
  final String fullName;

  final String documentNumber;

  final String documentType;

  final String password;

  final String email;

  final String cellPhone;

  UserDTO(this.fullName, this.documentNumber, this.documentType, this.password, this.email, this.cellPhone);

  Map toJson() => {
        'fullName': fullName,
        'documentNumber': documentNumber,
        'documentType': documentType,
        'password': password,
        'cellPhone' : cellPhone,
        'email' : email
      };
}
