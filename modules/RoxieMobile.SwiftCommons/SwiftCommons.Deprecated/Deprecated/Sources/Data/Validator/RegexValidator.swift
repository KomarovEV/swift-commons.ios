// ----------------------------------------------------------------------------
//
//  RegexValidator.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2016, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

// Regex in Swift
// @link http://benscheirman.com/2014/06/regex-in-swift/

// ----------------------------------------------------------------------------

@available(*, deprecated)
public class RegexValidator: Validator
{
// MARK: - Construction

    @available(*, deprecated)
    public init?(_ pattern: String, options: NSRegularExpression.Options = .caseInsensitive)
    {
        // Init instance variables
        self.regex = try? NSRegularExpression(pattern: pattern, options: options)

        // Validate instance
        if pattern.isEmpty || (self.regex == nil) {
            return nil
        }
    }

// MARK: - Methods

    @available(*, deprecated)
    public func isValid(_ value: Any?) -> Bool {
        var result = false

        // Validate incoming value
        if let str = (value as? String) {
            let matches = self.regex.matches(in: str, options: [], range: NSMakeRange(0, str.length))
            result = (matches.count > 0)
        }

        // Done
        return result
    }

// MARK: - Variables

    private let regex: NSRegularExpression!
}

// ----------------------------------------------------------------------------
