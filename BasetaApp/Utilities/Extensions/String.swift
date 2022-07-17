//
//  String.swift
//  Akelni
//
//  Created by Eman Gaber on 3/17/20.
//  Copyright © 2020 Eman GaberPro. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    
    var localized: String {
        //        return NSLocalizedString(self, comment: "")
                
                var currentMainBundle :Bundle
                //print(MOLHLanguage.currentAppleLanguage())
                
                switch (MOLHLanguage.currentAppleLanguage())
                       {
                           
                       case "ar":
                           let path = Bundle.main.path(forResource: "ar", ofType: "lproj")
                           
                           currentMainBundle = Bundle(path: path!)!
                           
                           return currentMainBundle.localizedString(forKey: self, value:"key not found" , table: nil)
                           
                       case "en":
                           
                           
                           let path = Bundle.main.path(forResource: "en", ofType: "lproj")
                           
                           currentMainBundle = Bundle(path: path!)!
                           
                           return  currentMainBundle.localizedString(forKey: self, value:"key not found" , table: nil)
                           
                           
                       default:
                           let path = Bundle.main.path(forResource: "ar", ofType: "lproj")
                           
                           currentMainBundle = Bundle(path: path!)!
                           
                           currentMainBundle.localizedString(forKey: self, value:"key not found" , table: nil)
                           
                           return   currentMainBundle.localizedString(forKey: self, value:"key not found" , table: nil)
                       }
                       
            }
    
    func localizedMessage(args: [CVarArg]) -> String {
        return String(format: NSLocalizedString(self, comment: ""), arguments: args)
    }
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    
    func removeSecondsFromDateString() -> String {
        if !self.isEmpty {
            let newDateString = self.components(separatedBy: ":")[0 ... 1] // 12:30:00 so returns 12:30
            return newDateString.joined(separator: ":")
        } else {
            return "00:00"
        }
    }
    
    func getDateFormattedWithDayName() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // as this api date format
        let date = dateFormatter.date(from: self) ?? Date()
        
        dateFormatter.dateFormat = "E, d MMM"
        return dateFormatter.string(from: date)
    }
    
    func getDateWithoutTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // as this api date format
        let date = dateFormatter.date(from: self) ?? Date()
        
        dateFormatter.dateFormat = "d MMM yyyy"
        return dateFormatter.string(from: date)
    }
    
//    func changeArabicNumber() -> String {
//        var mytext = self
//        mytext = self.replace("٠", replacement: "0")
//        mytext = self.replace("١", replacement: "1")
//        mytext = self.replace("٢", replacement: "2")
//        mytext = self.replace("٣", replacement: "3")
//        mytext = self.replace("٤", replacement: "4")
//        mytext = self.replace("٥", replacement: "5")
//        mytext = self.replace("٦", replacement: "6")
//        mytext = self.replace("٧", replacement: "7")
//        mytext = self.replace("٨", replacement: "8")
//        mytext = self.replace("٩", replacement: "9")
//        mytext = self.replace(" ", replacement: "")
//
//        return mytext
//    }
    
    func isInt() -> Bool {
        
        if Int(self) != nil {
            return true
        }
        
        return false
    }
    
    func isFloat() -> Bool {
        
        if Float(self) != nil {
            return true
        }
        
        return false
    }
    
    func isDouble() -> Bool {
        
        if Double(self) != nil {
            return true
        }
        
        return false
    }
    
    func capitalizingFirstLetter() -> String? {
        return prefix(1).uppercased() + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter() ?? ""
    }
    
    func trimLeadingZeroes() -> String {
        return self.replacingOccurrences(of: "^0+(?!$)", with: "", options: .regularExpression)
    }
    
    func addingDashes(after: Int) -> String {

          var result = ""

          for (offset, character) in self.enumerated() {

              // don't insert a '-' before the first character,
              // otherwise insert one before every other character.
              if offset != 0 && offset % after == 0 {
                  result.append("-")
              }

              result.append(character)
          }
          return result
      }
}

let maxTextField = 50
let maxAge = 2
let maxPhoneNumber = 11
let minPassword = 8
let maxPassword = 25
let minUsername = 2
let minName = 2
let maxUsername = 40

extension String {
    //=======================================
    // MARK: Specific Entry types validation
    //=======================================
    
    var isValidName: Bool {
        let trimmedString = self.withoutWhitespaces
        if trimmedString.count > 1 { // to have an name with min 3 characters
            let stringSet = CharacterSet(charactersIn: trimmedString)
            var letters = CharacterSet.letters
            letters.insert(charactersIn: "-'@^%$()!#.")
            return letters.isSuperset(of: stringSet)
        }
        return false
    } // isValidName
    
