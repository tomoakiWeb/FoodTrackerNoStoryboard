//
//  MealTableViewController.swift
//  deleteStoryboard
//
//  Created by 三浦　知明 on 2020/01/03.
//  Copyright © 2020 三浦　知明. All rights reserved.
//

import UIKit

class MealTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var meals = [Meal]()
    
    private func loadSampleMeals() {
        let photo1 = #imageLiteral(resourceName: "meal1")
        let photo2 = #imageLiteral(resourceName: "meal2")
        let photo3 = #imageLiteral(resourceName: "meal3")
        
        guard let meal1 = Meal(name: "Tomato salad", photo: photo1, rating: 4) else {
            fatalError("Unable to instantiate meal")
        }
        guard let meal2 = Meal(name: "Steak", photo: photo2, rating: 5) else {
            fatalError("Unable to instantialte meal2")
        }

        guard let meal3 = Meal(name: "Spaghetti", photo: photo3, rating: 3) else {
            fatalError("Unable to instantialte meal3")
        }
        
        meals += [meal1,meal2,meal3]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleMeals()
        view.backgroundColor = .white
        let tableView = UITableView(frame: view.frame, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MealTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(MealTableViewCell.self))
        self.view.addSubview(tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(MealTableViewCell.self), for: indexPath) as? MealTableViewCell else {
            fatalError("The dequeued cell is not instance of MealTableViewCell")
        }
        let meal = meals[indexPath.row]
        cell.namelabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
