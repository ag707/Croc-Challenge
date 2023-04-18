//
//  GameViewController.swift
//  Croc Challenge
//
//  Created by Yelena Gorelova on 17.04.2023.
//

import UIKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = .systemGreen
      crocoImageConstraints()
      timeLabelConstraints()
      wordLabelConstraints()
      descriptionLabelConstraints()
      stackViewButtonsConstraints()
    }

  private lazy var crocoImage: UIImageView = {
         let theImageView = UIImageView()
         theImageView.image = UIImage(named: "croco")
         theImageView.translatesAutoresizingMaskIntoConstraints = false
         return theImageView
      }()


  lazy var timeLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "00:59"
      label.font = UIFont.systemFont(ofSize: 48)
      label.textAlignment = .center
      return label
  }()


  lazy var wordLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "Картошка"
      label.font = UIFont.systemFont(ofSize: 48)
      label.textAlignment = .center
      return label
  }()


  lazy var descriptionLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "объясни с помощью жестов"
      label.font = UIFont.systemFont(ofSize: 22)
      label.textAlignment = .center
      label.numberOfLines = 0
      return label
  }()


  private lazy var correctButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Правильно", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    button.layer.cornerRadius = 10
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .green

    return button
  }()

  private lazy var breakRulesButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Нарушил Правила", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    button.layer.cornerRadius = 10
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .red

    return button
  }()

  private lazy var startGameButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Сбросить", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    button.layer.cornerRadius = 10
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .gray

    return button
  }()


  private lazy var stackViewButtons: UIStackView = {

    let stack = UIStackView()
       stack.axis = .vertical
      stack.spacing = 10.0
       stack.alignment = .fill
       stack.distribution = .fillEqually
    stack.addArrangedSubview(correctButton)
    stack.addArrangedSubview(breakRulesButton)
    stack.addArrangedSubview(startGameButton)
    stack.translatesAutoresizingMaskIntoConstraints = false

    return stack
  }()


  func crocoImageConstraints() {

    view.addSubview(crocoImage)

    NSLayoutConstraint.activate([

      crocoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      crocoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      crocoImage.widthAnchor.constraint(equalToConstant: 139),
      crocoImage.heightAnchor.constraint(equalToConstant: 139)

    ])

  }


  func timeLabelConstraints() {

    view.addSubview(timeLabel)

    NSLayoutConstraint.activate([

      timeLabel.topAnchor.constraint(equalTo: crocoImage.bottomAnchor, constant: 57),
      timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
      timeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25)

    ])

  }


  func wordLabelConstraints() {

    view.addSubview(wordLabel)

    NSLayoutConstraint.activate([

      wordLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 85),
      wordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 63),
      wordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -63)

    ])

  }


  func descriptionLabelConstraints() {

    view.addSubview(descriptionLabel)

    NSLayoutConstraint.activate([

      descriptionLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 15),
      descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 89),
      descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -89)

    ])

  }



  func stackViewButtonsConstraints() {

    view.addSubview(stackViewButtons)

    NSLayoutConstraint.activate([

      stackViewButtons.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 75),
      stackViewButtons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
      stackViewButtons.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
      stackViewButtons.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)

    ])

  }

}