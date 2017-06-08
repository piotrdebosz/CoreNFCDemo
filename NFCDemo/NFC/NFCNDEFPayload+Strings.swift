//
//  NFCNDEFPayload+Strings.swift
//  NFCDemo
//
//  Created by Piotr Dębosz on 08/06/2017.
//  Copyright © 2017 Applicator. All rights reserved.
//

import CoreNFC

extension String {
    static func fromData(data: Data) -> String? {
        if let string = String(data: data, encoding: .utf8) {
            return string
        }
        
        // For some data in tags I've checked I couldn't get string with utf8 encoding
        if let string = String(data: data, encoding: .ascii) {
            return string
        }
        
        return nil
    }
}

extension NFCNDEFPayload {
    
    // Change payload data to human redeable strings
    func typeNameFormatString() -> String {
        switch self.typeNameFormat {
        case .empty:
            return "NFCTypeNameFormatEmpty"
        case .nfcWellKnown:
            return "NFCTypeNameFormatNFCWellKnown"
        case .media:
            return "NFCTypeNameFormatMedia"
        case .absoluteURI:
            return "NFCTypeNameFormatAbsoluteURI"
        case .nfcExternal:
            return "NFCTypeNameFormatNFCExternal"
        case .unknown:
            return "NFCTypeNameFormatUnknown"
        case .unchanged:
            return "NFCTypeNameFormatUnchanged"
        }
    }
    
    func identifierString() -> String? {
        return String.fromData(data: self.identifier)
    }
    
    func typeString() -> String? {
        return String.fromData(data: self.type)
    }
    
    func payloadString() -> String? {
        return String.fromData(data: self.payload)
    }
}
