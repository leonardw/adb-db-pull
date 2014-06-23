# Android SQLite DB Pull (adb-db-pull)

Shell script to pull SQLite DBs on an Android (virtual) device directly to a connected computer, via ADB.

The pulled DB file may then be opened and examined using any of the SQLite tools running on the computer.


Features:
* List all packages on Android device that have a SQLite database
* List all SQLite databases on Android device under a given package name
* Copy a specified SQLite DB file from Android device to current local directory on computer


Prerequisites:

* A computer runing *nix (Linux, Mac OSX, etc)
* ADB (part of Android SDK) must be installed on computer
* Connected Android device may be a virtual device (ADT Virtual Device, Genymotion, etc) or a _rooted_ physical device.
* Only one Android device may be connected; multiple connected devices may fail with unkown errors


## Installation

Copy the shell script into a directory on your PATH, e.g., `/usr/local/bin`

```sh
$ cp ./adb-db-pull.sh /usr/local/bin/
$ chmod +x /usr/local/bin/adb-db-pull.sh
``` 

## Usage

```sh
$ adb-db-pull.sh [PACKAGE.NAME [DB_FILE]]
```


## Example

List all packages that have a SQLite database, on a running Android device connected via ADB
```sh
$ adb-db-pull.sh
Packages with SQLite DBs found on device:
com.android.deskclock
com.android.email
com.android.inputmethod.latin
com.android.keychain
com.android.launcher
com.android.providers.calendar
com.android.providers.contacts
com.android.providers.downloads
com.android.providers.media
com.android.providers.settings
com.android.providers.telephony
com.android.providers.userdictionary
com.mydomain.myapp
```


List all SQLite databases under a specified package, on a running Android device connected via ADB
```sh
$ adb-db-pull.sh com.mydomain.myapp
SQLite DBs found under com.mydomain.myapp on device:
names.db
names.db-journal
profile.db
profile.db-journal
```


Copy a specified SQLite DB file to current local directory, from a running Android device connected via ADB
```sh
$ adb-db-pull.sh com.mydomain.myapp names.db
Done: snapshot
7219 KB/s (45056 bytes in 0.006s)
Done: ADB pull

$ ls -al
total 112
drwxr-xr-x   7 me  staff    238 22 Jun 10:00 .
drwxr-xr-x   3 me  staff    102 22 Jun 10:00 ..
-rw-r--r--   1 me  staff  45056 22 Jun 10:00 names.db
```


##License

(The MIT License)

Copyright (c) 2014 Leonard Wu <leonard.wu92@alumni.ic.ac.uk>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
