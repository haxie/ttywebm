# TTYWEBM 

> ttywebm converts a ttyrec file into a webm video.
> It's forked from ttygif and uses ffmpeg for conversion. 
> Only tested with OS X at the moment, should work on most \*nix platforms.

## Setup

### OSX
``` sh
$ brew install ffmpeg --with-libvpx --with-libvorbis 
$ brew install ttyrec
$ git clone https://github.com/haxie/ttywebm.git
$ cd ttywebm 
$ make
```

## Usage:

**1. Create ttyrec recording**

``` sh
$ ttyrec myrecording
```

* Hit CTRL-D or type `exit` when done recording.

**2. Create PNG frames**

``` sh
$ ./ttywebm myrecording
```

* Dumps a bunch of PNG images into the current directory.
* File names have this pattern: `<zero_padded_index>_<delay_in_milliseconds>.png`

On OSX optionally you can set a -f flag which will bypass cropping which is needed for terminal apps which aren't full screen. 
Both standard Terminal and iTerm apps are supported.

``` sh
$ ./ttywebm myrecording -f
```

**3. Create WebM**

``` sh
$ ./concat.sh [-a audio.mp3] [-fps 12] -o terminal.webm
```

* Use the -a and -fps flags to set audio and framerate respectively (optional)

## Credits

* Forked from ttygif [ttygif](https://github.com/icholy/ttygif)
* The original idea and approach was adapted from [tty2gif](https://bitbucket.org/antocuni/tty2gif)

