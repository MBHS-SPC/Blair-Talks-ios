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

class PlayerViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet var backgroundView:UIImageView!
    var catchphrase:AVAudioPlayer!
    var soundName:String=""
    var imgName:String=""
    var dubstepMash=false
    
    //soundTitles is the data for the picker
    //it must have identical elements to sounds.keys
    var soundTitles=[String]()
    
    //maps each sound title to its corresponding sound
    var sounds=[String: String]()
    @IBOutlet var soundSelector:UIPickerView!
    
   // @IBOutlet weak var nameLabel: UILabel!
    var subjectName:String=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNames()
        //self.view.backgroundColor=UIColor(patternImage: UIImage(named: imgName)!)
        backgroundView.frame=view.bounds
        backgroundView.clipsToBounds=true
        backgroundView.image=UIImage(named: imgName)
        backgroundView.center=view.center
        
        soundSelector.dataSource=self
        soundSelector.delegate=self
        soundSelector.backgroundColor=UIColor(white: 1, alpha: 0.1)
        
        view.sendSubviewToBack(backgroundView)
        
        prepareAudio()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //initialize the sound and image filenames
    func setupNames(){
        //get the audio and image filenames for a given person
        switch subjectName{
        case "Mr. Rose":
            soundTitles=["Alright!"]
            sounds=["Alright!":"rose"]
            imgName="rose.JPG"
        case "Mr. Paul":
            soundTitles=["Enlighten us"]
            sounds=["Enlighten us":"paul"]
            imgName="paul.JPG"
        case "Ms. Duval":
            soundTitles=["Crapton is an SI unit"]
            sounds=["Crapton is an SI unit":"duval_"]
            imgName="duval.JPG"
        case "Mr. Giles":
            soundTitles=["Easiest thing ever"]
            sounds=["Easiest thing ever":"giles_"]
            imgName="giles.JPG"
        case "Mr. Ostrander":
            soundTitles=["This is discreet math"]
            sounds=["This is discreet math":"ostrander_"]
            imgName="ostrander.JPG"
        case "Mr. Stein":
            soundTitles=["Follow","Bam! Bam!"]
            sounds=["Bam! Bam!":"stein_bam","Follow":"stein"]
            imgName="stein.JPG"
        case "Mr. Street":
            soundTitles=["Suffer"]
            sounds=["Suffer":"street"]
            imgName="street.JPG"
        case "Mr. Schafer":
            soundTitles=["It's not my dog"]
            sounds=["It's not my dog":"schafer_"]
            imgName="schafer.JPG"
        case "PHAM ROSE DUBSTEP MASH":
            soundTitles=["This iAlright!"]
            sounds=["This iAlright!":"phamrose"]
            imgName="rosestache.jpg"
            dubstepMash=true
        default:
            soundTitles=["This is ridiculous"]
            sounds=["This is ridiculous":"pham_"]
            imgName="pham.JPG"

        }
        soundName=sounds[soundTitles[0]]!   //set soundName to the default picker option
        //imgName+="small.jpg"
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return soundTitles.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return soundTitles[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        soundName=sounds[soundTitles[row]]!
        prepareAudio()
    }
    
    func prepareAudio(){
        var type:String="mp3"   //may be needed later
        
        if soundName=="paul"{
            type="aiff"
        }
        
        //initialize the AVAudioPlayer
        let path=NSBundle.mainBundle().pathForResource(soundName, ofType: type)
        do{
            try catchphrase=AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: path!))
        } catch _{
            //constructor can throw an error, but we want it to crash if it doesn't work
        }
        //print(">\(soundName)")
    }
    
    //play catchphrase
    @IBAction func playSound(sender: AnyObject) {   //called by the Tap Gesture Recognizer which is on the storyboard
        catchphrase.prepareToPlay()
        if(dubstepMash){
           catchphrase.numberOfLoops = -1
        }
        catchphrase.play()
        //print("done")
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