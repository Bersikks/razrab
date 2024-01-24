//
//  ViewController.swift
//  medic_smartlab
//
//  Created by Berezhnova <3 on 24.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // Добавляем обработчик события изменения текста в поле
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        // Изначально деактивируем кнопку
        btnNext.isEnabled = false

        // Устанавливаем цвета для неактивной кнопки
        btnNext.setTitleColor(UIColor.white, for: .disabled)
        
        btnNext.backgroundColor = UIColor(red: 201.0/255.0, green: 212.0/255.0, blue: 251.0/255.0, alpha: 1.0) // #C9D4FB
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.lightGray.cgColor
    }

    // Обработчик события изменения текста
    @objc func textFieldDidChange() {
        if let text = textField.text, !text.isEmpty {
            btnNext.isEnabled = true // Если текстовое поле не пустое, активируем кнопку
        } else {
            btnNext.isEnabled = false // В противном случае деактивируем кнопку
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

} 
