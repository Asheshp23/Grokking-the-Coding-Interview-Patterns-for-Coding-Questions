

// Problem Description
//
// You are given a list of transaction logs where each log entry is a space-separated string in the format:
//
// "SenderID ReceiverID Amount"
// SenderID and ReceiverID are non-negative integers with at most 9 digits.
// Amount is a positive integer but is not used for processing.
// Each transaction indicates that SenderID sent some money to ReceiverID.
//
// You need to process the logs and return a list of user IDs (as strings) who have participated in at least threshold number of transactions (either as a sender or a receiver). The output should be sorted in ascending numerical order.

//logs = ["88 99 200", "88 99 300", "99 32 100", "12 12 15"]
// threshold = 2

//Explanation:
//
//User 88 participated in 2 transactions (sent twice to 99).
//User 99 participated in 3 transactions (received twice from 88 and sent once to 32).
//User 32 participated in 1 transaction (received from 99).
//User 12 participated in 1 transaction (self-transaction).
//Only users 88 and 99 meet the threshold of 2 transactions.

// output: ["88", "99"]

//logs = ["123 456 300", "456 789 500", "123 123 100"]
//threshold = 1
//
//["123", "456", "789"]

func processLogs(logs: [String], threshold: Int) -> [String] {
    var transactionLog: [String: Int] = [:]
    
    for log in logs {
        let logComponents = log.split(separator: " ")
        guard logComponents.count == 3 else { continue } // Ensure valid log format
        
        let sender = String(logComponents[0])
        let receiver = String(logComponents[1])
        
        // Validate IDs
        let isValidID: (String) -> Bool = { id in
            if let number = Int(id), id.first != "0" && id.count <= 9 {
                return true
            }
            return false
        }
        guard isValidID(sender), isValidID(receiver) else { continue }
        
        // Update counts for sender and receiver
        transactionLog[sender, default: 0] += 1
        if sender != receiver {
            transactionLog[receiver, default: 0] += 1
        }
    }
    
    // Filter by threshold and sort the result numerically
    return transactionLog
        .filter { $0.value >= threshold }
        .keys
        .sorted { Int($0)! < Int($1)! }
}
