# Find Islands — Swift

## Problem

Given an `n x m` binary grid `A`, count the number of **distinct islands** — connected groups of `1`s (land) surrounded by `0`s (water). Cells are connected horizontally or vertically.

---

## Original Code Issues

| # | Issue | Description |
|---|-------|-------------|
| 1 | Wrong guard condition | `n >= 1` checks rows but never validates `m >= 1` for columns |
| 2 | `else if` instead of `if` | Vertical neighbors are only checked when no right neighbor exists — both directions must be checked independently |
| 3 | Flawed island logic | Counting adjacent `1` pairs does not correctly identify distinct islands — a single large island would be counted multiple times |

---

## Fixed Implementation

```swift
func findIslands(rows n: Int, cols m: Int, A: [[Int]]) -> Int {
    guard n >= 1 && m >= 1 else { return 0 }

    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var numOfIslands = 0

    func dfs(_ i: Int, _ j: Int) {
        guard i >= 0, i < n, j >= 0, j < m,
              !visited[i][j], A[i][j] == 1 else { return }

        visited[i][j] = true

        dfs(i + 1, j)
        dfs(i - 1, j)
        dfs(i, j + 1)
        dfs(i, j - 1)
    }

    for i in 0..<n {
        for j in 0..<m {
            if A[i][j] == 1 && !visited[i][j] {
                dfs(i, j)
                numOfIslands += 1
            }
        }
    }

    return numOfIslands
}
```

---

## How It Works

1. **Iterate** over every cell in the grid
2. When an unvisited `1` is found, **increment** the island counter
3. **DFS flood-fill** marks all connected `1`s (up/down/left/right) as visited
4. Any subsequent `1`s belonging to the same landmass are skipped — already visited

---

## Complexity

| | Complexity |
|---|---|
| **Time** | `O(n × m)` — each cell is visited at most once |
| **Space** | `O(n × m)` — for the `visited` matrix + DFS call stack |

---

## Example

```
Grid:
1 1 0
0 0 1
0 1 1
```

```swift
findIslands(rows: 3, cols: 3, A: [[1,1,0],[0,0,1],[0,1,1]])
// → 2
```

**Island 1** → cells `(0,0)` and `(0,1)`  
**Island 2** → cells `(1,2)`, `(2,1)`, and `(2,2)`

---

## Edge Cases

| Input | Output | Reason |
|-------|--------|--------|
| All `0`s | `0` | No land cells |
| All `1`s | `1` | Entire grid is one connected island |
| Single cell `[[1]]` | `1` | One island |
| Empty grid (`n=0`) | `0` | Guard clause returns early |
