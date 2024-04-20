//
//  ViewController.swift
//  Counter
//
//  Created by Никита Анохин on 19.04.2024.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var counterUILabel: UILabel!
    
    @IBOutlet weak var counterIncrementUIButton: UIButton!
    
    @IBOutlet weak var counterDecrementUIButton: UIButton!
    
    @IBOutlet weak var historyEventsUITextView: UITextView!
    
    @IBOutlet weak var resetUIButton: UIButton!
    
    private var events : [HistoryEvent] = []
    
    private var score : Int = 0
    
    var dateFormatter:  DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterUILabel.text = "0"
        counterIncrementUIButton.setTitle("+1", for: .normal)
        counterDecrementUIButton.setTitle("-1", for: .normal)
        
        resetUIButton.setTitle("Обнулить", for: .normal)
        
        counterIncrementUIButton.backgroundColor = .red
        counterDecrementUIButton.backgroundColor = .blue
        
        historyEventsUITextView.text = ""
        historyEventsUITextView.isEditable = false
    }
    
    @IBAction func counterIncrementUIButtonDidTap(_ sender: UIButton) {
        score += 1
        let historyEvent = HistoryEvent(date: Date.now, type: .increment)
        updateScore(with: historyEvent)
    }
    
    @IBAction func counterDecrementUIButtonDidTap(_ sender: UIButton) {
        let historyEvent : HistoryEvent
        if score > 0 {
            score -= 1
            historyEvent = HistoryEvent(date: Date.now, type: .decrement)
        } else {
            historyEvent = HistoryEvent(date: Date.now, type: .failedDecrement)
        }
        updateScore(with: historyEvent)
    }
    
    @IBAction func resetCounterUIButtonDidTap(_ sender: UIButton) {
        score = 0
        let historyEvent = HistoryEvent(date: Date.now, type: .reset)
        updateScore(with: historyEvent)
    }
    
    private func updateScore(with event : HistoryEvent) {
        let textCounter = "Значение счетчика : "
        counterUILabel.text = textCounter + String(score)
        print("LOG UPDATE new score : \(score)")
        events.append(event)
        var text : String = ""
        for event in events {
            text += "[\(dateFormatter.string(from: event.date))]: \(event.type.rawValue)\n"
        }
        historyEventsUITextView.text = text
        historyEventsUITextView.contentOffset = CGPoint(x: 0, y: historyEventsUITextView.contentSize.height - historyEventsUITextView.frame.size.height)
    }

}

