//
//  View Model.swift
//  wifi qr code generator app
//
//  Created by bilal on 30/03/2023.
//

import CoreData
import Foundation

class CoreDataViewModel: ObservableObject {
    
    @Published var quoteRecords: [LikedQuotes] = []
    
    private let dataStore = DataStore.shared
    
    init() {
        fetchItems()
    }
    
    func addItem (name: String) {
        
        let context = dataStore.persistentContainer.viewContext
        let newItem = LikedQuotes(context: context)
        newItem.quote = name
       
        
        dataStore.saveContext()
        fetchItems()
        
        if quoteRecords.contains(newItem) {
            print("Item added successfully")
        } else {
            print("Failed to add item")
        }
    }
    
//    func deleteItem(indexSet: IndexSet) {
//        let context = dataStore.persistentContainer.viewContext
//        indexSet.map { quoteRecords[$0] }.forEach(context.delete)
//        dataStore.saveContext()
//        fetchItems()
//    }
    
    func deleteItem(quote: LikedQuotes) {
           let context = dataStore.persistentContainer.viewContext
           context.delete(quote)
           dataStore.saveContext()
       }
    
    func fetchItems() {
        let request: NSFetchRequest<LikedQuotes> = LikedQuotes.fetchRequest()
        do {
            quoteRecords = try dataStore.persistentContainer.viewContext.fetch(request)
        } catch {
            print("Error fetching quoteRecords")
        }
    }
}
