// ----------------------------------------------------------------------------
//
//  ImplicitlyUnwrappedOptionalWrapper.swift
//
//  @author     Alexander Bragin <bragin-av@roxiemobile.com>
//  @copyright  Copyright (c) 2017, Roxie Mobile Ltd. All rights reserved.
//  @link       http://www.roxiemobile.com/
//
// ----------------------------------------------------------------------------

public protocol ImplicitlyUnwrappedOptionalWrapper
{
// MARK: - Properties

    var wrappedType: Any.Type { get }
}

// ----------------------------------------------------------------------------

extension ImplicitlyUnwrappedOptional: ImplicitlyUnwrappedOptionalWrapper
{
// MARK: - Properties

    /// Checks if an object is `nil`.
    public var isNone: Bool {
        return self == nil
    }

    @available(*, deprecated, message: "\n• Write a description.")
    public var wrappedType: Any.Type {
        return Wrapped.self
    }
}

// ----------------------------------------------------------------------------
