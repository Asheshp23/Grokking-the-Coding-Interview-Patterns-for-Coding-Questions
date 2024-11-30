//
//  LexicographicallySmallestString.swift
//
//
//  Problem: Lexicographically Smallest String After Substring Rotation
//
//  A new security algorithm has been designed to obfuscate text messages. 
//  The obfuscation process involves selecting a substring of the message 
//  and right rotating that substring by 1 position. The goal is to determine 
//  the lexicographically smallest string that can be obtained by applying this operation.
//
//  Your task is to implement a function that, given an input string `message`, 
//  returns the lexicographically smallest string that can be obtained after performing this obfuscation operation.
//


func findSmallestRotatedString(_ s: String) -> String {
    var chars = Array(s)
    var smallestString = chars
    for start in 0..<chars.count {
        for end in start..<chars.count {
            var subarray = Array(chars[start...end])
            let rotated = rotate(subarray, by: 1)
            var tempChars = chars
            tempChars.replaceSubrange(start...end, with: rotated)
            if String(tempChars) < String(smallestString) {
                smallestString = tempChars
            }
        }
    }
    
    return String(smallestString)
}

// Helper function to rotate an array to the right
func rotate<T>(_ array: [T], by k: Int) -> [T] {
    guard !array.isEmpty else { return array }
    
    let n = array.count
    let effectiveShift = k % n
    
    // No rotation needed
    guard effectiveShift > 0 else { return array }
    
    // Perform rotation
    return Array(array[(n-effectiveShift)...] + array[..<(n-effectiveShift)])
}
