//
//  ShowChatSearchViewController.swift
//  ShowChat
//
//  Created by Fox (legal name:  Nick Borer) on 11/23/2023.
//

import Foundation
import UIKit

class ShowChatSearchViewController: UIViewController
{
   
   @IBOutlet weak var collectionView: UICollectionView!
   @IBOutlet weak var showChatSearchBar: UISearchBar!
   @IBOutlet var imageViewToolTip: UIImageView!
   
   
   var searchResults = [String]()
   var reuseIdentifier = "photoCollectionCell"
   
   let posterImageNames = ["all-the-light-we-cannot-see",
			   "beef",
			   "indian_matchmaking",
			   "love-is-blind",
			   "love-island-2019",
			   "queer-eye",
			   "selling-sunset",
			   "suits",
			   "the-circle",
			   "the-great-british-bake-off"]
   
   
   
   override func viewDidLoad()
   {
      super.viewDidLoad()
      
      //hideImageViewAfterTimeExpired(time: 20, imageView: imageViewToolTip)
      
      super.reloadInputViews()
      
   }
   
   override func didReceiveMemoryWarning()
   {
      super.didReceiveMemoryWarning()
   }
   
   
   //Auto-Hide the ToolTip after time-out of 20 seconds, if needed for future
   func hideImageViewAfterTimeExpired(
      time: CFTimeInterval, imageView: UIImageView)
   {
      DispatchQueue.main.asyncAfter(deadline: .now() + time)
      {
	 imageView.isHidden = true
      }
   }
   
   
   //MARK:  - Text Field Delegates
   
   func showChatSearchBar(
      _ showChatSearchBar: UISearchBar,
      shouldChangeCharactersIn range: NSRange,
      replacementString string: String) -> Bool
   {
      let oldText = showChatSearchBar.text!
      let stringRange = Range(range, in: oldText)!
      let newText = oldText.replacingCharacters(in: stringRange, with: string)
      
      if newText.isEmpty
      {
	 //doneBarButton.isEnabled = false
      }
      else
      {
	 //doneBarButton.isEnabled = true
      }
      
      return true
   }
   
   func textShouldClear(
      _ showChatSearchBar: UISearchBar) -> Bool
   {
      //doneBarButton.isEnabled = false
      
      return true
   }
}


//MARK:  - Search Bar Delegate

extension ShowChatSearchViewController: UISearchBarDelegate
{
   func searchBarSearchButtonClicked(
      _ searchBar: UISearchBar)
   {
      if searchBar.text! .isEmpty
      {
      }
      else
      {
	 
	 //Hide the Keyboard after SearchButtonClicked
	 searchBar.resignFirstResponder()
	 
	 //Begin Fake Search Results Code:
	 searchResults = []
	 
	 for i in 0...2
	 {
	    searchResults.append(
	       String(
		  format: "Fake Result %d for '%@'", i, searchBar.text!
	       )
	    )
	 }
	 
	 //Fake output to enhance the non-functioning Search Bar
	 print("The searched text is: '\(searchBar.text!)' ")
	 print("The Fake Search Results Array contains: '\([searchResults])' ")
      }
      
      //Popup Message to indicate what String was searched from the SearchBar
      let theMessage = searchBar.text!
      
      if searchBar.text! .isEmpty
      {
      }
      else
      {
	 let alert = UIAlertController(
	    title: "Text Searched:",
	    message: theMessage,
	    preferredStyle: .alert)
	 
	 let action = UIAlertAction(
	    title: "OK", style: .default, handler: nil)
	 
	 alert.addAction(action)
	 
	 present(alert, animated: true, completion: nil)
      }
   }
}


extension ShowChatSearchViewController: UICollectionViewDataSource, UICollectionViewDelegate
{
   //MARK:  - Carousel Data Source for Main Posters
   
   func collectionView(
      _ collectionView: UICollectionView,
      numberOfItemsInSection section: Int) -> Int
   {
      return posterImageNames.count
   }
   
   func collectionView(
      _ collectionView: UICollectionView,
      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
   {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCollectionCell", for: indexPath) as? CollectionViewCell
      
      cell?.imageView.image = UIImage(named: posterImageNames[indexPath.row])
      cell?.imageView.layer.cornerRadius = 30
      

      return cell!
   }

}
