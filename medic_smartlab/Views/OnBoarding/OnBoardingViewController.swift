//
//  OnBoardingViewController.swift
//  medic_smartlab
//
//  Created by Berezhnova <3 on 24.01.2024.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var nextBtn: UIButton!
    
    var slides: [OnBoardingSlide] = []
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Завершить", for: .normal) // меняет кнопку пропустить при 3 слайде
            } else {
                nextBtn.setTitle("Пропустить", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [ OnBoardingSlide(title: "Анализы", description: "Экспресс сбор и получение проб", image: #imageLiteral(resourceName: "Illustration-2")),
                   OnBoardingSlide(title: "Уведомления", description: "Вы быстро узнаете о результатах", image: #imageLiteral(resourceName: "Снимок экрана 2022-09-17 в 19.21 1")),
                   OnBoardingSlide(title: "Мониторинг", description: "Наши врачи всегда наблюдают за вашими показателями здоровья", image: #imageLiteral(resourceName: "130 1"))]
        
    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "Registr") as! UIViewController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
            print("На следующую страницу")
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}
extension OnBoardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingCollectionViewCell.identifier, for: indexPath) as! OnBoardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
    }
}
