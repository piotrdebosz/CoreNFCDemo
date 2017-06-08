//
//  NFCManager.swift
//  NFCDemo
//
//  Created by Piotr Dębosz on 07/06/2017.
//  Copyright © 2017 Applicator. All rights reserved.
//

import Foundation
import CoreNFC

class NFCManager: NSObject {
    private var session: NFCNDEFReaderSession?
    
    private let didDetectTag: (NFCNDEFMessage) -> Void
    private let didInvalidateWithError: (Error) -> Void
    
    init(didDetectTag: @escaping (NFCNDEFMessage) -> Void, didInvalidateWithError: @escaping (Error) -> Void) {
        self.didDetectTag = didDetectTag
        self.didInvalidateWithError = didInvalidateWithError
        
        super.init()
    }
    
    func startLookingForTag() {
        // Every time we want to show NFC dialog we need to create new reader session
        self.session = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        self.session?.begin()
    }
}

extension NFCManager: NFCNDEFReaderSessionDelegate {
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        self.didInvalidateWithError(error)
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        for message in messages {
            self.didDetectTag(message)
        }
    }
}
