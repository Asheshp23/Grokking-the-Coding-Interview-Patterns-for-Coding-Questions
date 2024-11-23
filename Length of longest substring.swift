// Given a sorted array of integers, find two numbers that add up to a target
// Example: nums = [2, 7, 11, 15], target = 9
// Output: [0, 1] (because nums[0] + nums[1] = 2 + 7 = 9)


// Sliding Window with Dictionary

func lengthOfLongestSubstring(_ s: String) -> Int {
    let chars = Array(s) // Convert string to array for easier indexing
    var maxLength = 0
    var currentWindow: [Character: Int] = [:] // Character: Index mapping
    var start = 0
    
    for (end, char) in chars.enumerated() {
        // If we find a repeating character, move start pointer
        if let lastSeen = currentWindow[char] {
            start = max(start, lastSeen + 1)
        }
        
        // Update the last position of current character
        currentWindow[char] = end
        
        // Update max length
        maxLength = max(maxLength, end - start + 1)
    }
    
    return maxLength
}
