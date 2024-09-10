//
//  AIAssistantResponseView.swift
//  AIExpenseAssistant
//
//  Created by Dustin Yang on 8/15/24.
//

import SwiftUI

struct AIAssistantResponseView: View {
    
    let response: AIAssistantResponse
    
    var body: some View {
        switch response.type {
        case .addExpenseLog(let props):
            AddExpenseLogView(props: props)
        case .listExpenses(let logs):
            ListExpensesLogsView(text: response.text, logs: logs)
        case .visualizeExpenses(let chartType, let options):
            VisualizeExpensesLogsView(text: response.text, options: options, chartType: chartType)
        default:
            Text(response.text).frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct AddExpenseLogView: View {
    
    let props: AddExpenseLogViewProperties
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("비용 목록에 추가하기 전에 확인 버튼을 선택해 주시기 바랍니다")
            Divider()
            LogItemView(log: props.log)
            Divider()
            switch props.userConfirmation {
            case .pending:
                if let confirmationCallback = props.confirmationCallback {
                    HStack {
                        Button("확인") {
                            confirmationCallback(true, props)
                        }
                        .buttonStyle(BorderedProminentButtonStyle())
                        
                        Button("취소", role: .destructive) {
                            confirmationCallback(false, props)
                        }
                        .buttonStyle(BorderedProminentButtonStyle())
                        .tint(.red)
                    }
                }
            case .confirmed:
                Button("확인됨") {}
                    .buttonStyle(BorderedProminentButtonStyle())
                    .disabled(true)
                
                Text("지출 목록에 등록했습니다")
            case .cancelled:
                Button("취소", role: .destructive) {}
                    .buttonStyle(BorderedProminentButtonStyle())
                    .tint(.red)
                    .disabled(true)
                
                Text("지출 목록에 등록을 하지 않겠습니다")
            }
        }
    }
}

struct ListExpensesLogsView: View {
    
    let text: String
    let logs: [ExpenseLog]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(text)
            if logs.count > 0 {
                Divider()
                ForEach(logs) {
                    LogItemView(log: $0)
                    Divider()
                }
            }
        }
    }
}

struct VisualizeExpensesLogsView: View {
    
    let text: String
    let options: [Option]
    let chartType: ChartType
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(text)
            if options.count > 0 {
                Divider()
                switch chartType {
                case .pie:
                    PieChartView(options: options)
                        .frame(maxWidth: .infinity, minHeight: 220)
                case .bar:
                    BarChartView(options: options)
                        .frame(maxWidth: .infinity, minHeight: 220)
                }
            }
        }
    }
}


#Preview {
    AIAssistantResponseView(response: .init(text: "Hello", type: .contentText))
}
