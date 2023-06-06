//
//  CoreDataTrainingApp.swift
//  CoreDataTraining
//
//  Created by Ashwin A U on 06/06/23.
//

import SwiftUI

@main
struct CoreDataTrainingApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            TempView()
//                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
