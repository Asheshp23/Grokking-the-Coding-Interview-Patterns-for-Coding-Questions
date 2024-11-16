//Given an array of numbers sorted in ascending order and a target sum, find a pair in the array whose sum is equal to the given target.
//
//Write a function to return the indices of the two numbers (i.e. the pair) such that they add up to the given target. If no such pair exists return [-1, -1].
//
//Example 1:
//
//Input: [1, 2, 3, 4, 6], target=6
//Output: [1, 3]
//Explanation: The numbers at index 1 and 3 add up to 6: 2+4=6
//Example 2:
//
//Input: [2, 5, 9, 11], target=11
//Output: [0, 2]
//Explanation: The numbers at index 0 and 2 add up to 11: 2+9=11
//Constraints:
//
//2 <= arr.length <= 104
//-109 <= arr[i] <= 109
//-109 <= target <= 109
//Only one valid answer exists.

func findTwoSumIndicesUsingSorting(_ numbers: [Int], target: Int) -> [Int] {
    var sortedNumbers = numbers.enumerated().map { $0 }  // Store (index, value) pairs
    sortedNumbers.sort { $0.1 < $1.1 }  // Sort based on the value
    
    var start = 0
    var end = sortedNumbers.count - 1
    
    while start < end {
        let sum = sortedNumbers[start].1 + sortedNumbers[end].1
        
        if sum == target {
            return [sortedNumbers[start].0, sortedNumbers[end].0]
        } else if sum < target {
            start += 1
        } else {
            end -= 1
        }
    }
    
    return [-1, -1]
}

func findTwoSumIndicesUsingDictionary(_ numbers: [Int], target: Int) -> [Int] {
    var seenNumbers: [Int: Int] = [:]
    
    for (index, num) in numbers.enumerated() {
        let complement = target - num
        
        if let complementIndex = seenNumbers[complement] {
            return [complementIndex, index]
        }
        
        seenNumbers[num] = index
    }
    
    return [-1, -1]
}

