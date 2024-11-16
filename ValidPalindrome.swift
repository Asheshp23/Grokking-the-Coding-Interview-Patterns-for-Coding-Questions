func isPalindrome(_ s: String) -> Bool {
    // Filter the string to remove non-alphanumeric characters and convert to lowercase
    let filteredString = s.lowercased().filter { $0.isLetter || $0.isNumber }
    
    // Check if the filtered string is equal to its reverse
    return filteredString == String(filteredString.reversed())
}
