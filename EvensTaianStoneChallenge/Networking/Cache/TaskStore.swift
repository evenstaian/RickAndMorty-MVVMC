//
//  TaskStore.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 15/08/23.
//

import Foundation

enum TaskStore {
    static func makeCache() {
        let cacheSizeMemory = 10 * 1024 * 1024
        let cache = URLCache(memoryCapacity: cacheSizeMemory, diskCapacity: 0, diskPath: nil)
        URLCache.shared = cache
    }
}
