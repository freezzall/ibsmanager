class Maps {
  String? szStatus;
  String? szMessage;
  List<OResult>? oResult;

  Maps({
    this.szStatus,
    this.szMessage,
    this.oResult,
  });

  Maps.fromJson(Map<String, dynamic> json) {
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
  String? szEmployeeId;
  String? szEmployeeNm;
  List<Items>? items;

  OResult({
    this.szEmployeeId,
    this.szEmployeeNm,
    this.items,
  });

  OResult.fromJson(Map<String, dynamic> json) {
    szEmployeeId = json['szEmployeeId'] as String?;
    szEmployeeNm = json['szEmployeeNm'] as String?;
    items = (json['items'] as List?)?.map((dynamic e) => Items.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['szEmployeeId'] = szEmployeeId;
    json['szEmployeeNm'] = szEmployeeNm;
    json['items'] = items?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Items {
  String? szCustomerId;
  String? szCustomerNm;
  String? dtmStart;
  String? dtmFinish;
  String? szStatus;
  String? szReasonId;
  String? szNote;
  String? szLongitude;
  String? szLatitude;

  Items({
    this.szCustomerId,
    this.szCustomerNm,
    this.dtmStart,
    this.dtmFinish,
    this.szStatus,
    this.szReasonId,
    this.szNote,
    this.szLongitude,
    this.szLatitude,
  });

  Items.fromJson(Map<String, dynamic> json) {
    szCustomerId = json['szCustomerId'] as String?;
    szCustomerNm = json['szCustomerNm'] as String?;
    dtmStart = json['dtmStart'] as String?;
    dtmFinish = json['dtmFinish'] as String?;
    szStatus = json['szStatus'] as String?;
    szReasonId = json['szReasonId'] as String?;
    szNote = json['szNote'] as String?;
    szLongitude = json['szLongitude'] as String?;
    szLatitude = json['szLatitude'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['szCustomerId'] = szCustomerId;
    json['szCustomerNm'] = szCustomerNm;
    json['dtmStart'] = dtmStart;
    json['dtmFinish'] = dtmFinish;
    json['szStatus'] = szStatus;
    json['szReasonId'] = szReasonId;
    json['szNote'] = szNote;
    json['szLongitude'] = szLongitude;
    json['szLatitude'] = szLatitude;
    return json;
  }
}