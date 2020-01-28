//
//  AddDisplay.swift
//  reworked
//
//  Created by Дмитрий on 24.12.2019.
//  Copyright © 2019 Дмитрий. All rights reserved.
//

import UIKit

protocol AddDisplayTVCDelegate: class {
    func addDataInArray(data: (dateAsDate: Date, date: String, metroRides: Int, tatRides: Int))
    func updateValues()
}

class AddDisplayTVC: UITableViewController {
    
    weak var mainTVCdelegate: AddDisplayTVCDelegate?
    
    @IBOutlet weak var cancelButtonOutlet: UIButton!
    @IBOutlet weak var addButtonOutlet: UIButton!
    @IBOutlet weak var metroOutlet: UITextField!
    @IBOutlet weak var tatOutlet: UITextField!
    @IBOutlet weak var datePickerOutlet: UIDatePicker!
    
    // внутри метода выставляется закругление для кнопок.
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelButtonOutlet.layer.cornerRadius = 10
        addButtonOutlet.layer.cornerRadius = 10
    }
    
    // назначет firstResponder текстфилду
    override func viewWillAppear(_ animated: Bool) {
        metroOutlet.becomeFirstResponder()
    }
    
    // при нажатии на кнопку добавления значения из аутлетов попадают в переменную в виде кортежа. Вызывается метод добавления данных в массив, хранящий поездки, передавая параметры для заполнения. Контроллер скрывается с помощью dismiss.
    @IBAction func addButton(_ sender: Any) {
        let collectedData = collectDataFromOutlets()
        mainTVCdelegate?.addDataInArray(data: collectedData)
        dismiss(animated: true) {self.mainTVCdelegate?.updateValues()}
    }

    // по нажатию на кнопку cancel контроллер просто закрывается через dismiss
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // метод, собирающий данные из TextField ов, и возвращающий их кортежем.
    func collectDataFromOutlets() -> (dateAsDate: Date, date: String, metroRides: Int, tatRides: Int) {
        let dateAsDate = datePickerOutlet.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateText = dateFormatter.string(from: dateAsDate)
        let metroRides = Int(metroOutlet.text ?? "0") ?? 0
        let tatRides = Int(tatOutlet.text ?? "0") ?? 0
        return (dateAsDate, dateText, metroRides, tatRides)
    }
    
    // метод для перехода в TableViewController: AddDisplayTVC, возвращающий AddDisplayTVC
    static func storyboardInstance() -> AddDisplayTVC? {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyboard.instantiateInitialViewController() as? AddDisplayTVC
    }
    
}
