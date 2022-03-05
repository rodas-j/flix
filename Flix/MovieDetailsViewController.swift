//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Rodas Jateno on 28/02/2022.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var frontPoster: UIImageView!
    
    @IBOutlet weak var synopsis: UILabel!
    @IBOutlet weak var backgroundPoster: UIImageView!
    var movie : [String: Any]!
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTitle.text = movie["title"] as! String
        synopsis.text = movie["overview"] as! String
        var baseURL = "https://image.tmdb.org/t/p/w185"
        var path = movie["poster_path"] as! String
        var posterURL = URL(string: baseURL + path)
        frontPoster.af.setImage(withURL: posterURL!)
        baseURL = "https://image.tmdb.org/t/p/w780"
        path = movie["backdrop_path"] as! String
        posterURL = URL(string: baseURL + path)
        backgroundPoster.af.setImage(withURL: posterURL!)
        
       // synopsis.text = movie[""]
        // Do any additional setup after loading the view.
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
