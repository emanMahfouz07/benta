// class ServerErrors {
//   final String message;

//   ServerErrors({required this.message});

//   factory ServerErrors.fromJson(Map<String, dynamic> json) {
//     if (json.containsKey("errors") && json["errors"] is Map) {
//       final errors = json["errors"] as Map;
//       if (errors.isNotEmpty) {
//         return ServerErrors(message: errors.values.first.toString());
//       }
//     }

//     return ServerErrors(
//       message: json["message"] ?? "An unknown error occurred",
//     );
//   }
// }
