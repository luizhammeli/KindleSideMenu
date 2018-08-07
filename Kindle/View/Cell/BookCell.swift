//
//  BookCell.swift
//  Kindle
//
//  Created by Luiz Hammerli on 23/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    
    var book: Book?{
        didSet{
            bookNameLabel.text = book?.name
            bookAuthorNameLabel.text = book?.author
            guard let imageURL = book?.image else{return}
            guard let url = URL(string: imageURL) else{return}
            bookImageView.image = nil
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error{
                    print(error)
                    return
                }
                guard let imageData = data else{return}
                
                DispatchQueue.main.async {
                    self.bookImageView.image = UIImage(data: imageData)                    
                }
                
                
            }.resume()
        }
    }
    
    private let bookImageView: UIImageView = {
        let imageView = UIImageView()        
        imageView.translatesAutoresizingMaskIntoConstraints = false        
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let bookNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .white
        return label
    }()
    
    private let bookAuthorNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
     let customSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.customBlack
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        self.addSubview(bookImageView)
        self.addSubview(bookNameLabel)
        self.addSubview(bookAuthorNameLabel)
        self.addSubview(customSeparator)
        
        bookImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        bookImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 22).isActive = true
        bookImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -22).isActive = true
        bookImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        bookNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -12).isActive = true
        bookNameLabel.leftAnchor.constraint(equalTo: bookImageView.rightAnchor, constant: 10).isActive = true
        bookNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        bookNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        bookAuthorNameLabel.topAnchor.constraint(equalTo: bookNameLabel.bottomAnchor, constant: 2).isActive = true
        bookAuthorNameLabel.leftAnchor.constraint(equalTo: bookNameLabel.leftAnchor).isActive = true
        bookAuthorNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -1).isActive = true
        bookAuthorNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        customSeparator.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        customSeparator.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true
        customSeparator.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1).isActive = true
        customSeparator.heightAnchor.constraint(equalToConstant: 0.8).isActive = true
    }
}
