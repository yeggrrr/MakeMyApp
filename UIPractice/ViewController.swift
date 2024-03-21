import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    let inputTextField = UITextField()
    let nameLabel = UILabel()
    let ageLabel = UILabel()
    let answerLabel = UILabel()
    let enterButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUInameLabel()
        setUIImageView()
        setUIageLabel()
        setUITextField()
        setBackground()
        setUIButton()
        setUIanswerLabel()
    }
    
    func setBackground() {
        self.view.backgroundColor = .systemBrown
    }
    
    func setUInameLabel() {
        nameLabel.text = "Fubao"
        nameLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 2
        nameLabel.lineBreakMode = .byTruncatingTail
        nameLabel.frame = CGRect(x: 100, y: 30, width: 200, height: 200)
        self.view.addSubview(nameLabel)
    }
    
    func setUIageLabel() {
        ageLabel.text = "푸바오의 나이는?"
        ageLabel.font = .systemFont(ofSize: 25, weight: .semibold)
        ageLabel.textColor = .systemOrange
        ageLabel.textAlignment = .center
        ageLabel.numberOfLines = 2
        ageLabel.lineBreakMode = .byTruncatingTail
        ageLabel.frame = CGRect(x: 100, y: 230, width: 200, height: 200)
        self.view.addSubview(ageLabel)
    }
    
    func setUIanswerLabel() {
        answerLabel.text = ""
        answerLabel.font = .systemFont(ofSize: 30)
        answerLabel.textColor = .white
        answerLabel.textAlignment = .center
        answerLabel.numberOfLines = 2
        answerLabel.lineBreakMode = .byTruncatingTail
        answerLabel.frame = CGRect(x: 100, y: 400, width: 200, height: 200)
        self.view.addSubview(answerLabel)
    }
    
    func setUIImageView() {
        let imageView = UIImageView()
        let image = UIImage(named: "Fubao")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 100, y: 150, width: 200, height: 150)
        self.view.addSubview(imageView)
    }
    
    func setUITextField() {
        inputTextField.delegate = self
        inputTextField.placeholder = "정답을 입력해주세요."
        inputTextField.borderStyle = .roundedRect
        inputTextField.backgroundColor = .clear
        inputTextField.keyboardType = .numberPad
        inputTextField.isSecureTextEntry = false
        inputTextField.returnKeyType = .done
        inputTextField.textAlignment = .center
        inputTextField.frame = CGRect(x: 115, y: 350, width: 170, height: 30)
        inputTextField.addTarget(self, action: #selector(checkTextFieldState), for: .editingChanged)
        self.view.addSubview(inputTextField)
    }
    
    func setUIButton() {
        enterButton.isHidden = true
        enterButton.setTitle("Enter", for: .normal)
        enterButton.setTitle("Enter", for: .selected)
        enterButton.backgroundColor = .systemYellow
        enterButton.setTitleColor(.black, for: .normal)
        enterButton.setTitleColor(.darkGray, for: .highlighted)
        enterButton.layer.cornerRadius = 15
        enterButton.frame = CGRect(x: 150, y: 390, width: 100, height: 30)
        enterButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.view.addSubview(enterButton)
    }
    
    @objc func checkTextFieldState(_ textField: UITextField) {
        // textField가 비어있으면, Enter Button 비활성화
        // 1. 비어있는지 chk
        // 2. true면, Button 비활성화
        guard let ageText = textField.text else { return }
        
        //        if ageText.isEmpty {
        //            enterButton.isHidden = true
        //        } else {
        //            enterButton.isHidden = false
        //        }
        
        enterButton.isHidden = ageText.isEmpty
    }
    
    @objc func buttonTapped() {
        guard let ageText = inputTextField.text else { return }
        
        let isNumber = Int(ageText) != nil
        if isNumber {
            if ageText == "3" {
                answerLabel.text = "정답입니다!!"
            } else {
                answerLabel.text = "\(ageText)살 일까요? 땡!!"
            }
        } else {
            answerLabel.text = "숫자를 입력해주세요!!"
        }
    }
    
    //    @objc func buttonTapped2() {
    //        if let ageText = inputTextField.text,
    //           let age = Int(ageText) {
    //            answerLabel.text = age == 3 ? "정답입니다!!" : "\(age)살 일까요?"
    //        } else {
    //            answerLabel.text = "숫자를 입력해주세요!"
    //        }
    //    }
    
}

#Preview {
    ViewController()
}
