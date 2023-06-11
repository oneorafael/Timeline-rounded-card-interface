//
//  DetailCellWithTLeftTime.swift
//  CreatingCellsWithTime
//
//  Created by Rafael Oliveira on 09/06/23.
//

import UIKit

class DetailCellWithTLeftTime: UITableViewCell {
    let leftTextLabel: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    let leftDetailTextLabel: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .right
        text.font = .systemFont(ofSize: 09, weight: .bold)
        text.textColor = .secondaryLabel
        return text
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondaryLabel.withAlphaComponent(0.5)
        return view
    }()
    
    let cardViewBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemOrange.withAlphaComponent(0.1)
        view.layer.cornerRadius = 35
        view.layer.shadowColor = UIColor.white.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.layer.shadowRadius = 4.0
        view.clipsToBounds = true
        return view
    }()
    
    let circleAvatar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        view.layer.cornerRadius = 25
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 2
        view.clipsToBounds = true
        return view
    }()
    
    var avatarImg: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true

        return img
    }()
    
    let eventTextLabel: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let eventDetailTextLabel: UILabel = {
        let text = UILabel()
        text.textColor = .secondaryLabel
        text.font = .systemFont(ofSize: 09, weight: .light)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(leftTextLabel)
        addSubview(leftDetailTextLabel)
        addSubview(lineView)
        addSubview(cardViewBackground)
        cardViewBackground.addSubview(circleAvatar)
        cardViewBackground.addSubview(eventTextLabel)
        cardViewBackground.addSubview(eventDetailTextLabel)
        circleAvatar.addSubview(avatarImg)
    }
    
    private func configureConstraints(){
        NSLayoutConstraint.activate([
            leftTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            leftTextLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            leftDetailTextLabel.topAnchor.constraint(equalTo: leftTextLabel.bottomAnchor),
            leftDetailTextLabel.leadingAnchor.constraint(equalTo: leftTextLabel.leadingAnchor),
            leftDetailTextLabel.trailingAnchor.constraint(equalTo: leftTextLabel.trailingAnchor),
            
            lineView.centerYAnchor.constraint(equalTo: leftTextLabel.centerYAnchor),
            lineView.leadingAnchor.constraint(equalTo: leftTextLabel.trailingAnchor, constant: 5),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            cardViewBackground.topAnchor.constraint(equalTo: lineView.topAnchor, constant: 10),
            cardViewBackground.leadingAnchor.constraint(equalTo: lineView.leadingAnchor, constant: 5),
            cardViewBackground.heightAnchor.constraint(equalToConstant: 75),
            cardViewBackground.trailingAnchor.constraint(equalTo: lineView.trailingAnchor),
            
            circleAvatar.centerYAnchor.constraint(equalTo: cardViewBackground.centerYAnchor),
            circleAvatar.leadingAnchor.constraint(equalTo: cardViewBackground.leadingAnchor, constant: 10),
            circleAvatar.heightAnchor.constraint(equalToConstant: 50),
            circleAvatar.widthAnchor.constraint(equalToConstant: 50),
            
            eventTextLabel.topAnchor.constraint(equalTo: circleAvatar.topAnchor, constant: 10),
            eventTextLabel.leadingAnchor.constraint(equalTo: circleAvatar.trailingAnchor, constant: 6),
            
            eventDetailTextLabel.topAnchor.constraint(equalTo: eventTextLabel.bottomAnchor, constant: 2),
            eventDetailTextLabel.leadingAnchor.constraint(equalTo: eventTextLabel.leadingAnchor),
            avatarImg.widthAnchor.constraint(equalToConstant: 60),
            avatarImg.heightAnchor.constraint(equalToConstant: 60),
            avatarImg.centerXAnchor.constraint(equalTo: circleAvatar.centerXAnchor),
            avatarImg.centerYAnchor.constraint(equalTo: circleAvatar.centerYAnchor),
        ])
    }
}
