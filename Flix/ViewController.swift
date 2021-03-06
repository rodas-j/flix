//
//  ViewController.swift
//  Flix
//
//  Created by Rodas Jateno on 24/02/2022.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

                    // TODO: Get the array of movies
                 self.movies = dataDictionary["results"] as! [[String:Any]]
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data
                 self.tableView.reloadData()
             }
        }
        task.resume()

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        let m = movies[indexPath.row]
        let title = m["title"] as! String
        let synopsis = m["overview"] as! String
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let path = m["poster_path"] as! String
        let posterURL = URL(string: baseURL + path)
        cell.posterView.af.setImage(withURL: posterURL!)
        cell.titleLabel.text = title
        cell.synopsisLabel.text = synopsis
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let movie = movies[indexPath.row]

        let detailViewController =
        segue.destination as! MovieDetailsViewController
        detailViewController.movie = movie
        print("Preparing to go to the next page!")
    }
    
    


}

