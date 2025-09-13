//
//  AppLogger.swift
//  Class105
//
//  Created by Weeraphot Bumbaugh on 9/13/25.
//

import os

enum AppLogger {
    private static let logger = Logger(subsystem: "com.yourcompany.Class105", category: "general")

    static func log(_ message: String,
                    file: String = #fileID,
                    function: String = #function,
                    line: Int = #line) {
        #if DEBUG
        logger.log("[\(file):\(line)] \(function) — \(message)")
        #endif
    }
}
