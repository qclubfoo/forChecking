//
//  DaysTableViewController.swift
//  RidesCount
//
//  Created by admin on 19/12/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class DaysTableViewController: UITableViewController, AddDayDelegate, EditItemDelegate, OrdinaryCellDelegate {
    
    var daysForDisplay: RidesArray
    
    func editValue(metroRides: Int, tatRides: Int, index: Int) {
        daysForDisplay.ridesArray[index].metroRide += metroRides
        daysForDisplay.ridesArray[index].tatRide += tatRides
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueAddNewItem") {
            guard let refToAddItemTVC = segue.destination as? AddItemTableViewController else { return }
            refToAddItemTVC.delegate = self
        }
        if let cell = sender as? OrdinaryTableViewCell {
            if let index = tableView.indexPath(for: cell)?.row {
                if (segue.identifier == "segueToEdit") {
                    guard let refToEditItemVC = segue.destination as? EditItemTableViewController else { return }
                    refToEditItemVC.date = daysForDisplay.ridesArray[index].date
                    refToEditItemVC.metro = daysForDisplay.ridesArray[index].metroRide
                    refToEditItemVC.tat = daysForDisplay.ridesArray[index].tatRide
                    refToEditItemVC.index = index
                    refToEditItemVC.delegate = self
                }
            }
        }
    }
    
    func addNewValue(date: String, metro: Int, tat: Int) {
        
        let newRowIndex = daysForDisplay.ridesArray.count
        if newRowIndex == 0 {
            daysForDisplay.addNewDay()
            daysForDisplay.ridesArray[newRowIndex].date = date
            daysForDisplay.ridesArray[newRowIndex].metroRide = metro
            daysForDisplay.ridesArray[newRowIndex].tatRide = tat
            let indexPath = IndexPath(row:newRowIndex, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
        for i in 0 ..< newRowIndex {
            if daysForDisplay.ridesArray[i].date == date {
                daysForDisplay.ridesArray[i].metroRide = metro + daysForDisplay.ridesArray[i].metroRide
                daysForDisplay.ridesArray[i].tatRide = tat + daysForDisplay.ridesArray[i].tatRide
                tableView.reloadData()
                break
            } else if i == newRowIndex - 1 {
                daysForDisplay.addNewDay()
                daysForDisplay.ridesArray[newRowIndex].date = date
                daysForDisplay.ridesArray[newRowIndex].metroRide = metro
                daysForDisplay.ridesArray[newRowIndex].tatRide = tat
                let indexPath = IndexPath(row:newRowIndex, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        }
          navigationController?.popViewController(animated: true)
    }

    /*
     Action по кнопке "+"
     - вычисляется индекс для нового элемента, подсчитывая количество уже существующих в daysForDisplay
     - вызывается метод класса RidesArray для создания одного нового элемента в daysForDisplay
     - Создается let типа IndexPath с номером новой ячейки и номером секции для вставки
     - вызывается метод для вставки ячейки в таблицу.
     */
    @IBAction func addNewCell(_ sender: Any) {
        let newRowIndex = daysForDisplay.ridesArray.count
        daysForDisplay.addNewDay()
        let indexPath = IndexPath(row:newRowIndex, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    /*
     инициализируется переменная содержащая в себе все дни
     */
    required init?(coder aDecoder: NSCoder) {
        daysForDisplay = RidesArray()
        super.init(coder: aDecoder)
        daysForDisplay.ridesArray = getJSON()
    }
   
    /*
     - метод результатом которого является количество ячеек в таблице. В данном случае информация о количестве берется как количество элементов в массиве ridesArray переменной daysForDisplay
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysForDisplay.ridesArray.count
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        daysForDisplay.ridesArray.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    /*
     
     */
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OrdinaryCell", for: indexPath) as? OrdinaryTableViewCell else { return UITableViewCell() }
        cell.delegate = self
        textConfig(for: cell, with: daysForDisplay.ridesArray[indexPath.row])
        return cell
    }
    
    func textConfig(for cell: UITableViewCell, with item: DayItem) {
        guard let ordinaryCell = cell as? OrdinaryTableViewCell else { return }
        ordinaryCell.date.text = item.date
        ordinaryCell.metroCounter.text = String(item.mccRide + item.metroRide)
        ordinaryCell.tatCounter.text = String(item.tatRide)
        ordinaryCell.totalAmount.text = String(item.metroAndMccCost * (item.mccRide + item.metroRide) + item.tatCost * item.tatRide) + " rub."
    }
    
    func didTapButton(in cell: OrdinaryTableViewCell) {
        performSegue(withIdentifier: "segueToEdit", sender: cell)
    }
    
    // parsing JSON from file
    func getJSON() ->  [DayItem] {
        
        if let path = Bundle.main.path(forResource: "newJSON", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let decoder = JSONDecoder()
                let modelArray = try decoder.decode([DayItem].self, from: data) //Decode JSON Response Data
                return modelArray
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        return []
    }
    
}
