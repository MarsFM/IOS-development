import UIKit

//let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
//let dateComponents = DateComponents(calendar: calendar, year: 2018, month: 10, day: 10)
//let date = calendar.date(from: dateComponents)!
//
//let tuppleDate = calendar.dateComponents([.year, .month, .day], from: date)
//tuppleDate.day
//tuppleDate.year
//tuppleDate.month
//
//calendar.date(byAdding: dateComponents, to: date)
//
//
//let formatter = DateFormatter()
//formatter.dateFormat = "Q"
//Int(formatter.string(from: Date())) // 1


let date = Date() // 2018-10-10T10:00:00+00:00
let calendar = Calendar.current

var beginningOfMonth: Date?

// OK
let dateComponents = calendar.dateComponents([.year, .month], from: date)
beginningOfMonth = calendar.date(from: dateComponents)

// Better
beginningOfMonth = calendar.dateInterval(of: .month, for: date)?.start
