//
//  DatabaseManager.swift
//  AIExpenseAssistant
//
//  Created by Dustin Yang on 8/6/24.
//

import Foundation
import FirebaseFirestore

class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private init() {}
    
    private (set) lazy var logsCollection: CollectionReference = {
        Firestore.firestore().collection("logs")
    }()
    
    func add(log: ExpenseLog) throws {
        try logsCollection.document(log.id).setData(from: log)
    }
    
    func update(log: ExpenseLog) {
        logsCollection.document(log.id).updateData([
            "name": log.name,
            "amount": log.amount,
            "category": log.category,
            "date": log.date
        ])
    }
    
    func delete(log: ExpenseLog) {
        logsCollection.document(log.id).delete()
    }
    
}
