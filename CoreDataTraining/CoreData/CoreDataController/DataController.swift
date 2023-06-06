//
//  DataController.swift
//  CoreDataTraining
//
//  Created by Ashwin A U on 06/06/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "School")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("core data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
