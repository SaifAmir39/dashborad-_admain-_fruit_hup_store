part of 'updateorder_bloc.dart';

@immutable
abstract class UpdateorderState {}

class UpdateorderInitial extends UpdateorderState {}

class UpdateorderLoading extends UpdateorderState {}
class UpdateorderSucess extends UpdateorderState {}
class UpdateorderError extends UpdateorderState {
  final String message;
  UpdateorderError({required this.message,r});
}