func numberOfGoodPairs(_ arr: [Int]) -> Int {
    var countMap: [Int: Int] = [:]
    var goodPairs = 0
    
    for num in arr {
        if let count = countMap[num] {
            goodPairs += count
        }
        countMap[num, default: 0] += 1
    }
    
    return goodPairs
}

func numberOfGoodPairs(_ arr: [Int]) -> Int {
    var c: [[Int]] = []
    
    for i in 0..<arr.count {
        for j in i+1..<arr.count {
            if arr[i] == arr[j] {
                c.append([i, j])
            }
        }
    }
    
    return c.count
}
