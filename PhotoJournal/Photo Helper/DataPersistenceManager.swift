//
//  DataPersistenceManager.swift
//  PhotoJournal
//
//  Created by Diego Estrella III on 1/15/19.
//  Copyright © 2019 Diego Estrella III. All rights reserved.
//

import Foundation

final class DataPersistenceManager {
    
    static func documentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    static func filepathToDocumentsDirectory(filename: String) -> URL {
        return documentsDirectory().appendingPathComponent(filename)
    }
}
