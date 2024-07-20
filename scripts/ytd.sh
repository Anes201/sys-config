#!/usr/bin/env bash

# Author: <anes>
# Version: 2.0
# Usage: ytd <URL>
# __YouTube Downloader__ #

printf "Single Video or Playlist (s/p)?: "
read op0
printf "Video Or Audio (v/a/f): "
read op

    # Downloading Playlists
    # Insert --embed-subs to download subs with the video

if [[ $op0 == "p" ]]; then        
    if [[ $op == 'a' ]]; then
        printf "Downloading Audio Playlist (mp3)... \n"
        
        yt-dlp -f 'ba' -x --audio-format mp3 --download-archive videos.txt  $1 -o '$HOME/Videos/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'
	    printf "Success! Audio Playlist (mp3) Downloaded! \n"
    elif [[ $op == 'v' ]]; then
        printf "Downloading Video Playlist (mp4)...\n"
        
        yt-dlp -f 'bv*[height=720][ext=mp4]+ba[ext=m4a]' --download-archive videos.txt --embed-subs $1 -o '$HOME/Videos/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'
	    printf "Success! Video Playlist (mp4) Downloaded! \n"
    elif [[ $op == 'f' ]]; then
        printf "Downloading Normal Playlist (available)\n"
        yt-dlp -f 22 --embed-subs $1 -o "$HOME/Videos/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s"
        printf "Success! playlist Downloaded\n"
    fi
# Downloading Single Video
elif [[ $op0 == 's' ]]; then                            
    if [[ $op == 'a' ]]; then
        printf "Downloading Single Audio (mp3)...\n"
        
        yt-dlp -f 'ba' -x --audio-format mp3 $1 -o '$HOME/Videos/%(title)s.%(ext)s'
	    printf "Success! Audio (mp3) Downloaded!\n"
    elif [[ $op == 'v' ]]; then
        printf "Downloading Single Video (mp4)...\n"
        
	    yt-dlp -f 'bv[height=720][ext=mp4]+ba[ext=m4a]' --merge-output-format mp4 --embed-subs $1 -o '$HOME/Videos/%(title)s.%(ext)s'
	    printf "Success! Video (mp4) Downloaded! \n"
    elif [[ $op == 'f' ]]; then
        printf "Downloading Normal Single Video (best)\n"
        yt-dlp -f 22 --embed-subs $1 -o "$HOME/Videos/%(title)s.%(ext)s"
        printf "Success! Video Downloaded\n"
    fi
fi


    # yt-dlp -x --audio-format m4a https://www.youtube.com/watch?v=oWrJVNunTQw -o '$HOME/Downloads/Videos/%(title)s.%(ext)s'
    # yt-dlp --extract-audio --audio-format mp3 --audio-quality 8 "https://www.youtube.com/watch?v=oWrJVNunTQw" -o '$HOME/Downloads/Videos/%(title)s.%(ext)s' ### default quality = 5
