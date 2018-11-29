//
//  BaseViewController.swift
//  Kindle
//
//  Created by Luiz Hammerli on 28/11/18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var leftAnchor:NSLayoutConstraint?
    
    lazy var sideMenuView: SideMenuView = {
        let view = SideMenuView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var shadowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideSideMenu)))
        view.alpha = 0
        return view
    }()
    
    var menuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSideMenu()
        self.view.backgroundColor = .white
        self.view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture)))
    }
    
    
    func setUpSideMenu(){
        
        let bookListViewController = UINavigationController(rootViewController: BooksListViewController())
        guard let bookListView = bookListViewController.view else {return}
        bookListView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(bookListView)
        bookListView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        bookListView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        bookListView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        bookListView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
        
        self.view.addSubview(shadowView)
        shadowView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        shadowView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        shadowView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
        self.view.addSubview(sideMenuView)
        self.sideMenuView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.sideMenuView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.sideMenuView.widthAnchor.constraint(equalToConstant: 280).isActive = true
        leftAnchor = self.sideMenuView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: -280)
        leftAnchor?.isActive = true
        
        self.addChildViewController(bookListViewController)

    }
    
    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer){
        var translationX = gesture.translation(in: nil).x
        shadowView.alpha = checkAlphaTrasition(translationX)
        translationX = menuOpen ? translationX : translationX-280
        translationX = min(translationX, 0)
        translationX = max(-280, translationX)
        
        leftAnchor?.constant = translationX
        
        switch gesture.state{
            case .ended:
                handlePanEnded(translationX)
            default:
                break
        }
    }
    
    func checkAlphaTrasition(_ value:CGFloat)->CGFloat{
        var value = value
        value = menuOpen ? value+280 : value
        value = min(value, 280)
        value = max(0, value)
        return value/280
    }
    
    func handlePanEnded(_ translationX: CGFloat){
        var xValue:CGFloat = 0
        if (translationX > -120){
            xValue = 0
            menuOpen = true
        }else{
            xValue = -280
            menuOpen = false
        }
        
        leftAnchor?.constant = xValue
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.layoutSubviews()
            self.shadowView.alpha = self.menuOpen ? 1 : 0
        }, completion: nil)
    }
    
    @objc func hideSideMenu(){
        handlePanEnded(-120)
    }
    
    @objc func showSideMenu(){
        handlePanEnded(0)
    }
    
}
