//
//  MovieViewController.swift
//  Flixster
//
//  Created by Michael Waller on 1/28/24.
//

import UIKit
import NukeUI
import NukeExtensions

class MovieViewController: UITableViewController {
    @IBOutlet var movieView: UITableView!
    var movies: [Movie] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataFromURL()
        movieView.dataSource = self
        movies[0]

     
    
    }
    
   

    // MARK: - Table view data source
    
    func fetchDataFromURL() {
    
            if let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed") {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data {
                        do {
                            let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)

                            // Update UI on the main thread
                            DispatchQueue.main.async {
                                self.movies = movieResponse.results
                                // Update your UI or perform any actions with the decoded data here
                                // For example, you might update a table view or a collection view
                                print(self.movies[0])
                            }

                        } catch {
                            print("Error decoding JSON: \(error)")
                        }
                    }
                }.resume()
            }
        }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
      

        // return the cell for display in the table view
        return movies.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        

        // Get the track that corresponds to the table view row
        let movie = movies[indexPath.row]

        // Configure the cell with it's associated track
        cell.configure(with: movie)

        return cell
    }
    
  

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO: Pt 1 - Pass the selected track to the detail view controller
        if let cell = sender as? UITableViewCell,
           // Get the index path of the cell from the table view
           let indexPath = movieView.indexPath(for: cell),
           // Get the detail view controller
           let detailViewController = segue.destination as? DetailViewController {

            // Use the index path to get the associated track
            let movie = movies[indexPath.row]

            // Set the track on the detail view controller
            detailViewController.movie = movie
            print(movie)
        }


    }

    // TODO: Pt 1 - Add table view data source methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Get the index path for the current selected table view row (if exists)
        if let indexPath = movieView.indexPathForSelectedRow {

            // Deselect the row at the corresponding index path
            movieView.deselectRow(at: indexPath, animated: true)
        }
    }

    
}
