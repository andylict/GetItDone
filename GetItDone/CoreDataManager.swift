//
//  CoreDataManager.swift
//  GetItDone
//
//  Created by Andy Li on 12/1/18.
//  Copyright © 2018 Andy Li. All rights reserved.
//

import CoreData

struct CoreDataManager {
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "GetItDone")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("loading of store failed: \(error)")
            }
        }
        return container
    }()
    
    func createToDo(id: Double, title: String, status: Bool) {
        let context = persistentContainer.viewContext
        let toDo = NSEntityDescription.insertNewObject(forEntityName: "ToDo", into: context)
        
//        let id = 1
//        let title = "Let's do this"
//        let status = false
        
        toDo.setValue(id, forKey: "id")
        toDo.setValue(title, forKey: "title")
        toDo.setValue(status, forKey: "status")
        
        do {
            try context.save()
        } catch let err {
            print("failed to save context with new toDo:", err)
        }
    }
    
    // load toDo as a list, because listData in ListController is [] 
    func fetchToDos() -> [ToDo] {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ToDo>(entityName: "ToDo") // fetch ToDo and return as list
        
        do {
            let toDos = try context.fetch(fetchRequest)
            return toDos
        } catch let err {
            print("failed to save context with new toDo:", err)
            return []
        }
    }
    
    func deleteToDo(id: Double) {
        let context = persistentContainer.viewContext
        // fetch toDos
        let fetchRequest = NSFetchRequest<ToDo>(entityName: "ToDo")
        do {
            let toDos = try context.fetch(fetchRequest)
            // go through the list and find matching id
            // delete target toDo
            toDos.forEach { (fetchedToDo) in
                if fetchedToDo.id == id {
                    context.delete(fetchedToDo)
                }
            }
        } catch let err {
            print("failed to fetch or delete todo from context: ", err)
        }
    }
    
    func fetchToDo(title: String) -> ToDo? {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ToDo>(entityName: "ToDo")
        var toDo: ToDo?
        
        do {
            let toDos = try context.fetch(fetchRequest)
            toDos.forEach { (fetchedToDo) in
                if fetchedToDo.title == title {
                    toDo = fetchedToDo
                }
            }
        } catch let err {
            print("failed to fetch and update todo: ", err)
        }
        return toDo
    }
}
