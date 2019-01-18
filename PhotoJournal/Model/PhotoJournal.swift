//
//  PhotoJournal.swift
//  PhotoJournal
//
//  Created by Diego Estrella III on 1/15/19.
//  Copyright © 2019 Diego Estrella III. All rights reserved.
//

import Foundation

struct PhotoJournal: Codable {
    let createdAt: String
    let imageData: Data
    let descritpion: String
}
