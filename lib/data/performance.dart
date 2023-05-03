class Performance {
  String? szStatus;
  String? szMessage;
  OResult? oResult;

  Performance({
    this.szStatus,
    this.szMessage,
    this.oResult,
  });

  Performance.fromJson(Map<String, dynamic> json) {
    szStatus = json['szStatus'] as String?;
    szMessage = json['szMessage'] as String?;
    oResult = (json['oResult'] as Map<String,dynamic>?) != null ? OResult.fromJson(json['oResult'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['szStatus'] = szStatus;
    json['szMessage'] = szMessage;
    json['oResult'] = oResult?.toJson();
    return json;
  }
}

class OResult {
  MonthToDatePerformance? monthToDatePerformance;
  TodayPerformance? todayPerformance;

  OResult({
    this.monthToDatePerformance,
    this.todayPerformance,
  });

  OResult.fromJson(Map<String, dynamic> json) {
    monthToDatePerformance = (json['monthToDatePerformance'] as Map<String,dynamic>?) != null ? MonthToDatePerformance.fromJson(json['monthToDatePerformance'] as Map<String,dynamic>) : null;
    todayPerformance = (json['todayPerformance'] as Map<String,dynamic>?) != null ? TodayPerformance.fromJson(json['todayPerformance'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['monthToDatePerformance'] = monthToDatePerformance?.toJson();
    json['todayPerformance'] = todayPerformance?.toJson();
    return json;
  }
}

class MonthToDatePerformance {
  List<String>? monthToDatePerformance;
  List<Details>? details;

  MonthToDatePerformance({
    this.monthToDatePerformance,
    this.details,
  });

  MonthToDatePerformance.fromJson(Map<String, dynamic> json) {
    monthToDatePerformance = (json['MonthToDatePerformance'] as List?)?.map((dynamic e) => e as String).toList();
    details = (json['details'] as List?)?.map((dynamic e) => Details.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['MonthToDatePerformance'] = monthToDatePerformance;
    json['details'] = details?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Details {
  String? szDocId;
  String? dtmDoc;
  String? szEmployeeId;
  Employee? employee;
  String? szVehicleNo;
  String? dtmStart;
  String? dtmFinished;
  bool? bStarted;
  bool? bFinished;
  dynamic szNote;
  List<Items>? items;
  dynamic todayPerformance;
  dynamic monthlyPerformance;
  dynamic reasons;
  dynamic dailyNews;

  Details({
    this.szDocId,
    this.dtmDoc,
    this.szEmployeeId,
    this.employee,
    this.szVehicleNo,
    this.dtmStart,
    this.dtmFinished,
    this.bStarted,
    this.bFinished,
    this.szNote,
    this.items,
    this.todayPerformance,
    this.monthlyPerformance,
    this.reasons,
    this.dailyNews,
  });

  Details.fromJson(Map<String, dynamic> json) {
    szDocId = json['szDocId'] as String?;
    dtmDoc = json['dtmDoc'] as String?;
    szEmployeeId = json['szEmployeeId'] as String?;
    employee = (json['employee'] as Map<String,dynamic>?) != null ? Employee.fromJson(json['employee'] as Map<String,dynamic>) : null;
    szVehicleNo = json['szVehicleNo'] as String?;
    dtmStart = json['dtmStart'] as String?;
    dtmFinished = json['dtmFinished'] as String?;
    bStarted = json['bStarted'] as bool?;
    bFinished = json['bFinished'] as bool?;
    szNote = json['szNote'];
    items = (json['items'] as List?)?.map((dynamic e) => Items.fromJson(e as Map<String,dynamic>)).toList();
    todayPerformance = json['TodayPerformance'];
    monthlyPerformance = json['MonthlyPerformance'];
    reasons = json['reasons'];
    dailyNews = json['dailyNews'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['szDocId'] = szDocId;
    json['dtmDoc'] = dtmDoc;
    json['szEmployeeId'] = szEmployeeId;
    json['employee'] = employee?.toJson();
    json['szVehicleNo'] = szVehicleNo;
    json['dtmStart'] = dtmStart;
    json['dtmFinished'] = dtmFinished;
    json['bStarted'] = bStarted;
    json['bFinished'] = bFinished;
    json['szNote'] = szNote;
    json['items'] = items?.map((e) => e.toJson()).toList();
    json['TodayPerformance'] = todayPerformance;
    json['MonthlyPerformance'] = monthlyPerformance;
    json['reasons'] = reasons;
    json['dailyNews'] = dailyNews;
    return json;
  }
}

class Employee {
  String? szId;
  String? szName;
  String? szBranchId;
  String? szBranchNm;
  String? szCompanyId;
  String? szCompanyNm;

  Employee({
    this.szId,
    this.szName,
    this.szBranchId,
    this.szBranchNm,
    this.szCompanyId,
    this.szCompanyNm,
  });

  Employee.fromJson(Map<String, dynamic> json) {
    szId = json['szId'] as String?;
    szName = json['szName'] as String?;
    szBranchId = json['szBranchId'] as String?;
    szBranchNm = json['szBranchNm'] as String?;
    szCompanyId = json['szCompanyId'] as String?;
    szCompanyNm = json['szCompanyNm'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['szId'] = szId;
    json['szName'] = szName;
    json['szBranchId'] = szBranchId;
    json['szBranchNm'] = szBranchNm;
    json['szCompanyId'] = szCompanyId;
    json['szCompanyNm'] = szCompanyNm;
    return json;
  }
}

class Items {
  String? szDocId;
  String? szCustomerId;
  String? dtmStart;
  String? dtmFinish;
  String? szStatus;
  String? szReasonId;
  String? szNote;
  bool? bRescheduled;
  String? dtmReschedule;
  dynamic szImageId;
  dynamic szImageBase64;
  dynamic btImag;
  Customer? customer;
  bool? bVisited;
  bool? bFinished;
  String? szLongitude;
  String? szLatitude;
  List<dynamic>? images;

  Items({
    this.szDocId,
    this.szCustomerId,
    this.dtmStart,
    this.dtmFinish,
    this.szStatus,
    this.szReasonId,
    this.szNote,
    this.bRescheduled,
    this.dtmReschedule,
    this.szImageId,
    this.szImageBase64,
    this.btImag,
    this.customer,
    this.bVisited,
    this.bFinished,
    this.szLongitude,
    this.szLatitude,
    this.images,
  });

  Items.fromJson(Map<String, dynamic> json) {
    szDocId = json['szDocId'] as String?;
    szCustomerId = json['szCustomerId'] as String?;
    dtmStart = json['dtmStart'] as String?;
    dtmFinish = json['dtmFinish'] as String?;
    szStatus = json['szStatus'] as String?;
    szReasonId = json['szReasonId'] as String?;
    szNote = json['szNote'] as String?;
    bRescheduled = json['bRescheduled'] as bool?;
    dtmReschedule = json['dtmReschedule'] as String?;
    szImageId = json['szImageId'];
    szImageBase64 = json['szImageBase64'];
    btImag = json['btImag'];
    customer = (json['customer'] as Map<String,dynamic>?) != null ? Customer.fromJson(json['customer'] as Map<String,dynamic>) : null;
    bVisited = json['bVisited'] as bool?;
    bFinished = json['bFinished'] as bool?;
    szLongitude = json['szLongitude'] as String?;
    szLatitude = json['szLatitude'] as String?;
    images = json['images'] as List?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['szDocId'] = szDocId;
    json['szCustomerId'] = szCustomerId;
    json['dtmStart'] = dtmStart;
    json['dtmFinish'] = dtmFinish;
    json['szStatus'] = szStatus;
    json['szReasonId'] = szReasonId;
    json['szNote'] = szNote;
    json['bRescheduled'] = bRescheduled;
    json['dtmReschedule'] = dtmReschedule;
    json['szImageId'] = szImageId;
    json['szImageBase64'] = szImageBase64;
    json['btImag'] = btImag;
    json['customer'] = customer?.toJson();
    json['bVisited'] = bVisited;
    json['bFinished'] = bFinished;
    json['szLongitude'] = szLongitude;
    json['szLatitude'] = szLatitude;
    json['images'] = images;
    return json;
  }
}

class Customer {
  String? szId;
  String? szName;
  String? szAddress;
  String? szPhone1;
  String? szPhone2;
  String? szLongitude;
  String? szLatitude;
  List<OperArList>? operArList;
  double? decTotalOpenAr;

  Customer({
    this.szId,
    this.szName,
    this.szAddress,
    this.szPhone1,
    this.szPhone2,
    this.szLongitude,
    this.szLatitude,
    this.operArList,
    this.decTotalOpenAr,
  });

  Customer.fromJson(Map<String, dynamic> json) {
    szId = json['szId'] as String?;
    szName = json['szName'] as String?;
    szAddress = json['szAddress'] as String?;
    szPhone1 = json['szPhone1'] as String?;
    szPhone2 = json['szPhone2'] as String?;
    szLongitude = json['szLongitude'] as String?;
    szLatitude = json['szLatitude'] as String?;
    operArList = (json['operArList'] as List?)?.map((dynamic e) => OperArList.fromJson(e as Map<String,dynamic>)).toList();
    decTotalOpenAr = json['decTotalOpenAr'] as double?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['szId'] = szId;
    json['szName'] = szName;
    json['szAddress'] = szAddress;
    json['szPhone1'] = szPhone1;
    json['szPhone2'] = szPhone2;
    json['szLongitude'] = szLongitude;
    json['szLatitude'] = szLatitude;
    json['operArList'] = operArList?.map((e) => e.toJson()).toList();
    json['decTotalOpenAr'] = decTotalOpenAr;
    return json;
  }
}

class OperArList {
  String? szDocInvoiceId;
  String? szDocPolisId;
  String? szCurrencyId;
  int? intInstallmentNumber;
  String? dtmInstallment;
  double? decRemain;

  OperArList({
    this.szDocInvoiceId,
    this.szDocPolisId,
    this.szCurrencyId,
    this.intInstallmentNumber,
    this.dtmInstallment,
    this.decRemain,
  });

  OperArList.fromJson(Map<String, dynamic> json) {
    szDocInvoiceId = json['szDocInvoiceId'] as String?;
    szDocPolisId = json['szDocPolisId'] as String?;
    szCurrencyId = json['szCurrencyId'] as String?;
    intInstallmentNumber = json['intInstallmentNumber'] as int?;
    dtmInstallment = json['dtmInstallment'] as String?;
    decRemain = json['decRemain'] as double?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['szDocInvoiceId'] = szDocInvoiceId;
    json['szDocPolisId'] = szDocPolisId;
    json['szCurrencyId'] = szCurrencyId;
    json['intInstallmentNumber'] = intInstallmentNumber;
    json['dtmInstallment'] = dtmInstallment;
    json['decRemain'] = decRemain;
    return json;
  }
}

class TodayPerformance {
  List<String>? todayPerformance;
  List<Details>? details;

  TodayPerformance({
    this.todayPerformance,
    this.details,
  });

  TodayPerformance.fromJson(Map<String, dynamic> json) {
    todayPerformance = (json['TodayPerformance'] as List?)?.map((dynamic e) => e as String).toList();
    details = (json['details'] as List?)?.map((dynamic e) => Details.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['TodayPerformance'] = todayPerformance;
    json['details'] = details?.map((e) => e.toJson()).toList();
    return json;
  }
}

class details {
  String? szDocId;
  String? dtmDoc;
  String? szEmployeeId;
  Employee? employee;
  String? szVehicleNo;
  String? dtmStart;
  String? dtmFinished;
  bool? bStarted;
  bool? bFinished;
  dynamic szNote;
  List<Items>? items;
  dynamic todayPerformance;
  dynamic monthlyPerformance;
  dynamic reasons;
  dynamic dailyNews;

  details({
    this.szDocId,
    this.dtmDoc,
    this.szEmployeeId,
    this.employee,
    this.szVehicleNo,
    this.dtmStart,
    this.dtmFinished,
    this.bStarted,
    this.bFinished,
    this.szNote,
    this.items,
    this.todayPerformance,
    this.monthlyPerformance,
    this.reasons,
    this.dailyNews,
  });

  details.fromJson(Map<String, dynamic> json) {
    szDocId = json['szDocId'] as String?;
    dtmDoc = json['dtmDoc'] as String?;
    szEmployeeId = json['szEmployeeId'] as String?;
    employee = (json['employee'] as Map<String,dynamic>?) != null ? Employee.fromJson(json['employee'] as Map<String,dynamic>) : null;
    szVehicleNo = json['szVehicleNo'] as String?;
    dtmStart = json['dtmStart'] as String?;
    dtmFinished = json['dtmFinished'] as String?;
    bStarted = json['bStarted'] as bool?;
    bFinished = json['bFinished'] as bool?;
    szNote = json['szNote'];
    items = (json['items'] as List?)?.map((dynamic e) => Items.fromJson(e as Map<String,dynamic>)).toList();
    todayPerformance = json['TodayPerformance'];
    monthlyPerformance = json['MonthlyPerformance'];
    reasons = json['reasons'];
    dailyNews = json['dailyNews'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['szDocId'] = szDocId;
    json['dtmDoc'] = dtmDoc;
    json['szEmployeeId'] = szEmployeeId;
    json['employee'] = employee?.toJson();
    json['szVehicleNo'] = szVehicleNo;
    json['dtmStart'] = dtmStart;
    json['dtmFinished'] = dtmFinished;
    json['bStarted'] = bStarted;
    json['bFinished'] = bFinished;
    json['szNote'] = szNote;
    json['items'] = items?.map((e) => e.toJson()).toList();
    json['TodayPerformance'] = todayPerformance;
    json['MonthlyPerformance'] = monthlyPerformance;
    json['reasons'] = reasons;
    json['dailyNews'] = dailyNews;
    return json;
  }
}

class employee {
  String? szId;
  String? szName;
  String? szBranchId;
  String? szBranchNm;
  String? szCompanyId;
  String? szCompanyNm;

  employee({
    this.szId,
    this.szName,
    this.szBranchId,
    this.szBranchNm,
    this.szCompanyId,
    this.szCompanyNm,
  });

  employee.fromJson(Map<String, dynamic> json) {
    szId = json['szId'] as String?;
    szName = json['szName'] as String?;
    szBranchId = json['szBranchId'] as String?;
    szBranchNm = json['szBranchNm'] as String?;
    szCompanyId = json['szCompanyId'] as String?;
    szCompanyNm = json['szCompanyNm'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['szId'] = szId;
    json['szName'] = szName;
    json['szBranchId'] = szBranchId;
    json['szBranchNm'] = szBranchNm;
    json['szCompanyId'] = szCompanyId;
    json['szCompanyNm'] = szCompanyNm;
    return json;
  }
}

class items {
  String? szDocId;
  String? szCustomerId;
  String? dtmStart;
  String? dtmFinish;
  String? szStatus;
  String? szReasonId;
  String? szNote;
  bool? bRescheduled;
  String? dtmReschedule;
  dynamic szImageId;
  dynamic szImageBase64;
  dynamic btImag;
  Customer? customer;
  bool? bVisited;
  bool? bFinished;
  String? szLongitude;
  String? szLatitude;
  List<dynamic>? images;

  items({
    this.szDocId,
    this.szCustomerId,
    this.dtmStart,
    this.dtmFinish,
    this.szStatus,
    this.szReasonId,
    this.szNote,
    this.bRescheduled,
    this.dtmReschedule,
    this.szImageId,
    this.szImageBase64,
    this.btImag,
    this.customer,
    this.bVisited,
    this.bFinished,
    this.szLongitude,
    this.szLatitude,
    this.images,
  });

  items.fromJson(Map<String, dynamic> json) {
    szDocId = json['szDocId'] as String?;
    szCustomerId = json['szCustomerId'] as String?;
    dtmStart = json['dtmStart'] as String?;
    dtmFinish = json['dtmFinish'] as String?;
    szStatus = json['szStatus'] as String?;
    szReasonId = json['szReasonId'] as String?;
    szNote = json['szNote'] as String?;
    bRescheduled = json['bRescheduled'] as bool?;
    dtmReschedule = json['dtmReschedule'] as String?;
    szImageId = json['szImageId'];
    szImageBase64 = json['szImageBase64'];
    btImag = json['btImag'];
    customer = (json['customer'] as Map<String,dynamic>?) != null ? Customer.fromJson(json['customer'] as Map<String,dynamic>) : null;
    bVisited = json['bVisited'] as bool?;
    bFinished = json['bFinished'] as bool?;
    szLongitude = json['szLongitude'] as String?;
    szLatitude = json['szLatitude'] as String?;
    images = json['images'] as List?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['szDocId'] = szDocId;
    json['szCustomerId'] = szCustomerId;
    json['dtmStart'] = dtmStart;
    json['dtmFinish'] = dtmFinish;
    json['szStatus'] = szStatus;
    json['szReasonId'] = szReasonId;
    json['szNote'] = szNote;
    json['bRescheduled'] = bRescheduled;
    json['dtmReschedule'] = dtmReschedule;
    json['szImageId'] = szImageId;
    json['szImageBase64'] = szImageBase64;
    json['btImag'] = btImag;
    json['customer'] = customer?.toJson();
    json['bVisited'] = bVisited;
    json['bFinished'] = bFinished;
    json['szLongitude'] = szLongitude;
    json['szLatitude'] = szLatitude;
    json['images'] = images;
    return json;
  }
}

class customer {
  String? szId;
  String? szName;
  String? szAddress;
  String? szPhone1;
  String? szPhone2;
  String? szLongitude;
  String? szLatitude;
  List<OperArList>? operArList;
  int? decTotalOpenAr;

  customer({
    this.szId,
    this.szName,
    this.szAddress,
    this.szPhone1,
    this.szPhone2,
    this.szLongitude,
    this.szLatitude,
    this.operArList,
    this.decTotalOpenAr,
  });

  customer.fromJson(Map<String, dynamic> json) {
    szId = json['szId'] as String?;
    szName = json['szName'] as String?;
    szAddress = json['szAddress'] as String?;
    szPhone1 = json['szPhone1'] as String?;
    szPhone2 = json['szPhone2'] as String?;
    szLongitude = json['szLongitude'] as String?;
    szLatitude = json['szLatitude'] as String?;
    operArList = (json['operArList'] as List?)?.map((dynamic e) => OperArList.fromJson(e as Map<String,dynamic>)).toList();
    decTotalOpenAr = json['decTotalOpenAr'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['szId'] = szId;
    json['szName'] = szName;
    json['szAddress'] = szAddress;
    json['szPhone1'] = szPhone1;
    json['szPhone2'] = szPhone2;
    json['szLongitude'] = szLongitude;
    json['szLatitude'] = szLatitude;
    json['operArList'] = operArList?.map((e) => e.toJson()).toList();
    json['decTotalOpenAr'] = decTotalOpenAr;
    return json;
  }
}

class operArList {
  String? szDocInvoiceId;
  String? szDocPolisId;
  String? szCurrencyId;
  int? intInstallmentNumber;
  String? dtmInstallment;
  double? decRemain;

  operArList({
    this.szDocInvoiceId,
    this.szDocPolisId,
    this.szCurrencyId,
    this.intInstallmentNumber,
    this.dtmInstallment,
    this.decRemain,
  });

  operArList.fromJson(Map<String, dynamic> json) {
    szDocInvoiceId = json['szDocInvoiceId'] as String?;
    szDocPolisId = json['szDocPolisId'] as String?;
    szCurrencyId = json['szCurrencyId'] as String?;
    intInstallmentNumber = json['intInstallmentNumber'] as int?;
    dtmInstallment = json['dtmInstallment'] as String?;
    decRemain = json['decRemain'] as double?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['szDocInvoiceId'] = szDocInvoiceId;
    json['szDocPolisId'] = szDocPolisId;
    json['szCurrencyId'] = szCurrencyId;
    json['intInstallmentNumber'] = intInstallmentNumber;
    json['dtmInstallment'] = dtmInstallment;
    json['decRemain'] = decRemain;
    return json;
  }
}