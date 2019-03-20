import UIKit

// Example 1
var date = Date()
let dateFormatter = DateFormatter()
dateFormatter.dateStyle = .medium
dateFormatter.locale = Locale(identifier: "ru_RU")
dateFormatter.setLocalizedDateFormatFromTemplate("MM-dd-yyyy")
let str = dateFormatter.string(from: date)

// Example 2
let dateStr = "18 Апреля 2319"
let newDateFormatter = DateFormatter()
newDateFormatter.locale = Locale(identifier: "ru_RU")
newDateFormatter.dateStyle = .medium
newDateFormatter.date(from: "MMMM-dd-yyyy")
newDateFormatter.timeStyle = .none
let myDate = newDateFormatter.date(from: dateStr)

// Example 3
let timeInterval = Date().timeIntervalSince1970
let tDateFormatter = DateFormatter()
tDateFormatter.dateFormat = "dd MMMM yyyy HH:mm:ss"
tDateFormatter.locale = Locale(identifier: "ru_RU")
let tDate = Date(timeIntervalSince1970: timeInterval)
let strTDate = tDateFormatter.string(from: tDate)
