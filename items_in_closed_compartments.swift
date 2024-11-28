// ABC would like to know how much inventory exists in their closed inventory compartments. Given a string s consisting of items as "*" and closed compartments as an open and close "|", an array of starting indices startindices, and an array of ending indices endindices, determine the number of items in closed compartments within the substring between the two indices, inclusive.
//  • An item is represented as an asterisk ('*' = ascii decimal 42)
//  • A compartment is represented as a pair of pipes that
//  may or may not have items between them ('|' = ascii
//  decimal 124).
//  Example
//  s = "***|*|*1"
// startindices = [1, 1]
//  endindices = [5, 6]
// The string has a total of 2 closed compartments, one with 2 items and one with 1 item. For the first pair of indices, (1, 5), the substring is '| **|*'. There are 2 items in a compartment.
//  For the second pair of indices, (1, 6), the substring is
//  '|***|' and there are 2 + 1 = 3 items in
// compartments.
//  Both of the answers are returned in an array, [2, 3]



func numberOfItems(s: String, startIndices: [Int], endIndices: [Int]) -> [Int] {
    // Result array to store the counts
    var numberOfItems: [Int] = []
    
    // Convert the string to a character array for easier manipulation
    let chars = Array(s)
    
    // Precompute the positions of the `|` symbols
    var pipeIndices: [Int] = []
    for (index, char) in chars.enumerated() {
        if char == "|" {
            pipeIndices.append(index)
        }
    }
    
    // Iterate through each query range
    for i in 0..<startIndices.count {
        // Convert 1-based indices to 0-based
        let start = startIndices[i] - 1
        let end = endIndices[i] - 1
        
        // Find the first and last `|` within the range
        let validPipes = pipeIndices.filter { $0 >= start && $0 <= end }
        
        if validPipes.count >= 2 {
            // Calculate the number of `*` between the first and last `|`
            let firstPipe = validPipes.first!
            let lastPipe = validPipes.last!
            let substring = chars[firstPipe+1..<lastPipe]
            let starCount = substring.filter { $0 == "*" }.count
            numberOfItems.append(starCount)
        } else {
            // If there are fewer than 2 `|`, no valid items can be counted
            numberOfItems.append(0)
        }
    }
    
    return numberOfItems
}
