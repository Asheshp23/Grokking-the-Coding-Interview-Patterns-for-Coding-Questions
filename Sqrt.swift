// Given a non-negative integer x, return the square root of x rounded down to the nearest integer. The returned integer should be non-negative as well.

// You must not use any built-in exponent function or operator. For example, do not use pow(x, 0.5) in C++ or x ** 0.5 in Python. or squareroot in swift

func mySqrt(_ x: Int) -> Int {
    // Handle edge cases for 0 and 1
    if x < 2 {
        return x
    }

    var left = 2
    var right = x / 2

    while left <= right {
        let mid = left + (right - left) / 2
        let midSquared = mid * mid

        if midSquared == x {
            return mid  // Exact match
        } else if midSquared < x {
            left = mid + 1  // Square root must be in the upper half
        } else {
            right = mid - 1  // Square root must be in the lower half
        }
    }

    // The closest integer square root is `right` after the loop ends
    return right
}
