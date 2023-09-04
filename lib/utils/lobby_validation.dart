class LobbyValidation{
  String? validateName(value) {
    if (value.isEmpty){
      return "Please enter your lobby name";
    }
    // already has lobby

    return null;
  }

  bool isInteger(num value) => value is int || value == value.roundToDouble();

  String? validateLimit(value)
  {
    // subscribers got more limit
    // non-subscriber got 2 limit
    if (value.isEmpty) {
      return "Please enter your limit member";
    }
    else if (isInteger(value)) {
      return "Please enter an integer";
    }

    return null;
  }
}