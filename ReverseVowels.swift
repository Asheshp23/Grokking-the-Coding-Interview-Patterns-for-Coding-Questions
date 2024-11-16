func reverseVowels(of string: String) -> String {
    var vowels: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
    var string1: [Character] = Array(string)  // Convert the string to an array of characters
    
    var leftIndex = 0
    var rightIndex = string1.count - 1
    
    while leftIndex < rightIndex {
        // Move leftIndex to the next vowel
        if !vowels.contains(string1[leftIndex]) {
            leftIndex += 1
            continue
        }
        
        // Move rightIndex to the previous vowel
        if !vowels.contains(string1[rightIndex]) {
            rightIndex -= 1
            continue
        }
        
        // Swap vowels
        string1.swapAt(leftIndex, rightIndex)
        
        // Move both pointers inward
        leftIndex += 1
        rightIndex -= 1
    }
    
    return String(string1)  // Convert the array of characters back to a string
}
