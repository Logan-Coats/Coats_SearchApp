//
//  ViewController.swift
//  Coats_SearchApp
//
//  Created by Logan Coats on 10/7/21.
//

import UIKit

class ViewController: UIViewController {
    var imgarray = [ ["superman","batman","wonderwoman","flash","greenarrow"],["cat","lion","panther","tiger","lynx"],["basketball","baseball","volleyball","tennis","soccer"],["bible","torah","quran","vedas","tripitaka"],["goldenret","shibe","germanshepherd","greyhound","pug"],["noresult"]]
    var herokeywords = ["hero","superhero","comics","DC","superman","batman","wonder woman","flash","green arrow"]
    var felinekeywords = ["feline","cat","lion","tiger","lynx","panther","wild cat","house cat"]
    var sportkeywords = ["baseball","basketball","tennis","volleyball","soccer","football","hockey","team","sports","sport"]
    var bookkeywords = ["book","bible","quran","torah","vedas","tripitaka","religious text","holy book"]
    var dogkeywords = ["dog","golden retriever","greyhound","german shepherd","pug","shibe inu","doggie","doggo","canine"]
    var topictext = ["Superheroes, like Superman, Batman, or others, are people with super-human abilities capable of protecting the citizens of earth from global and criminal threats.","Cats are a very diverse  branch of the animal kingdom, and  can range in all sizes, from a housecat to a lion or a lynx to a tiger. They appear almost everywhere in the world.","Sports are physical games that pit 2 teams or people against one another to score more points, at least usually. Basketball, Soccer, Baseball, Volleyball, Tennis, and Football are great examples.","Religious texts hold a lot of power when it comes to the formation of culture, as many morals and values of regions can be based in a religious texts' teachings.","Dogs are commonly known as man's best friend, and come in hundreds of different breeds. All regions of the world seem to have their own unique breeds of dog."]
    var currenttopic = 5 // if 5 display not found  img:)
    var currentimg = 0 //reset to zero unless i dont wanna.
    @IBOutlet weak var moreimagesbtn: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var topicInfoText: UITextView!
    // abstraction here
    func changeTopic(){
        //display first image for topic and display text for topic.
        //make more images visible
        currentimg = 0
        if(currenttopic == 5){
            //display noresult img
            moreimagesbtn.isHidden = true
            resultImage.image = UIImage(named: imgarray[currenttopic][currentimg])
        }else{
            topicInfoText.text = topictext[currenttopic]
            resultImage.image = UIImage(named: imgarray[currenttopic][currentimg])
            moreimagesbtn.isHidden = false
            moreimagesbtn.isEnabled = true
        }
    }
    
    
    
    
    
    @IBAction func searchButtonAction(_ sender: Any) {
        //if keywords are found  in searchtextfield; display 1st image of related topic to keyword and text related to keyword. moreimagesbtn.isHidden = false
        //also reset currentimg to 0 just in case.
        //heroes = 0   \
        //felines = 1   \
        //sports = 2     > use this order for all arrays, it will make things easier.
        //books = 3     /
        //dogs = 4     /
        //if no keywords are found in searchtextfield, set currenttopic to 5 and display not found img
        if(herokeywords.contains(searchTextField.text!)){
            currenttopic = 0
        }else if(felinekeywords.contains(searchTextField.text!)){
            currenttopic = 1
        }else if(sportkeywords.contains(searchTextField.text!)){
            currenttopic = 2
        }else if(bookkeywords.contains(searchTextField.text!)){
            currenttopic = 3
        }else if(dogkeywords.contains(searchTextField.text!)){
            currenttopic = 4
        }else{
            currenttopic = 5
        }
        changeTopic()
    }
    
    @IBAction func moreImagesBtn(_ sender: Any) {
        //when pressed, display the  next img for currenttopic.
        //since imgArray is 2D, iterate second idx.
        //if at idx [i][4] set moreimagesbtn.enabled = false OR loop back to currentimg = 0
        currentimg += 1
        if(currentimg >= 4){
            moreimagesbtn.isEnabled = false
        }
        resultImage.image = UIImage(named:imgarray[currenttopic][currentimg])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //do not display text or image initially, moreimagesbtn should not be visible.
        currentimg = 0
        moreimagesbtn.isHidden = true
        
    }
}

