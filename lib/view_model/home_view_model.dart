// import 'package:flutter/material.dart';
//
// import '../data/response/api_response.dart';
// import '../model/movies_model.dart';
// import '../respository/home_repository.dart';
//
// /// Created by Sawan Kumar on 12/05/23.
//
// class HomeViewViewModel with ChangeNotifier {
//   final _myRepo = HomeRepository();
//
//   ApiResponse<MoviesListModel> moviesList = ApiResponse.loading();
//   setMovieslist(ApiResponse<MoviesListModel> response) {
//     moviesList = response;
//     notifyListeners();
//   }
//
//   Future<void> fetchMovieslistApi() async {
//     setMovieslist(ApiResponse.loading());
//     _myRepo.moviesApi().then((value) {
//       setMovieslist(ApiResponse.completed(value));
//     }).onError((error, stackTrace) {
//       setMovieslist(ApiResponse.error(error.toString()));
//     });
//   }
// }
