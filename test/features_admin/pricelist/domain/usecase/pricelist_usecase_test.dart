import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hebauto/features_admin/pricelist/domain/entity/pricelist_entity.dart';
import 'package:hebauto/features_admin/pricelist/domain/repository/pricelist_repository.dart';
import 'package:hebauto/features_admin/pricelist/domain/usecase/pricelist_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockPriceListRepo extends Mock implements PriceListRepository {}

void main() {
  late PriceListUseCase usecase;
  late PriceListRepository repository;

  setUp(() {
    repository = MockPriceListRepo();
    usecase = PriceListUseCase(repository);
  });

  test('Price List Usecase', () async {
    //Arrange
    when(
      () => repository.fetchPriceList(
        params: const PriceListParams(),
      ),
    ).thenAnswer(
      (invocation) async => Right(
        PriceListResponseEntity(
          status: true,
          message: '',
        ),
      ),
    );
    // Act
    final result = await usecase(
      const PriceListParams(),
    );
    // Assert
    expect(
      result,
      equals(
        Right<dynamic, PriceListResponseEntity>(
          PriceListResponseEntity(
            status: true,
            message: '',
          ),
        ),
      ),
    );
  });
}
