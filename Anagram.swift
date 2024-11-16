func areAnagrams(_ s: String, _ t: String) -> Bool {
    // If lengths are different, they cannot be anagrams
    if s.count != t.count {
        return false
    }
    
    var countMap: [Character: Int] = [:]
    
    // Count characters in s
    for char in s {
        countMap[char, default: 0] += 1
    }
    
    // Decrease the count based on characters in t
    for char in t {
        if let count = countMap[char], count > 0 {
            countMap[char] = count - 1
        } else {
            return false
        }
    }
    
    return true
}

func areAnagrams(_ s: String, _ t: String) -> Bool {
    return s.sorted() == t.sorted()
}
