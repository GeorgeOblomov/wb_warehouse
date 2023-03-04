import 'package:json_annotation/json_annotation.dart';

part 'vendor_codes_request_dto.g.dart';

@JsonSerializable(
  createFactory: false,
)
class VendorCodesRequestDto {
  final Iterable<String> vendorCodes;

  VendorCodesRequestDto({required this.vendorCodes});

  Map<String, dynamic> toJson() => _$VendorCodesRequestDtoToJson(this);
}
