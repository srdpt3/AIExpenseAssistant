//
//  FunctionArguments.swift
//  AIExpenseAssistant
//
//  Created by Dustin Yang on 8/15/24.
//


import Foundation

struct AddExpenseLogArgs: Codable {
    
    let title: String
    let amount: Double
    let category: String
    let currency: String?
    let date: Date?
}

struct ListExpenseArgs: Codable {
    
    let date: Date?
    let startDate: Date?
    let endDate: Date?
    let category: String?
    let sortOrder: String?
    let quantityOfLogs: Int?
    
    var isDateFilterExists: Bool {
        (startDate != nil && endDate != nil) || date != nil
    }
}

struct VisualizeExpenseArgs: Codable {
    
    let date: Date?
    let startDate: Date?
    let endDate: Date?
    
    let chartType: String
    
    var chartTypeEnum: ChartType {
        ChartType(rawValue: chartType) ?? .pie
    }
    
}
