import 'package:book_salon_app/data/Response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? massege;
  ApiResponse(this.status, this.data, this.massege);

  ApiResponse.loading() : status = Status.Loading;
  ApiResponse.compileted(this.data) : status = Status.compileted;
  ApiResponse.error(this.massege) : status = Status.error;

  @override
  String toString() {

    return "Status :$status \n Massege:$massege \n Data:$data";
  }
}
