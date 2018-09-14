//
//  GitHubRepoTableViewCell.swift
//  GitList
//
//  Created by Devon Boyer on 9/8/18.
//  Copyright © 2018 Devon Boyer. All rights reserved.
//

import UIKit

class GitHubRepoTableViewCell: UITableViewCell {
    
    let nameLabel = UILabel()
    let descriptionLabel = UILabel()
    let starsView = CountView(icon: .stars)
    let forksView = CountView(icon: .forks)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        // Add each subview to the cell
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(starsView)
        contentView.addSubview(forksView)
        
        // Enable AutoLayout for all of our subviews
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        starsView.translatesAutoresizingMaskIntoConstraints = false
        forksView.translatesAutoresizingMaskIntoConstraints = false
        
        /*
         * Configure AutoLayout constraints for subviews
         */

        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true

        descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor, constant: 0).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 0).isActive = true

        starsView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
        starsView.leftAnchor.constraint(equalTo: descriptionLabel.leftAnchor, constant: 0).isActive = true
        starsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true

        forksView.topAnchor.constraint(equalTo: starsView.topAnchor, constant: 0).isActive = true
        forksView.leftAnchor.constraint(equalTo: starsView.rightAnchor, constant: 20).isActive = true
        
        /*
         * Configure appearance of views
         */
        
        descriptionLabel.numberOfLines = 0 // multi-line label
        
        // Fonts
        nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        
        // Text colors
        descriptionLabel.textColor = Colors.lightTextColor
        nameLabel.textColor = Colors.highlightedColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        // We won't support using Interface Builder for this class.
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with repo: GitHubRepo) {
        nameLabel.text = repo.name ?? "no name"
        descriptionLabel.text = repo.description ?? "no description"
        starsView.configure(count: repo.stargazersCount)
        forksView.configure(count: repo.forks)
    }
}

class CountView: UIView {
    
    let countLabel = UILabel()
    let iconImageView = UIImageView()
    
    init(icon: Icon) {
        super.init(frame: .zero)
        
        addSubview(countLabel)
        addSubview(iconImageView)
        
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        /*
         * Configure AutoLayout constraints for subviews
         */
        
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor).isActive = true
        
        countLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 8).isActive = true
        countLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        countLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        countLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        
        /*
         * Configure appearance of views
         */
        
        iconImageView.image = icon.image()
        iconImageView.contentMode = .scaleAspectFit
        countLabel.textColor = Colors.lightTextColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        // We won't support using Interface Builder for this class.
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(count: Int?) {
        countLabel.text = "\(count ?? 0)"
    }
}

