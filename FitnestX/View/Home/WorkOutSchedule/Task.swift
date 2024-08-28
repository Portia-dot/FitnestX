//
//  Task.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-08-11.
//
//


import SwiftUI

struct Task: Identifiable, Codable {
    var id: UUID = .init()
    var taskTitle: String
    var creationDate: Date
    var isCompleted: Bool = false
    var tint: String
    var userId: String
    
    
    enum CodingKeys: String, CodingKey {
            case id
            case taskTitle
            case creationDate
            case isCompleted
            case tint
            case userId
        }
    
    init(id: UUID, taskTitle: String, creationDate: Date, isCompleted: Bool, tint: Color,  userId: String) {
        self.id = id
        self.taskTitle = taskTitle
        self.creationDate = creationDate
        self.isCompleted = isCompleted
        self.tint = tint.toHex()
        self.userId = userId
    }
    
    var color: Color {
           Color(hex: tint)
       }

       // Encoding logic
       func encode(to encoder: Encoder) throws {
           var container = encoder.container(keyedBy: CodingKeys.self)
           try container.encode(id.uuidString, forKey: .id)
           try container.encode(taskTitle, forKey: .taskTitle)
           try container.encode(creationDate, forKey: .creationDate)
           try container.encode(isCompleted, forKey: .isCompleted)
           try container.encode(tint, forKey: .tint)
           try container.encode(userId, forKey: .userId)
       }

       // Decoding logic
       init(from decoder: Decoder) throws {
           let container = try decoder.container(keyedBy: CodingKeys.self)
           let idString = try container.decode(String.self, forKey: .id)
           self.id = UUID(uuidString: idString) ?? UUID()
           self.taskTitle = try container.decode(String.self, forKey: .taskTitle)
           self.creationDate = try container.decode(Date.self, forKey: .creationDate)
           self.isCompleted = try container.decode(Bool.self, forKey: .isCompleted)
           self.tint = try container.decode(String.self, forKey: .tint)
           self.userId = try container.decode(String.self, forKey: .userId)
       }
}


extension Date {
    static func updateHour(_ value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}
extension Color {
    func toHex() -> String {
        let components = UIColor(self).cgColor.components ?? [0, 0, 0, 0]
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        return String(format: "%02lX%02lX%02lX", Int(r * 255), Int(g * 255), Int(b * 255))
    }
}