    var isValidUsername: Bool {
        let usernameRegex = "(?<! )[-a-zA-Z' ]{2,26}"
        let usernameTest = NSPredicate(format: "SELF MATCHES %@", usernameRegex)
        return usernameTest.evaluate(with: self) && self.count >= minUsername
    }// isValidUsername
    
    var isValidPassword: Bool {
        //        let passwordRegex = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*[#?!@$%^&*-])[A-Za-z0-9#?!@$%^&*-_.]{\(MinPassword),}$"
        let passwordRegex = "^[A-Za-z0-9#?!@$%^&*-_.]{\(6),}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordTest.evaluate(with: self)
    } // isValidPassword
    
    var isValidEmailAddress: Bool {
        let regex = "([\\w-+]+(?:\\.[\\w-+]+)*@(?:[\\w-]+\\.)+[a-zA-Z]{2,7})"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", regex)
        if emailTest.evaluate(with: self) {
            let name = self.components(separatedBy: "@").first!
            let domain = self.components(separatedBy: "@").last!.components(separatedBy: ".").first!
            return name.isValidUsername && domain.containsAtLeastOneLetter
        }
        return false
    } // isValidEmailAddress
    
    var isValidSaudianMobileNumber: Bool {
//        let mobileNumberRegex = "^[0][1-9]\\d{9}$|^[1-9]\\d{9}"
        if self.isEmpty { return false }
        
        let mobileNumberRegex = "^(05|5)[013456789][0-9]{7}$"
//            "^(009665|9665|\\+9665|05|5)[013456789][0-9]{7}$"

        let mobileNumberTest = NSPredicate(format: "SELF MATCHES %@", mobileNumberRegex)
        return mobileNumberTest.evaluate(with: self.withWesternNumbers)
    } // isValidMobileNumber
    
    var isValidAge: Bool {
        return self.isNumeric && (Int(self) != nil) && (Int(self)! > 0)
    } // isValidAge
    
    var isValidExpirationDateForCard: Bool {
        let regex = "^(0[1-9]|1[0-2])\\/?(([0-9]{4}|[0-9]{2})$)"
        let expTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return expTest.evaluate(with: self)
    }
    
    var isValidCVV: Bool {
        let regex = "^[0-9]{3,4}$"
        let expTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return expTest.evaluate(with: self)
    }
    
    //=======================================
    //MARK: Specific Restrictions validation
    //=======================================
    
    var startsWithArabicCharacter: Bool {
        if let lang = CFStringTokenizerCopyBestStringLanguage(self as CFString, CFRange(location: 0, length: self.count)) {
            let direction = Locale.characterDirection(forLanguage: lang as String)
            return direction == .rightToLeft
        }
        return false
    } // startsWithArabicCharacter
    
    var hasLeadingWhiteSpaces: Bool {
        return self.replacingOccurrences(of: "^\\s+", with: "", options: .regularExpression).count < self.count
    } // hasLeadingWhiteSpaces
    
    var containsAtLeastOneLetter: Bool {
        let alphaNumericRegex = ".*[a-zA-Z]+.*"
        let alphaNumericTest = NSPredicate(format: "SELF MATCHES %@", alphaNumericRegex)
        return alphaNumericTest.evaluate(with: self)
    } // containsAtLeastOneLetter
    
    
    func contains(find: String) -> Bool {
        return self.range(of: find) != nil
        
    }
    func containsIgnoringCase(find: String) -> Bool {
        return self.range(of: find, options: .caseInsensitive) != nil
    }
    
    var isNumeric: Bool {
        let trimmedString = self.withoutWhitespaces
        if trimmedString.count > 1 {
            let stringSet = CharacterSet(charactersIn: self.withWesternNumbers)
            return CharacterSet.decimalDigits.isSuperset(of: stringSet)
        }
        return false
    } // isNumeric
    
    var isAlphaNumeric: Bool {
        let alphaNumericRegex = "^[a-zA-Z0-9]*$"
        let alphaNumericTest = NSPredicate(format: "SELF MATCHES %@", alphaNumericRegex)
        return alphaNumericTest.evaluate(with: self)
    } // isAlphaNumeric
    
    var withWesternNumbers: String {
        var string = self
        let arabic = "٠١٢٣٤٥٦٧٨٩"
        let western = "0123456789"
        for index in 0..<arabic.count {
            let arabicCharacter = arabic[arabic.index(arabic.startIndex, offsetBy: index)]
            let westernCharacter = western[western.index(western.startIndex, offsetBy: index)]
            string = string.replacingOccurrences(of: "\(arabicCharacter)", with: "\(westernCharacter)")
        }
        return string
    } // withWesternNumbers
    
