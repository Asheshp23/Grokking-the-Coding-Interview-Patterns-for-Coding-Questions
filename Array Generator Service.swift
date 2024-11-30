// Your project team needs to work closely with a group of software testers.
// They have requested that your team create an array generator service to assist with testing software functionality.
// Create an array generator service.

// Its input parameters are:
//   1. `arr[]` contains n positive integers.
//   2. `state` is a string that contains n characters:
//       - Each character is '0' or '1'.
//       - If state[i] == '1', arr[i] is available.
//       - If state[i] == '0', arr[i] is blocked.
//   3. `m` is the number of operations to perform.

// To create an integer array, S, the following operation is performed exactly `m` times:
//   - S is initially empty.
//   - Choose any arr[i] that is available (where state[i] == '1'). 
//     The same element can be chosen any number of times.
//   - Append the value in arr[i] to S.
//   - For all state[i] == '0', such that state[i - 1] to '1'.
//     For example, if state = "010101" before the operation, it equals "011011" after the operation.

// Find the lexicographically largest sequence S that can be obtained after `m` operations.

// Notes:
//   - A sequence x of length m is lexicographically larger than sequence y of length m if there exists such j (0 ≤ j < m)
//     such that x[j] > y[j], and for any 0 ≤ i < j, x[i] == y[i].

// Example 1:
// Input:
//   arr = [10, 5, 7, 6]
//   state = "0101"
//   m = 2
// Output: [6, 5]

func arrayGenerator(arr: [Int], state: String, m: Int) -> [Int] {
    var stateArray = Array(state)  // Convert the state string into an array of characters
    var result = [Int]()  // The array to store the lexicographically largest sequence
    
    for _ in 0..<m {
        var maxValue = -1
        var maxIndex = -1
        
        // Find the largest available element in arr based on the state
        for i in 0..<arr.count {
            if stateArray[i] == "1" && arr[i] > maxValue {
                maxValue = arr[i]
                maxIndex = i
            }
        }
        
        // Append the largest available element to the result array
        result.append(maxValue)
        
        // Mark the selected element as blocked by updating the state
        stateArray[maxIndex] = "0"
        
        // Unblock elements where state[i-1] == '1' and state[i] == '0'
        for i in 1..<arr.count {
            if stateArray[i] == "0" && stateArray[i - 1] == "1" {
                stateArray[i] = "1"
            }
        }
    }
    
    return result
}
var arr1 = [9, 8, 7]
var state1 = "110"
var m1 = 3

let arr = [10, 5, 7, 6]
let state = "0101"
let m = 2

print(arrayGenerator(arr: arr, state: state, m: m))  // Expected Output: [6, 5]
print(arrayGenerator(arr: arr1, state: state1, m: m1))
