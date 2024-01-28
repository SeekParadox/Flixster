//
//  MovieCell.swift
//  Flixster
//
//  Created by Michael Waller on 1/28/24.
//

import UIKit
import NukeExtensions

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// Configures the cell's UI for the given track.
    func configure(with movie: Movie) {
        movieTitle.text = movie.title
        movieDescription.text = movie.overview
        NukeExtensions.loadImage(with: movie.poster, into: movieImageView)

        // Load image async via Nuke library image loading helper method
//        Nuke.loadImage(with: track.artworkUrl100, into: trackImageView)
    
    }

}
