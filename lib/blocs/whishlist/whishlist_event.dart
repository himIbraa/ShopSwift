part of 'whishlist_bloc.dart';


abstract class WhishlistEvent extends Equatable {
  const WhishlistEvent();

  @override
  List<Object> get props => [];
}

class StartWhishlist extends WhishlistEvent {}







class AddWhishlistProduct extends WhishlistEvent {
  final Product product;

  const AddWhishlistProduct(this.product);

  @override
  List<Object> get props => [product];
}






class RemoveWhishlistProduct extends WhishlistEvent {
  final Product product;

  const RemoveWhishlistProduct(this.product);

  @override
  List<Object> get props => [product];
}
