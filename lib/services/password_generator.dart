import 'dart:math';

/// Generates a strong password of the given length. Defaults to 8.
String generateStrongPassword({int length=8}) {
  // Define character sets for each type of character
  const String lowercase = 'abcdefghijklmnopqrstuvwxyz';
  const String uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const String digits = '0123456789';
  const String symbols = '!@#\$%^&*()_+~-=';

  // Combine all character sets into one string
  String allCharacters = lowercase + uppercase + digits + symbols;

  // Create a secure random number generator
  Random random = Random.secure();
  List<String> chars = [];

  // Add at least one character from each character set to ensure they're included
  chars.add(lowercase[random.nextInt(lowercase.length)]);
  chars.add(uppercase[random.nextInt(uppercase.length)]);
  chars.add(digits[random.nextInt(digits.length)]);
  chars.add(symbols[random.nextInt(symbols.length)]);

  // Add random characters from all character sets until the desired length is reached
  while (chars.length < length) {
    int index = random.nextInt(allCharacters.length);
    chars.add(allCharacters[index]);
  }

  // Shuffle the characters to make it harder to guess the password
  chars.shuffle(random);

  // Return the password as a string
  return chars.join();
}
