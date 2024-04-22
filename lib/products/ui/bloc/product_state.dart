// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

enum ProductsStatus {
  initial,
  loading,
  populated,
  failure,
}

final class ProductsState extends Equatable {
  const ProductsState({
    required this.status,
    this.products = const [],
    this.page = 0,
    this.hasMoreContent = true,
  });

  const ProductsState.initial() : this(status: ProductsStatus.initial);

  final ProductsStatus status;
  final List<ProductItem> products;
  final int page;
  final bool hasMoreContent;

  @override
  List<Object> get props => [
        status,
        products,
        page,
        hasMoreContent,
      ];

  ProductsState copyWith({
    ProductsStatus? status,
    List<ProductItem>? products,
    int? page,
    bool? hasMoreContent,
  }) {
    return ProductsState(
      status: status ?? this.status,
      products: products ?? this.products,
      page: page ?? this.page,
      hasMoreContent: hasMoreContent ?? this.hasMoreContent,
    );
  }
}
