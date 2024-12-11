// Leetcode 2779. Maximum Beauty of an Array After Applying Operation


// sliding window pattern (AI generated)
func maximumBeauty(_ nums: [Int], _ k: Int) -> Int {
    let sortedArray = nums.sorted()
    var maxBeauty = 0
    var left = 0

    for right in 0..<sortedArray.count {
        while sortedArray[right] - sortedArray[left] > 2 * k {
            left += 1
        }
        maxBeauty = max(maxBeauty, right - left + 1)
    }

    return maxBeauty
}

// wrong approch (Failed attempt by me)
func maximumBeauty1(_ nums: [Int], _ k: Int) -> Int {
    var sortedArray: [Int] = nums.sorted()
    
    var range = [1, nums.count - 1]
    
    for i in range {
        if sortedArray.contains(sortedArray[i] - k) {
            sortedArray[i] = sortedArray[i] - k
        }
        if sortedArray.contains(sortedArray[i] + k) {
            sortedArray[i] = sortedArray[i] + k
        }
    }
    var d: [Int: Int] = [:]
    
    for i in 0..<sortedArray.count {
        if let element = d[sortedArray[i]] {
            d[sortedArray[i]] = element + 1
        } else {
            d[sortedArray[i]] = 1
        }
    }
    
    if let maxCount = d.values.max() {
        return maxCount
    } else {
        print("The dictionary is empty")
    }
    

    return 0 
}
