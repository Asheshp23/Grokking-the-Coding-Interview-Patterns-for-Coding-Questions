// Given a sorted array of integers, find two numbers that add up to a target
// Example: nums = [2, 7, 11, 15], target = 9
// Output: [0, 1] (because nums[0] + nums[1] = 2 + 7 = 9)

func findTwoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var complementMap: [Int: Int] = [:]
    
    for (index, num) in nums.enumerated() {
        if let complementIndex = complementMap[target - num] {
            return [complementIndex, index]
        }
        complementMap[num] = index
    }
    
    return [] // Return empty array if no solution is found
}

print(findTwoSum([2, 7, 11, 15], 9))
