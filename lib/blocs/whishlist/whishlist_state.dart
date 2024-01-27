part of 'whishlist_bloc.dart';


abstract class WhishlistState extends Equatable {
  const WhishlistState();
  @override
  List<Object> get props => [];
}

class WhishlistLoading extends WhishlistState {

}




class WhishlistLoaded extends WhishlistState {
  final Whishlist whishlist;

  const WhishlistLoaded({this.whishlist = const Whishlist()});

  @override
  List<Object> get props => [whishlist];
}




class WhishlistError extends WhishlistState {

}
