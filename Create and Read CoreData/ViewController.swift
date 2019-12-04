//
//  ViewController.swift
//  Create and Read CoreData
//
//  Created by Home Computer on 04/12/2019.
//  Copyright © 2019 Home Computer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let persistenceManager: PersistenceManager
    init(persistenceManager: PersistenceManager) {
        self.persistenceManager = persistenceManager
        super.init(nibName: nil, bundle: nil)
    
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
             createUser()
             getUsers()
    }
        
        // Create coredata object
        func createUser() {
            let user = User(context: persistenceManager.context)
            user.name = "Andrew"
            
            persistenceManager.save()
        }
    
    
    func getUsers() {
       
       // guard  let users = try! persistenceManager.context.fetch(User.fetchRequest()) as? [User]
        //else { return }

        let users = persistenceManager.fetch(User.self  )
        
        users.forEach({ print($0.name) })
        
        }
    }
    
    


    




