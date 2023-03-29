import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musik/model/songModel.dart';

part 'allsongs_event.dart';
part 'allsongs_state.dart';
part 'allsongs_bloc.freezed.dart';

class AllsongsBloc extends Bloc<AllsongsEvent, AllsongsState> {
  AllsongsBloc() : super(AllsongsState.initial()) {
    // on<AllsongsEvent>((event, emit) {
    //
    // });
  }
}
