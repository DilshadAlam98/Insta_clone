String getMessageFromErrorCode(String errorCode) {
  String error = "";

  switch (errorCode) {
    case 'weak-password':
      error = "The password provided is too weak.";
      break;
    case "email-already-in-use":
      error = "The account already exists for that email.";
      break;
    case "ERROR_INVALID_EMAIL":
      error = "Your email address appears to be malformed.";
      break;
    default:
      error = "An undefined Error happened. Try again later";
  }
  return error;
}
