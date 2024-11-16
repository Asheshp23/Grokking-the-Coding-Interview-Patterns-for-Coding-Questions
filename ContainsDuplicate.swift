import Foundation

func containsDuplicateUsingArray(_ nums: [Int]) -> Bool {
    var seen = Set<Int>()
    
    for num in nums {
        if !seen.insert(num).inserted {
            return true
        }
    }
    
    return false
}

func containsDuplicateUsingSorting(_ nums: [Int]) -> Bool {
    let sortedNums = nums.sorted()
    
    for i in 1..<sortedNums.count {
        if sortedNums[i] == sortedNums[i - 1] {
            return true
        }
    }
    
    return false
}

func containsDuplicateUsingDictionary(_ nums: [Int]) -> Bool {
    var countDict = [Int: Int]()
    
    for num in nums {
        if let count = countDict[num], count > 0 {
            return true
        } else {
            countDict[num] = 1
        }
    }
    
    return false
}

