class CommonErrorResponse {
  String? message;
  String? exceptionMessage;
  String? exceptionType;

  CommonErrorResponse(
      {this.message,
        this.exceptionMessage,
        this.exceptionType,
     });

  CommonErrorResponse.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    exceptionMessage = json['ExceptionMessage'];
    exceptionType = json['ExceptionType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    data['ExceptionMessage'] = this.exceptionMessage;
    data['ExceptionType'] = this.exceptionType;
    return data;
  }
}