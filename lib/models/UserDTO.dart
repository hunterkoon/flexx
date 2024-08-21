class UserDTO {
  String fullName;
  String documentNumber;
  String documentType;
  String password;
  String email;
  String cellPhone;

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
