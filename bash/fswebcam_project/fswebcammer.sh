#!/bin/bash

# DISCLAIMER
# ==========
# THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# This script is designed take regular pictures through a Linux laptop's webcam. That picture is stored and then a file hash is generated.
# You will need to have the fswebcam package installed on your system.


# To set up a cronjob for this particular script, you'll want it to look like the following:
#   */1 * * * * bash <path to folder containing script>/fswebcammer.sh

if ! command -v fswebcam &> /dev/null
    then
        echo "fswebcam is not installed."
        exit 1
    else
        echo "fswebcam is installed. Let's begin."
        echo 
        mkdir $HOME/Pictures/Security
        fswebcam -r 640x480 --save $HOME/Pictures/Security/pic%Y-%m-%d_%H:%M:%S.jpg
        md5sum $HOME/Pictures/Security/* >> $HOME/Pictures/Security/hashes
fi
exit 0
