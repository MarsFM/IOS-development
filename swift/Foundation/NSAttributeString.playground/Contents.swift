import UIKit

// NSAttributedString by example
// link: - https://www.hackingwithswift.com/articles/113/nsattributedstring-by-example


var quote = "hello";

let font: UIFont = UIFont.systemFont(ofSize: 20)
let paragraphStyle = NSMutableParagraphStyle()
paragraphStyle.alignment = .center
paragraphStyle.firstLineHeadIndent = 5.0
let shadow = NSShadow()
shadow.shadowColor = UIColor.red
shadow.shadowBlurRadius = 5

let attributes = [
    NSAttributedString.Key.font: font,
    NSAttributedString.Key.foregroundColor: UIColor.green,
    NSAttributedString.Key.shadow: shadow,
    NSAttributedString.Key.paragraphStyle: paragraphStyle
]
let attributedQuote = NSAttributedString(string: quote, attributes: attributes)

//attributedQuote.attributedSubstring(from: NSRange(location: 1, length: 3)) // SubString

let otherAttributedQuote = NSMutableAttributedString(string: quote)
otherAttributedQuote.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.red], range: NSRange(location: 0, length: 3))

let quote2 = "Haters gonna hate"
let firstAttributes: [NSAttributedString.Key: Any] = [.backgroundColor: UIColor.green, NSAttributedString.Key.kern: 10]
let secondAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
//
let firstString = NSMutableAttributedString(string: "Haters ", attributes: firstAttributes)
let secondString = NSAttributedString(string: "gonna ", attributes: secondAttributes)
let thirdString = NSAttributedString(string: "hate")

firstString.append(secondString)
firstString.append(thirdString)
firstString

let sentence = "the cat sat on the mat"
let regularAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]
let largeAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24)]
let attributedSentence = NSMutableAttributedString(string: sentence, attributes: regularAttributes)

attributedSentence.setAttributes(largeAttributes, range: NSRange(location: 0, length: 3))
attributedSentence.setAttributes(largeAttributes, range: NSRange(location: 8, length: 3))
attributedSentence.setAttributes(largeAttributes, range: NSRange(location: 15, length: 3))


let attributedString = NSMutableAttributedString(string: "Want to learn iOS? You should visit the best source of free iOS tutorials!")
attributedString.addAttribute(.link, value: "https://www.hackingwithswift.com", range: NSRange(location: 19, length: 55))

