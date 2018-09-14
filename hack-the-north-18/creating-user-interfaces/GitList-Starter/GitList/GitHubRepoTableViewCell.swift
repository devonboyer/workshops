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
        
        // 4. Add AutoLayout constraints for the description label.

        starsView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
        starsView.leftAnchor.constraint(equalTo: descriptionLabel.leftAnchor, constant: 0).isActive = true
        starsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true

        forksView.topAnchor.constraint(equalTo: starsView.topAnchor, constant: 0).isActive = true
        forksView.leftAnchor.constraint(equalTo: starsView.rightAnchor, constant: 20).isActive = true
        
        /*
         * Configure appearance of views
         */
        
        descriptionLabel.numberOfLines = 0 // multi-line label
        
        // 6. Configure fonts and text colors of labels.
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
        
        // 5. Add Autolayout constraints for the CountView subviews.
        
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

