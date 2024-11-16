func checkIfPangram(_ s: String) -> Bool {
    var seen: Set<Character> = []
    
    for char in s {
        if char.isLetter {
            seen.insert(Character(char.lowercased()))
        }
        if seen.count == 26 {
            return true
        }
    }
    
    return false
}

func checkIfPangram(_ s: String) -> Bool {
    let alphabet = Set(“abcdefghijklmnopqrstuvwxyz”)
    return alphabet.isSubset(of: Set(s.lowercased()))
}

func checkIfPangram(_ s: String) -> Bool {
    let alphabet = Set(“abcdefghijklmnopqrstuvwxyz”)
    return s.lowercased().filter { alphabet.contains($0) }.count == 26
}

