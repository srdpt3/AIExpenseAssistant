//
//  ExpenseReceiptScannerView.swift
//  AIExpenseAssistant
//
//  Created by Dustin Yang on 9/7/24.
//

import SwiftUI
import AIReceiptScanner

struct ExpenseReceiptScannerView: View {
    
    @State var scanStatus: ScanStatus = .idle
    @State var addReceiptToExpenseSheetItem: SuccessScanResult?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ReceiptPickerScannerView(apiKey: apiKey, scanStatus: $scanStatus)
            .sheet(item: $addReceiptToExpenseSheetItem) {
                AddReceiptToExpenseConfirmationView(vm: .init(scanResult: $0))
                    .frame(minWidth: horizontalSizeClass == .regular ? 960 : nil, minHeight: horizontalSizeClass == .regular ? 512 : nil)
            }
            .navigationTitle("AI 영수증스캐너")
            #if !os(macOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    if let scanResult = scanStatus.scanResult {
                        Button {
                            addReceiptToExpenseSheetItem = scanResult
                        } label: {
                            #if os(macOS)
                            HStack {
                                Image(systemName: "plus")
                                    .symbolRenderingMode(.monochrome)
                                    .tint(.accentColor)
                                Text("Add to Expesnes")
                            }
                            #else
                            Text("지출 추가")
                            #endif
                        }
                    }
                }
            }
    }
}
