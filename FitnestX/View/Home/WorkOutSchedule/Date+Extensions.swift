//
//  Date+Extensions.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-08-11.
//

import SwiftUI

extension Date {
    
    enum WeekDirection {
          case previous
          case current
          case next
      }
    
    
    //Custom Date Formatter
    
    func format(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
    
    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    var isSameHour: Bool {
        return Calendar.current.compare(self, to: .init(), toGranularity: .hour) == .orderedSame
    }
    
    var isPastHour: Bool {
        return Calendar.current.compare(self, to: .init(), toGranularity: .hour) == .orderedAscending
    }
    
    func fetchWeek(for direction: WeekDirection = .current, from date: Date = .init()) -> [WeekDay] {
        let calender = Calendar.current
        var startOfWeek: Date
        
        //Calculate Start, Current , Previous Weeks
        
        switch direction {
        case .previous:
            if let interval =  calender.dateInterval(of: .weekOfMonth, for: date){
                startOfWeek = interval.start.addingTimeInterval(-7 * 24 * 60 * 60)
                
            }else{
                startOfWeek = date.addingTimeInterval(-7 * 24 * 60 * 60)
            }
        case .next:
            if let interval =  calender.dateInterval(of: .weekOfMonth, for: date){
                startOfWeek = interval.start.addingTimeInterval(7 * 24 * 60 * 60)
                
            }else{
                startOfWeek = date.addingTimeInterval(7 * 24 * 60 * 60)
            }
        case .current:
            if let interval =  calender.dateInterval(of: .weekOfMonth, for: date){
                startOfWeek = interval.start
                
            }else{
                startOfWeek = calender.startOfDay(for: date)
            }
        }
        var week: [WeekDay] = []
        (0..<7).forEach { index in
            if let weekDay = calender.date(byAdding: .day, value: index, to: startOfWeek){
                week.append(.init(date: weekDay))
            }
        }
        return week
    }
    
    struct WeekDay: Identifiable {
        var id: UUID = .init()
        var date: Date
    }
}
