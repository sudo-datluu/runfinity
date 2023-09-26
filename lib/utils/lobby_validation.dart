class CreateLobbyValidation{
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
    else if (!isNumeric(value)) {
      return "Please enter an integer";
    }

    return null;
  }

  bool isNumeric(String str) {
    if(str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }
}

class JoinLobbyValidation {
  bool validateCurrentMember(currentMembers, limitedMembers) {
    if (currentMembers >= limitedMembers) {
      return false;
    }

    return true;
  }
}