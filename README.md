# subtitles_to_balkanish
A small utility script that re-encodes subtitle files downloaded by VLC player to UTF-8 and handles all the characters specific to Serbo-Croation alphabet

Python script handles the conversion. Bash script checks initial subtitle encoding and passes it to the Python script.


## Getting Started

The code was written for my personal machine in mind, so it's not generalized for different environments. It works on Ubuntu with bash, and specifically needs the `.bashrc` file.

### Prerequisites

You will need to have Python 3 available on the system, even if it's not the default system-wide environment, and `pip` package installer. 
The Python script needs two specific libraries, `codecs` and `chardet`, but these should be installed once you run `install.sh`.

### Installing

Once all three files are downloaded (e.g. in $HOME/Downloads folder), first make the installer executable:

```
~/Downloads$ chmod +x stb_install.sh
```

Then, run the installer:

```
~/Downloads$ ./stb_install.sh
```

After this the scripts should be moved to $HOME/bin, made executable, and available to call from anywhere in the system. You can then execute the program by running (e.g.)

```
~/subs_to_balkan ~/Downloads/Awesome_movie/Awesome_movie.srt
```

The easiest way to get the full path to the subtitle file is to find it in your file manager, click on it, hit `CTRL+C`, and then in terminal paste it with `CTRL+SHIFT+V`.


## Authors

* **Marko Filipović** - *Initial work* - [MarkoFil](https://github.com/MarkoFil)


## License

This project is licensed under the [MIT License](https://mit-license.org/).
