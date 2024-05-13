class ErrorDTO {
  String? status;
  String message;
  String? details;

  ErrorDTO(this.status, this.message, this.details);

  ErrorDTO.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        message = json['message'] as String,
        details = json['details'] as String?;

  Map toJson() => {'status': status, 'message': message, 'details': details};
}
