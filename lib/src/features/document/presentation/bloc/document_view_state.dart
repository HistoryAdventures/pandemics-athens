part of 'document_view_bloc.dart';

@freezed
class DocumentViewState with _$DocumentViewState {
  const factory DocumentViewState.initial() = Initial;
  const factory DocumentViewState.zoomedIn() = ZoomedIn;
  const factory DocumentViewState.zoomedOut() = ZoomedOut;
}
