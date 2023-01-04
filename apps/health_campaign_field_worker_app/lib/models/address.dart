// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

import 'data_model.dart';

@MappableClass()
class AddressRequestModel extends DataModel {
  final String? id;
  final String? tenantId;
  final String? doorNo;
  final double? latitude;
  final double? longitude;
  final double? locationAccuracy;
  final String? addressLine1;
  final String? addressLine2;
  final String? landmark;
  final String? city;
  final String? pincode;
  final String? buildingName;
  final String? street;
  final String? clientReferenceId;
  final BoundaryRequestModel? locality;
  final AddressType? type;
  
  AddressRequestModel({
    this.id,
    this.tenantId,
    this.doorNo,
    this.latitude,
    this.longitude,
    this.locationAccuracy,
    this.addressLine1,
    this.addressLine2,
    this.landmark,
    this.city,
    this.pincode,
    this.buildingName,
    this.street,
    this.clientReferenceId,
    this.locality,
    this.type,
    super.auditDetails,
  }):  super();
}

@MappableClass()
class AddressModel extends DataModel implements AddressRequestModel {
  
  @override
  final String? id;
  
  @override
  final String tenantId;
  
  @override
  final String doorNo;
  
  @override
  final double latitude;
  
  @override
  final double longitude;
  
  @override
  final double locationAccuracy;
  
  @override
  final String addressLine1;
  
  @override
  final String addressLine2;
  
  @override
  final String? landmark;
  
  @override
  final String city;
  
  @override
  final String pincode;
  
  @override
  final String? buildingName;
  
  @override
  final String? street;
  
  @override
  final String clientReferenceId;
  
  @override
  final BoundaryRequestModel locality;
  
  @override
  final AddressType type;
  

  AddressModel({
     this.id,
    required this.tenantId,
    required this.doorNo,
    required this.latitude,
    required this.longitude,
    required this.locationAccuracy,
    required this.addressLine1,
    required this.addressLine2,
     this.landmark,
    required this.city,
    required this.pincode,
     this.buildingName,
     this.street,
    required this.clientReferenceId,
    required this.locality,
    required this.type,
    super.auditDetails,
  }):  super();
}
