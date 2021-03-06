//
//  StringExtension.swift
//  LKFoundation
//
//  Created by zhulinhua on 2018/4/23.
//

import Foundation

public extension String {
    /// Gets the individual characters and puts them in an array as Strings.
    var array: [String] {
        return description.map { String($0) }
    }
    
    /// Returns the Float value
    public var floatValue: Float {
        return NSString(string: self).floatValue
    }
    
    /// Returns the Int value
    public var intValue: Int {
        return Int(NSString(string: self).intValue)
    }
    
    /// Convert self to a Data.
    public var dataValue: Data? {
        return self.data(using: .utf8)
    }
    
    /// Encoded string to Base64.
    public var base64encoded: String {
        guard let data: Data = self.data(using: .utf8) else {
            return ""
        }
        return data.base64EncodedString()
    }
    
    /// Decoded Base64 to string.
    public var base64decoded: String {
        guard let data: Data = Data(base64Encoded: String(self), options: .ignoreUnknownCharacters), let dataString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else {
            return ""
        }
        return String(describing: dataString)
    }
    
    /// Encode self to an encoded url string.
    public var urlEncoded: String? {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)
    }
    
    // MARK: - Functions
    
    /// Returns the lenght of the string.
    public var length: Int {
        return self.count
    }
    
    /// Get the character at a given index.
    ///
    /// - Parameter index: The index.
    /// - Returns: Returns the character at a given index, starts from 0.
    public func character(at index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
    
    /// Returns a new string containing the characters of the String from the one at a given index to the end.
    ///
    /// - Parameter index: The index.
    /// - Returns: Returns the substring from index.
    public func substring(from index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)...])
    }
    
    /// Creates a substring from the given character.
    ///
    /// - Parameter character: The character.
    /// - Returns: Returns the substring from character.
    public func substring(from character: Character) -> String {
        let index: Int = self.index(of: character)
        guard index > -1 else {
            return ""
        }
        return substring(from: index + 1)
    }
    
    /// Returns a new string containing the characters of the String up to, but not including, the one at a given index.
    ///
    /// - Parameter index: The index.
    /// - Returns: Returns the substring to index.
    public func substring(to index: Int) -> String {
        guard index <= self.length else {
            return ""
        }
        return String(self[..<self.index(self.startIndex, offsetBy: index)])
    }
    
    /// Creates a substring to the given character.
    ///
    /// - Parameter character: The character.
    /// - Returns: Returns the substring to character.
    public func substring(to character: Character) -> String {
        let index: Int = self.index(of: character)
        guard index > -1 else {
            return ""
        }
        return substring(to: index)
    }
    
    /// Creates a substring with a given range.
    ///
    /// - Parameter range: The range.
    /// - Returns: Returns the string between the range.
    public func substring(with range: Range<Int>) -> String {
        let start = self.index(self.startIndex, offsetBy: range.lowerBound)
        let end = self.index(self.startIndex, offsetBy: range.upperBound)
        
        return String(self[start..<end])
    }
    
    /// Creates a substring with a given range.
    ///
    /// - Parameter range: The range.
    /// - Returns: Returns the string between the range.
    public func substring(with range: CountableClosedRange<Int>) -> String {
        return self.substring(with: Range(uncheckedBounds: (lower: range.lowerBound, upper: range.upperBound + 1)))
    }
    
    /// Returns the index of the given character.
    ///
    /// - Parameter character: The character to search.
    /// - Returns: Returns the index of the given character, -1 if not found.
    public func index(of character: Character) -> Int {
        if let index: Index = self.index(of: character) {
            return self.distance(from: self.startIndex, to: index)
        }
        return -1
    }
    
    /// Check if self has the given substring in case-sensitiv or case-insensitive.
    ///
    /// - Parameters:
    ///   - string: The substring to be searched.
    ///   - caseSensitive: If the search has to be case-sensitive or not.
    /// - Returns: Returns true if founded, otherwise false.
    public func range(of string: String, caseSensitive: Bool = true) -> Bool {
        return caseSensitive ? (self.range(of: string) != nil) : (self.lowercased().range(of: string.lowercased()) != nil)
    }
    
    /// Check if self has the given substring in case-sensitiv or case-insensitive.
    ///
    /// - Parameters:
    ///   - string: The substring to be searched.
    ///   - caseSensitive: If the search has to be case-sensitive or not.
    /// - Returns: Returns true if founded, otherwise false.
    public func has(_ string: String, caseSensitive: Bool = true) -> Bool {
        return self.range(of: string, caseSensitive: caseSensitive)
    }
    
    /// Returns the number of occurrences of a String into self.
    ///
    /// - Parameter string: String of occurrences.
    /// - Returns: Returns the number of occurrences of a String into self.
    public func occurrences(of string: String, caseSensitive: Bool = true) -> Int {
        var string = string
        if !caseSensitive {
            string = string.lowercased()
        }
        return self.lowercased().components(separatedBy: string).count - 1
    }
    
    /// Conver self to a capitalized string.
    /// Example: "This is a Test" will return "This is a test" and "this is a test" will return "This is a test".
    ///
    /// - Returns: Returns the capitalized sentence string.
    public func sentenceCapitalizedString() -> String {
        guard self.length > 0 else {
            return ""
        }
        let uppercase: String = self.substring(to: 1).uppercased()
        let lowercase: String = self.substring(from: 1).lowercased()
        
        return uppercase + lowercase
    }
    
    /// Returns the last path component.
    public var lastPathComponent: String {
        return NSString(string: self).lastPathComponent
    }
    
    /// Returns the path extension.
    public var pathExtension: String {
        return NSString(string: self).pathExtension
    }
    
    /// Delete the last path component.
    public var deletingLastPathComponent: String {
        return NSString(string: self).deletingLastPathComponent
    }
    
    /// Delete the path extension.
    public var deletingPathExtension: String {
        return NSString(string: self).deletingPathExtension
    }
    
    /// Returns an array of path components.
    public var pathComponents: [String] {
        return NSString(string: self).pathComponents
    }
    
    /// Appends a path component to the string.
    ///
    /// - Parameter path: Path component to append.
    /// - Returns: Returns all the string.
    public func appendingPathComponent(_ path: String) -> String {
        let string = NSString(string: self)
        
        return string.appendingPathComponent(path)
    }
    
    /// Appends a path extension to the string.
    ///
    /// - Parameter ext: Extension to append.
    /// - Returns: Returns all the string.
    public func appendingPathExtension(_ ext: String) -> String? {
        let nsSt = NSString(string: self)
        
        return nsSt.appendingPathExtension(ext)
    }
    
    /// Converts self to an UUID APNS valid (No "<>" or "-" or spaces).
    ///
    /// - Returns: Converts self to an UUID APNS valid (No "<>" or "-" or spaces).
    public func readableUUID() -> String {
        return self.trimmingCharacters(in: CharacterSet(charactersIn: "<>")).replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "")
    }
    
    /// Returns string with the first character uppercased.
    ///
    /// - returns: Returns string with the first character uppercased.
    public func uppercasedFirst() -> String {
        return String(self.prefix(1)).uppercased() + String(self.dropFirst())
    }
    
    /// Returns string with the first character lowercased.
    ///
    /// - returns: Returns string with the first character lowercased.
    public func lowercasedFirst() -> String {
        return String(self.prefix(1)).lowercased() + String(self.dropFirst())
    }
 
    /// Returns the reversed String.
    ///
    /// - parameter preserveFormat: If set to true preserve the String format.
    ///                             The default value is false.
    ///                             **Example:**
    ///                                 "Let's try this function?" ->
    ///                                 "?noitcnuf siht yrt S'tel"
    ///
    /// - returns: Returns the reversed String.
    public func reversed(preserveFormat: Bool) -> String {
        guard !self.isEmpty else {
            return ""
        }
        
        var reversed = String(self.removeExtraSpaces().reversed())
        
        if !preserveFormat {
            return reversed
        }
        
        let words = reversed.components(separatedBy: " ").filter { $0 != "" }
        
        reversed.removeAll()
        for word in words {
            if let char = word.unicodeScalars.last {
                if CharacterSet.uppercaseLetters.contains(char) {
                    reversed += word.lowercased().uppercasedFirst()
                } else {
                    reversed += word.lowercased()
                }
            } else {
                reversed += word.lowercased()
            }
            
            if word != words[words.count - 1] {
                reversed += " "
            }
        }
        
        return reversed
    }
    
    /// Returns true if the String has at least one uppercase chatacter, otherwise false.
    ///
    /// - returns: Returns true if the String has at least one uppercase chatacter, otherwise false.
    public func hasUppercasedCharacters() -> Bool {
        var found = false
        for character in self.unicodeScalars {
            if CharacterSet.uppercaseLetters.contains(character) {
                found = true
                break
            }
        }
        return found
    }
    
    /// Returns true if the String has at least one lowercase chatacter, otherwise false.
    ///
    /// - returns: Returns true if the String has at least one lowercase chatacter, otherwise false.
    public func hasLowercasedCharacters() -> Bool {
        var found = false
        for character in self.unicodeScalars {
            if CharacterSet.lowercaseLetters.contains(character) {
                found = true
                break
            }
        }
        return found
    }
    
    /// Remove double or more duplicated spaces.
    ///
    /// - returns: Remove double or more duplicated spaces.
    public func removeExtraSpaces() -> String {
        let squashed = self.replacingOccurrences(of: "[ ]+", with: " ", options: .regularExpression, range: nil)
        return squashed.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    /// Returns a new string in which all occurrences of a target strings in a specified range of the String are replaced by another given string.
    ///
    /// - Parameters:
    ///   - target: Target strings array.
    ///   - replacement: Replacement string.
    /// - Returns: Returns a new string in which all occurrences of a target strings in a specified range of the String are replaced by another given string.
    public func replacingOccurrences(of target: [String], with replacement: String) -> String {
        var string = self
        for occurrence in target {
            string = string.replacingOccurrences(of: occurrence, with: replacement)
        }
        
        return string
    }
    
    /// Count the number of lowercase characters.
    ///
    /// - Returns: Number of lowercase characters.
    public func countLowercasedCharacters() -> Int {
        var countChar = 0
        for index in 0 ..< self.length {
            guard let character = UnicodeScalar((NSString(string: self)).character(at: index)) else {
                return 0
            }
            let isLowercase = CharacterSet.lowercaseLetters.contains(character)
            if isLowercase {
                countChar += 1
            }
        }
        
        return countChar
    }
    
    /// Count the number of uppercase characters.
    ///
    /// - Returns: Number of uppercase characters.
    public func countUppercasedCharacters() -> Int {
        var countChar = 0
        for index in 0 ..< self.length {
            guard let character = UnicodeScalar((NSString(string: self)).character(at: index)) else {
                return 0
            }
            let isUppercase = CharacterSet.uppercaseLetters.contains(character)
            if isUppercase {
                countChar += 1
            }
        }
        
        return countChar
    }
    
    /// Count the number of numbers.
    ///
    /// - Returns: Number of numbers.
    public func countNumbers() -> Int {
        var countNumber = 0
        for index in 0 ..< self.length {
            guard let character = UnicodeScalar((NSString(string: self)).character(at: index)) else {
                return 0
            }
            let isNumber = CharacterSet(charactersIn: "0123456789").contains(character)
            if isNumber {
                countNumber += 1
            }
        }
        
        return countNumber
    }
    
    /// Count the number of symbols.
    ///
    /// - Returns: Number of symbols.
    public func countSymbols() -> Int {
        var countSymbol = 0
        for index in 0 ..< self.length {
            guard let character = UnicodeScalar((NSString(string: self)).character(at: index)) else {
                return 0
            }
            let isSymbol = CharacterSet(charactersIn: "`~!?@#$€£¥§%^&*()_+-={}[]:\";.,<>'•\\|/").contains(character)
            if isSymbol {
                countSymbol += 1
            }
        }
        
        return countSymbol
    }
    
    /// Convert HEX string (separated by space) to "usual" characters string.
    /// Example: "68 65 6c 6c 6f" -> "hello".
    ///
    /// - Returns: Readable string.
    public func stringFromHEX() -> String {
        var hex = self
        hex = hex.replacingOccurrences(of: " ", with: "")
        var string: String = ""
        while !hex.isEmpty {
            let character: String = String(hex[..<hex.index(hex.startIndex, offsetBy: 2)])
            hex = String(hex[hex.index(hex.startIndex, offsetBy: 2)...])
            var characterInt: UInt32 = 0
            _ = Scanner(string: character).scanHexInt32(&characterInt)
            string += String(format: "%c", characterInt)
        }
        return string
    }
    
    /// Check if self is an email.
    ///
    /// - Returns: Returns true if it is an email, otherwise false.
    public func isEmail() -> Bool {
        let emailRegEx: String = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let regExPredicate: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        return regExPredicate.evaluate(with: self.lowercased())
    }
}
