String getMessageFromErrorCode(String errorCode) {
  String error = "";

  switch (errorCode) {
    case 'weak-password':
      error = "The password provided is too weak.";
      break;
    case 'invalid-email':
      error = "Email is not valid";
      break;
    case 'wrong-password':
      error = "Password is not valid";
      break;
    case "email-already-in-use":
      error = "The account already exists for this email.";
      break;
    case "user-not-found":
      error = "We don't have your records please Sign up.";
      break;
    default:
      error = "Error occurred. Try again later";
  }
  return error;
}