    var withArabicNumbers: String {
        var string = self
        let arabic = "٠١٢٣٤٥٦٧٨٩"
        let western = "0123456789"
        for index in 0..<arabic.count {
            let arabicCharacter = arabic[arabic.index(arabic.startIndex, offsetBy: index)]
            let westernCharacter = western[western.index(western.startIndex, offsetBy: index)]
            string = string.replacingOccurrences(of: "\(westernCharacter)", with: "\(arabicCharacter)")
        }
        return string
    } // withArabicNumbers
    
    var hasArabicCharacters: Bool {
        let alphaNumericRegex = "[\\u0600-\\u06ff]|[\\u0750-\\u077f]|[\\ufb50-\\ufc3f]|[\\ufe70-\\ufefc]"
        let alphaNumericTest = NSPredicate(format: "SELF MATCHES %@", alphaNumericRegex)
        return alphaNumericTest.evaluate(with: self)
    } // hasArabicCharacters
    
    var hasEnglishLetters: Bool {
           let alphaNumericRegex = "[0-9a-zA-Z]+"
           let alphaNumericTest = NSPredicate(format: "SELF MATCHES %@", alphaNumericRegex)
           return alphaNumericTest.evaluate(with: self)
       } // hasEnglishCharacters
    
    var arabicTextWithSpaces: Bool {
        let alphaNumericRegex = "^[ء-يء-ي ]+$"
        let alphaNumericTest = NSPredicate(format: "SELF MATCHES %@", alphaNumericRegex)
        return alphaNumericTest.evaluate(with: self)
    } // hasArabicCharacters
    
   
    var stringWithTwoFloatingNumbers: String {
        let doubleValueOfString = self.double ?? 0.0
        return String(format: "%.2f", doubleValueOfString)
    }
    
    var withoutNumbers: String {
        let words = self.components(separatedBy: CharacterSet.decimalDigits)
        let trimmedString = words.joined()
        return trimmedString
    } // withoutNumbers
    
    var withoutWhitespaces: String {
        let words = self.components(separatedBy: CharacterSet.whitespacesAndNewlines)
        let trimmedString = words.joined()
        return trimmedString
    } // withoutWhitespaces
    
    var withoutSpecialCharacters: String {
        var alphaNumericCharacters = CharacterSet.alphanumerics
        alphaNumericCharacters.formUnion(CharacterSet.whitespacesAndNewlines)
        let symbolCharacters = alphaNumericCharacters.inverted
        let words = self.components(separatedBy: symbolCharacters)
        let trimmedString = words.joined()
        return trimmedString
    } // withoutSpecialCharacters
    
    var hasAtLeastOneLetter: Bool {
        return !self.components(separatedBy: CharacterSet.letters.inverted).joined().isEmpty
    } // hasAtLeastOneLetter
    
    func hasNumberOfLetters(_ count: Int) -> Bool {
        return self.components(separatedBy: CharacterSet.letters.inverted).count == count
    } // hasNumberOfLetters
    
    func removingOccurrences(of stringToRemove: String) -> String {
        return self.replacingOccurrences(of: stringToRemove, with: "")
    } // removingOccurrences
    
    var detectDate: Date? {
        return (try? NSDataDetector(types: NSTextCheckingAllTypes))?.firstMatch(in: self, range: NSRange(0..<count))?.date
    } // detectDate
    
    var detectURL: URL? {
        return (try? NSDataDetector(types: NSTextCheckingAllTypes))?.firstMatch(in: self, range: NSRange(0..<count))?.url
    } // detectURL
    
    func width(withConstraintedHeight height: CGFloat, font: UIFont?) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font ?? .systemFont(ofSize: 14)], context: nil)
        return ceil(boundingBox.width)
    }// width
    
    func height(withConstraintedWidth width: CGFloat, font: UIFont?) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font ?? .systemFont(ofSize: 14)], context: nil)
        return ceil(boundingBox.height)
    } // height
    
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    } // trimmed
    
    func attributedStringWithColor(_ strings: [String],defaultColor: UIColor, color: UIColor, characterSpacing: UInt? = nil) -> NSMutableAttributedString {
         let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: defaultColor, range: NSRange(location: 0, length: attributedString.length))

         for string in strings {
             let range = (self as NSString).range(of: string)
             attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
         }

         guard let characterSpacing = characterSpacing else {return attributedString}

         attributedString.addAttribute(NSAttributedString.Key.kern, value: characterSpacing, range: NSRange(location: 0, length: attributedString.length))

         return attributedString
     }
    
    func addDashAtBeginning() -> String {
        var newString = ""
        if !self.isEmpty {
            newString = " - " + self
        }
        return newString
    }
}

extension StringProtocol {
var double: Double? {
       return Double(self)
   }
   var float: Float? {
       return Float(self)
   }
   var integer: Int? {
       return Int(self)
   }
}
