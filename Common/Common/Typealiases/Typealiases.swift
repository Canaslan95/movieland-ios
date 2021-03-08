//
//  Typealiases.swift
//  Common
//
//  Created by Cenker Irmak on 7.03.2021.
//

import Foundation

public typealias VoidHandler = (() -> Void)
public typealias BoolHandler = ((Bool) -> Void)
public typealias StringHandler = ((String) -> Void)
public typealias IntHandler = ((Int) -> Void)
public typealias DoubleHandler = ((Double) -> Void)
public typealias AnyHandler = ((Any?) -> Void)

public typealias VoidFunction = (@escaping () -> Void) -> Void
public typealias BoolFunction = (@escaping (Bool) -> Void) -> Void
public typealias DeciderFunction = (() -> Bool)
