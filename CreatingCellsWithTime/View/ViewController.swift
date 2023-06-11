//
//  ViewController.swift
//  CreatingCellsWithTime
//
//  Created by Rafael Oliveira on 09/06/23.
//

import UIKit

class ViewController: UIViewController {
    let eventList: [EventModel] = [
        EventModel(title: "Daily", timeInitial: "08:30", timeDetail: "08:30 - 08:45 am", timeAMorPM: "AM", Color: UIColor.red, img: UIImage(resource: .dev)),
        EventModel(title: "Reunião com Time de Design", timeInitial: "10:00", timeDetail: "10:00 - 10:30 am", timeAMorPM: "AM", Color: UIColor.purple, img: UIImage(resource: .thinking)),
        EventModel(title: "Reunião com Thiago", timeInitial: "11:20", timeDetail: "11:20 - 12:00 pm", timeAMorPM: "PM", Color: UIColor.purple, img:UIImage(resource: .avatar)),
        EventModel(title: "Encontro com o comitê", timeInitial: "14:00", timeDetail: "14:00 - 16:00 pm", timeAMorPM: "PM", Color: UIColor.systemYellow, img: UIImage(resource: .thinking)),
        EventModel(title: "Fim do Expediente", timeInitial: "17:00", timeDetail: "17:00 - 08:00 pm", timeAMorPM: "PM", Color: UIColor.green, img: UIImage(resource: .ghost)),
    ]

    let table: UITableView = {
        let table = UITableView()
        table.register(DetailCellWithTLeftTime.self, forCellReuseIdentifier: "cell")
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setup()
        constraintsConfig()
        table.delegate = self
        table.dataSource = self
        title = "Seus eventos"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setup() {
        view.addSubview(table)
    }
    
    private func constraintsConfig() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: safeArea.topAnchor),
            table.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DetailCellWithTLeftTime
        let data = eventList[indexPath.row]
        cell.leftTextLabel.text = data.timeInitial
        cell.leftDetailTextLabel.text = data.timeAMorPM
        cell.eventTextLabel.text = data.title
        cell.eventDetailTextLabel.text = data.timeDetail
        cell.cardViewBackground.backgroundColor = data.Color.withAlphaComponent(0.2)
        cell.circleAvatar.backgroundColor = data.Color
        cell.avatarImg.image = data.img
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
}

