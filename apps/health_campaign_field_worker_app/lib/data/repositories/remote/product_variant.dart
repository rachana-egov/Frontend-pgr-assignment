// Generated using mason. Do not modify by hand

import '../../../models/data_model.dart';
import '../../data_repository.dart';

class ProductVariantRepository extends RemoteRepository<ProductVariantModel, ProductVariantSearchModel> {
  ProductVariantRepository(
    super.dio, {
    required super.path,
    super.entityName = 'ProductVariant',
  });
}