// count letter occurance
// count word occurance

// more weight given to words formed

//String original= "to be or not to be";
String original = "The solution was found just shortly before going to sleep using the pillow instead of a table. The plaintext is recognized as the book of Daniel from the Bible, and the codeword for this stage is";
int[] alphabet = new int[26];
int[] cipher = new int[26];

int asciiShift = 97; // 'a' is 97 on the ascii chart

void setup() {

  println("original : "+original);
  for (int i = 0; i < alphabet.length; i++) {
    alphabet[i] = i;
  }

  cipher = createCipher(alphabet);

  println(cipher);
  String encrypted = rearrange(original, cipher);
  println("encrypted : "+encrypted);

  int[] reverseCipher = reverseCipher(cipher);
  
  String decrypted = rearrange(encrypted, reverseCipher);
  println("decrypted : "+decrypted);
}

void draw() {
}


int[] createCipher(int[] alphabet) {
  int scrambled[] = new int[26];
  scrambled = alphabet;
  int l = scrambled.length;
  for (int i = l; i > 0; i--) {
    int pos = int(random(l*10)%l);
    int tmp = scrambled[i-1];
    scrambled[i-1] = scrambled[pos];
    scrambled[pos] = tmp;
    println(char(i-1+asciiShift) + " --> " + char(scrambled[i-1]+asciiShift));
  }
  return scrambled;
}

// swap the content of the cipher array with the index
int[] reverseCipher(int[] cipher) {
  int reversed[] = new int[26];

  for (int i = 0; i < reversed.length; i++) {
    reversed[cipher[i]] = i;
    //println(cipher[i]);
  }

  return reversed;
}


String rearrange(String text, int[] cipher) {
  
  println("rearranging");
  String encryptedString = "";
  for (int i = 0; i < text.length(); i++) {
    if (text.charAt(i)-asciiShift >= 0 && text.charAt(i)-asciiShift < cipher.length) {
      println(i + " : " + (text.charAt(i)-asciiShift) + " : " + text.charAt(i) + " --> " + char((cipher[text.charAt(i)-asciiShift])+asciiShift));
      encryptedString = encryptedString + char((cipher[text.charAt(i)-asciiShift])+asciiShift);
    } else {
      encryptedString = encryptedString + " ";
    }
  }

  return encryptedString;
}