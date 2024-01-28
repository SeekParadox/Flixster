//
//  ViewController.swift
//  Flixster
//
//  Created by Michael Waller on 1/28/24.
//

import UIKit
import NukeExtensions

class DetailViewController: UIViewController {
    var movie: Movie!
    
   
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    
    @IBOutlet weak var averageView: UILabel!
    
    @IBOutlet weak var popularity: UILabel!
    @IBOutlet weak var votes: UILabel!
    override func viewDidLoad() {
      
        super.viewDidLoad()
        movieName.text = movie.title
        averageView.text = "Vote Average: " + String(movie.voteAverage)
        votes.text = "Votes: " + String(movie.voteCount)
        popularity.text = "Popularity: " + String(movie.popularity)
        movieDescription.text = movie.overview
        NukeExtensions.loadImage(with: movie.poster, into: moviePoster)
    
//        print()
        
//        moviePoster = movie.poster
        
        
        
    
    }



}

