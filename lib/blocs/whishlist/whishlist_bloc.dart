/*import 'dart:async';

//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/models/models.dart';

part 'whishlist_event.dart';
part 'whishlist_state.dart';

class WhishlistBloc extends Bloc<WhishlistEvent, WhishlistState> {
  //WhishlistBloc() : super(WhishlistLoading());
  @override
  Stream<WhishlistState> mapEventToState(
    WhishlistEvent event,
    WhishlistState state,
  ) async* {
    if (event is StartWhishlist) {
      yield* _mapStartWishlistState();
    } else if (event is AddProductToWhishlist) {
      yield* _mapAddWishlistProductToState(event, state);
    } else if (event is RemoveProductFromWhishlist) {
      yield* _mapRemoveWishlistProductToState(event, state);
    }
  }

  Stream<WhishlistState> _mapStartWishlistState() async* {
    yield WhishlistLoading();
    try {
      await Future<void>.delayed(Duration(seconds: 1));
      yield const WhishlistLoaded();
    } catch (_) {}
  }

  Stream<WhishlistState> _mapAddWishlistProductToState(
    AddProductToWhishlist event,
    WhishlistState state,
  ) async* {
    if (state is WhishlistLoaded) {
      try {
        yield WhishlistLoaded(
          whishlist: Whishlist(
              products: List.from(state.whishlist.products)
                ..add(event.product)),
        );
      } catch (_) {}
    }
  }

  Stream<WhishlistState> _mapRemoveWishlistProductToState(
    RemoveProductFromWhishlist event,
    WhishlistState state,
  ) async* {
    if (state is WhishlistLoaded) {
      try {
        yield WhishlistLoaded(
          whishlist: Whishlist(
              products: List.from(state.whishlist.products)
                ..remove(event.product)),
        );
      } catch (_) {}
    }
  }
}*/
