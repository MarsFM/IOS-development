import UIKit

// Example1
let str = "123 Main St. / (555) 555-1234"

let types: NSTextCheckingResult.CheckingType = [.phoneNumber, .address]
let detector1 = try NSDataDetector(types: types.rawValue)
detector1.enumerateMatches(in: str, options: [], range: NSRange(location: 0, length: str.count)) { result,_,_ in
    if let address = result?.components {
        print(address[NSTextCheckingKey.street])
    }
    print(result?.phoneNumber)
}

// Example2
let string = """
My flight (AA10) is scheduled for tomorrow night from 9 PM PST to 5 AM EST.
I'll be staying at The Plaza Hotel, 768 5th Ave, New York, NY 10019.
You can reach me at 555-555-1234 or me@example.com
"""

let detector = try NSDataDetector(types: NSTextCheckingAllTypes)
let range = NSRange(string.startIndex..<string.endIndex, in: string)
detector.enumerateMatches(in: string,
                          options: [],
                          range: range) { (match, _ , _) in
                            guard let match = match else {
                                return
                            }
                            
                            switch match.resultType {
                            case .date:
                                let date = match.date
                                let timeZone = match.timeZone
                                let duration = match.duration
                                print(date, timeZone, duration)
                            case .address:
                                if let components = match.components {
                                    let name = components[.name]
                                    let jobTitle = components[.jobTitle]
                                    let organization = components[.organization]
                                    let street = components[.street]
                                    let locality = components[.city]
                                    let region = components[.state]
                                    let postalCode = components[.zip]
                                    let country = components[.country]
                                    let phoneNumber = components[.phone]
                                    print(name, jobTitle, organization, street, locality, region, postalCode, country, phoneNumber)
                                }
                            case .link:
                                let url = match.url
                                print(url!)
                            case .phoneNumber:
                                let phoneNumber = match.phoneNumber
                                print(phoneNumber!)
                            case .transitInformation:
                                if let components = match.components {
                                    let airline = components[.airline]
                                    let flight = components[.flight]
                                    print(airline, flight)
                                }
                            default:
                                return
                            }
}
