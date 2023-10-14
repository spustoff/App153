//
//  MainViewModel.swift
//  App153
//
//  Created by IGOR on 20/07/2023.
//

import SwiftUI
import CoreData

final class MainViewModel: ObservableObject {
    
    @AppStorage("cars") var cars: [String] = []
    @Published var history: [RentModel] = []

    @Published var isAdd: Bool = false
    @Published var isFavs: Bool = false
    
    func getItems() -> [RentModel] {
        
        switch isFavs {
            
        case true:
            return history.filter{cars.contains($0.tenant ?? "")}
        case false:
            return history
        }
    }
    
    func fetchHistory() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<RentModel>(entityName: "RentModel")

        do {
            
            let persons = try context.fetch(fetchRequest)
            
            self.history = persons
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.history = []
        }
    }
    
    @Published var car: [AddModel] = [
    
        AddModel(name: "Skyline", sum: 1800),
        AddModel(name: "Volcano", sum: 2400),
        AddModel(name: "Sky", sum: 950),
        AddModel(name: "Silver", sum: 2900),
        AddModel(name: "Tornado", sum: 3400),
        AddModel(name: "Racer", sum: 1750)
    ]
    
    @Published var current_car: AddModel?
    @Published var whichCar: String = ""
    @Published var isDetail: Bool = false
    @Published var tenant: String = ""
    @Published var dateTo: Date = Date()
    @Published var dateFrom: Date = Date()
    
    func addToHistory(completion: @escaping () -> (Void)) {
                
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let rent = NSEntityDescription.insertNewObject(forEntityName: "RentModel", into: context) as! RentModel
        
        rent.dateFrom = dateFrom
        rent.dateTo = dateTo
        rent.tenant = tenant
        rent.current_car = current_car?.name

        CoreDataStack.shared.saveContext()
        
        completion()
    }
}

