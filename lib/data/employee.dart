class Employee {
  String? szStatus;
  String? szMessage;
  List<OResult>? oResult;

  Employee({
    this.szStatus,
    this.szMessage,
    this.oResult,
  });

  Employee.fromJson(Map<String, dynamic> json) {
    szStatus = json['szStatus'] as String?;
    szMessage = json['szMessage'] as String?;
    oResult = (json['oResult'] as List?)?.map((dynamic e) => OResult.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['szStatus'] = szStatus;
    json['szMessage'] = szMessage;
    json['oResult'] = oResult?.map((e) => e.toJson()).toList();
    return json;
  }
}

class OResult {
  String? szId;
  String? szEmployeeId;
  String? szEmployeeNm;

  OResult({
    this.szId,
    this.szEmployeeId,
    this.szEmployeeNm,
  });

  OResult.fromJson(Map<String, dynamic> json) {
    szId = json['szId'] as String?;
    szEmployeeId = json['szEmployeeId'] as String?;
    szEmployeeNm = json['szEmployeeNm'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['szId'] = szId;
    json['szEmployeeId'] = szEmployeeId;
    json['szEmployeeNm'] = szEmployeeNm;
    return json;
  }
}