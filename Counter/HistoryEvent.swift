//
//  HistoryEvent.swift
//  Counter
//
//  Created by Никита Анохин on 20.04.2024.
//

import Foundation

class HistoryEvent {
    let date : Date
    let type : EventType
    
    init(date: Date, type: EventType) {
        self.date = date
        self.type = type
    }
}

enum EventType : String {
    case increment = "значение изменено на +1"
    case decrement = "значение изменено на -1"
    case failedDecrement = "попытка уменьшить значение счётчика ниже 0"
    case reset = "значение сброшено"
}
