<h1 align="center">
    <br>
    <img src="assets/images/logo_300x300.png" alt="http-ping logo">
    <br>
    http-ping
</h1>

<p align="center">
<b>A simple command line tool that returns the HTTP-Status-Code of a URL</b></p>

<p align="center">
This is the result of a fun nightly live coding session at our LsW Telegram channel. We hope that you have just as much fun and that you find it useful as we do. 
</p>


### Installation
* download the repository to your local folder
* ```cd``` into the http-ping folder
* have fun :)

To make the usage more comfortable, you can create an alias in your ```.bashrc```:
```
alias http-ping="/yourLocalPath/http-ping/http-ping"
```

### How to use
Just type ```http-ping https://www.example.com```
    Press ```ctrl+c``` to stop the process. 
    At the end you'll see some statistics as it also provides the ping program.

### Options
Parameter | Meaning | Default
--------- | ------- | -------
-i | check the URL the given times | no limit
-s | sleep the given time | 1, see ```man sleep```
-t | timeout for a single request | none
-h | show the help message

### Screenshot / Examples
![screenshot1](assets/images/screenshot_ping.png)
![screenshot1](assets/images/screenshot_help.png)

### Credits
Many thanks to [fragbenny](https://fragbenny.de/) for the logo :) 

### License
Copyright © 2017 [Michael Wieland](https://github.com/Programie) and [Michael Rong](https://github.com/mrong)
    [GNU General Public License v3.0](LICENCE)