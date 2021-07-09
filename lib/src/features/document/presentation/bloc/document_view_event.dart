part of 'document_view_bloc.dart';

@freezed
class DocumentViewEvent with _$DocumentViewEvent {
  const factory DocumentViewEvent.zoomIn() = ZoomIn;
  const factory DocumentViewEvent.zoomOut() = ZoomOut;
}
