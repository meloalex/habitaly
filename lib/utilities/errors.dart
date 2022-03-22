class Errors {
  static String handleAuthError(String code) {
    switch (code) {
      case 'ERROR_USER_NOT_FOUND':
        return 'User not found.';

      case 'ERROR_WRONG_PASSWORD':
        return 'Wrong email or password.';

      case 'ERROR_NETWORK_REQUEST_FAILED':
        return 'Network error. Please try again later.';

      case 'ERROR_EMAIL_ALREADY_IN_USE':
        return 'This email is already in use.';

      default:
        return 'Something went wrong. Please try again later.';
    }
  }
}
