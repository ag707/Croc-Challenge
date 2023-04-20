//
//  CorrectViewController.swift
//  Croc Challenge
//
//  Created by Yelena Gorelova on 17.04.2023.
//

import UIKit
import SnapKit

class CorrectViewController: UIViewController {
    
    let question = QuestionsBox()
    
    private lazy var backgroundView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: Resources.Image.backGround)
        return element
    }()

    private lazy var stackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.distribution = .fill
        return element
    }()
    
    private lazy var firstView: UIView = {
        let element = UIView()
        element.backgroundColor = .white
        element.layer.cornerRadius = 10
        return element
    }()
    
    private lazy var teamImageInFirstView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "Avatar1")
        return element
    }()
    
    private lazy var teamNameInFirstView: UILabel = {
        let element = UILabel()
        element.text = "Ковбои"
        element.font = UIFont(name: Resources.Fonts.bhavuka, size: 20)
        element.textColor = .black
        return element
    }()
    
    private lazy var scoreInFirstView: UILabel = {
        let element = UILabel()
        element.text = String(question.score)
        element.font = UIFont(name: Resources.Fonts.cookie, size: 65)
        element.textColor = .black
        return element
    }()
    
    private lazy var scoreLabelInFirstView: UILabel = {
        let element = UILabel()
        element.text = "Очки"
        element.font = UIFont(name: Resources.Fonts.bhavuka, size: 15)
        element.textColor = .black
        return element
    }()
    
    private lazy var secondView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(named: Resources.Colors.buttonGreen)
        element.layer.cornerRadius = 20
        return element
    }()
    
    private lazy var firstLabelInSecondView: UILabel = {
        let element = UILabel()
        element.text = "Поздравляем"
        element.font = UIFont.boldSystemFont(ofSize: 28)
        element.textColor = .black
        return element
    }()
    
    private lazy var secondLabelInSecondView: UILabel = {
        let element = UILabel()
        element.text = "Вы получаете"
        element.numberOfLines = 0
        element.textAlignment = .center
        element.font = UIFont(name: Resources.Fonts.bhavuka, size: 16)
        element.textColor = .black
        return element
    }()
    
    private lazy var imageInSecondView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "Vector")
        return element
    }()
    
    private lazy var thirdLabelInSecondView: UILabel = {
        let element = UILabel()
        element.text = "1"
        element.font = UIFont(name: Resources.Fonts.cookie, size: 80)
        element.textColor = .white
        return element
    }()
    
    private lazy var fourthLabelInSecondView: UILabel = {
        let element = UILabel()
        element.text = "Следующий ход - “Стройняшки”"
        element.font = UIFont(name: Resources.Fonts.bhavuka, size: 16)
        element.textColor = .black
        return element
    }()
    
    private lazy var transferButton: UIButton = {
        let element = UIButton()
        element.backgroundColor = UIColor(named: Resources.Colors.buttonGreen)
        element.setTitle("Передать ход", for: .normal)
        element.titleLabel?.textAlignment = .center
        element.titleLabel?.font = UIFont(name: Resources.Fonts.bhavuka, size: 17)
        element.layer.cornerRadius = 10
        element.setTitleColor(.white, for: .normal)
        element.addTarget(self, action: #selector(transferPressed), for: .touchUpInside)
        return element
    }()
    
    @objc func transferPressed() {
        self.navigationController?.isNavigationBarHidden = true
        let gameVC = GameViewController()
        self.navigationController?.pushViewController(gameVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

extension CorrectViewController {
    
    private func setupViews() {
        view.addSubview(backgroundView)
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(firstView)
        stackView.addArrangedSubview(secondView)
        stackView.addArrangedSubview(transferButton)
        
        firstView.addSubview(teamImageInFirstView)
        firstView.addSubview(teamNameInFirstView)
        firstView.addSubview(scoreInFirstView)
        firstView.addSubview(scoreLabelInFirstView)
        
        secondView.addSubview(firstLabelInSecondView)
        secondView.addSubview(secondLabelInSecondView)
        secondView.addSubview(imageInSecondView)
        secondView.addSubview(thirdLabelInSecondView)
        secondView.addSubview(fourthLabelInSecondView)
        
        addConstraints()
    }
    
    private func addConstraints() {
        backgroundView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(38)
            make.leading.trailing.equalToSuperview().inset(12)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(9)
        }
        
        firstView.snp.makeConstraints { make in
            make.height.equalTo(96)
            make.bottom.equalTo(secondView.snp.top).inset(-86)
        }
        
        secondView.snp.makeConstraints { make in
            make.height.equalTo(301)
            make.bottom.equalTo(transferButton.snp.top).inset(-144)
        }
        
        transferButton.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
        
        teamImageInFirstView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(15)
        }
        
        teamNameInFirstView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(105)
        }
        
        scoreInFirstView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(7)
            make.trailing.equalToSuperview().inset(20)
        }
        
        scoreLabelInFirstView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(8)
        }
        
        firstLabelInSecondView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(39)
        }
        
        secondLabelInSecondView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(firstLabelInSecondView.snp.bottom).inset(-28)
        }
        
        imageInSecondView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(85)
        }
        
        thirdLabelInSecondView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(170)
            make.bottom.equalToSuperview().inset(85)
        }
        
        fourthLabelInSecondView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(46)
        }
    }
}
