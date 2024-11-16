func reverseVowels(in string: String) -> String {
    let vowels: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
    var characters: [Character] = Array(string)  // Convert string to array of characters
    
    var leftPointer = 0
    var rightPointer = characters.count - 1
    
    while leftPointer < rightPointer {
        // Skip non-vowel characters from the left
        if !vowels.contains(characters[leftPointer]) {
            leftPointer += 1
            continue
        }
        
        // Skip non-vowel characters from the right
        if !vowels.contains(characters[rightPointer]) {
            rightPointer -= 1
            continue
        }
        
        // Swap vowels
        characters.swapAt(leftPointer, rightPointer)
        
        // Move both pointers inward
        leftPointer += 1
        rightPointer -= 1
    }
    
    return String(characters)  // Convert the array of characters back to a string
}
