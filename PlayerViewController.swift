//
//  PlayerViewController.swift
//  Blair Talks
//
//  Created by Sam Ehrenstein on 9/16/15.
//  Copyright (c) 2015 MBHS SPC. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    var catchphrase:AVAudioPlayer!
    var soundName:String=""
    var imgName:String=""
    
   // @IBOutlet weak var nameLabel: UILabel!
    var subjectName:String=""
    @IBOutlet var backgroundView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNames()
        //self.view.backgroundColor=UIColor(patternImage: UIImage(named: imgName)!)
        backgroundView.frame=view.bounds
        backgroundView.clipsToBounds=true
        backgroundView.image=UIImage(named: imgName)
        backgroundView.center=view.center
        prepareAudio()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //initialize the sound and image filenames
    func setupNames(){
        //get the audio filename for a given person
        switch subjectName{
        case "Mr. Rose":
            soundName="rose"
            imgName="rose_"
        case "Mr. Paul":
            soundName="paul"
            imgName="nothere_"
        case "Mr. Pham":
            soundName="pham_"
            imgName="pham_"
        case "Ms. Duval":
            soundName="duval_"
            imgName="duval_"
        case "Mr. Giles":
            soundName="giles_"
            imgName="giles_"
        case "Mr. Ostrander":
            soundName="ostrander_"
            imgName="ostrander"
        case "Mr. Stein":
            soundName="stein"
            imgName="stein_"
        case "Mr. Street":
            soundName="street"
            imgName="street_"
        case "Mr. Schafer":
            soundName="schafer_"
            imgName="schafer_"
        default:
            soundName="nothere"
            imgName="nothere_"
        }
        imgName+="small.jpg"
    }
    
    func prepareAudio(){
        let type:String="mp3"   //may be needed later
        
        //initialize the AVAudioPlayer
        let path=NSBundle.mainBundle().pathForResource(soundName, ofType: type)
        do{
        try catchphrase=AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: path!))
        } catch _{
            //constructor can throw an error, but we want a crash if the file isn't there
        }
    }
    
    //play catchphrase
    @IBAction func playSound(sender: AnyObject) {   //called by the Tap Gesture Recognizer which is on the storyboard
        //println("about to play")
        catchphrase.prepareToPlay()
        catchphrase.play()
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}