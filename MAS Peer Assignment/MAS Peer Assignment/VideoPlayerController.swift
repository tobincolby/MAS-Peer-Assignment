//
//  VideoPlayerController.swift
//  MAS Peer Assignment
//
//  Created by Kar Shin Lin on 1/28/19.
//  Copyright © 2019 MAS. All rights reserved.
//

import UIKit
import YoutubeKit

final class VideoPlayerController: UIViewController {
    private var player: YTSwiftyPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a new player
        player = YTSwiftyPlayer(
            frame: CGRect(x: 0, y: 100, width: 640, height: 480),
            playerVars: [.playsInline(true), .videoID("_6u6UrtXUEI"), .loopVideo(false), .showRelatedVideo(false)])
        
        // Enable auto playback when video is loaded
        player.autoplay = true
        
        // Set player view.
        view = player
        
        // Set delegate for detect callback information from the player.
        player.delegate = self
        
        // Load the video.
        player.loadPlayer()
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

extension VideoPlayerController: YTSwiftyPlayerDelegate {
    
    func playerReady(_ player: YTSwiftyPlayer) {
        print(#function)
        // After loading a video, player's API is available.
        // e.g. player.mute()
    }
    
    func player(_ player: YTSwiftyPlayer, didUpdateCurrentTime currentTime: Double) {
        print("\(#function):\(currentTime)")
    }
    
    func player(_ player: YTSwiftyPlayer, didChangeState state: YTSwiftyPlayerState) {
        if state == .ended {
            //Current Code, default colour is black
            let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "logout") as UIViewController
            self.present(vc, animated: true, completion: nil)
        }
        print("\(#function):\(state)")
    }
    
    func player(_ player: YTSwiftyPlayer, didChangePlaybackRate playbackRate: Double) {
        print("\(#function):\(playbackRate)")
    }
    
    func player(_ player: YTSwiftyPlayer, didReceiveError error: YTSwiftyPlayerError) {
        print("\(#function):\(error)")
    }
    
    func player(_ player: YTSwiftyPlayer, didChangeQuality quality: YTSwiftyVideoQuality) {
        print("\(#function):\(quality)")
    }
    
    func apiDidChange(_ player: YTSwiftyPlayer) {
        print(#function)
    }
    
    func youtubeIframeAPIReady(_ player: YTSwiftyPlayer) {
        print(#function)
    }
    
    func youtubeIframeAPIFailedToLoad(_ player: YTSwiftyPlayer) {
        print(#function)
    }
}
