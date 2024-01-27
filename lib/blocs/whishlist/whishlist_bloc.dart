import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/models/models.dart';

part 'whishlist_event.dart';
part 'whishlist_state.dart';

class WhishlistBloc extends Bloc<WhishlistEvent, WhishlistState> {
  WhishlistBloc() : super(WhishlistLoading()) {
    on<StartWhishlist>((event, emit) async {
      emit(WhishlistLoading());
      try {
        // Simulate some loading or fetching logic
        await Future<void>.delayed(const Duration(seconds: 1));
        // Assuming WhishlistLoaded takes no arguments or has default ones
        emit(const WhishlistLoaded());
      } catch (_) {
        emit(WhishlistError());
      }
    });

    on<AddWhishlistProduct>((event, emit) {
      if (state is WhishlistLoaded) {
        try {
          final state = this.state as WhishlistLoaded;
          emit(WhishlistLoaded(
            whishlist: Whishlist(
              products: List.from(state.whishlist.products)..add(event.product),
            ),
          ));
        } catch (_) {
          emit(WhishlistError());
        }
      }
    });

    on<RemoveWhishlistProduct>((event, emit) {
      if (state is WhishlistLoaded) {
        try {
          final state = this.state as WhishlistLoaded;
          emit(WhishlistLoaded(
            whishlist: Whishlist(
              products: List.from(state.whishlist.products)..remove(event.product),
            ),
          ));
        } catch (_) {
          emit(WhishlistError());
        }
      }
    });
  }
}
