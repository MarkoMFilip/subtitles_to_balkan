#!/usr/bin/env python3

import sys
import os
import codecs


def convert_subtitles():
    """
    Changes Serbian/Croatian/Bosnian special characters in subtitles that VLC's 
    extension VLSub downloads from the internet from incorrect to correct ones. 
    The default encoding for these subtitles is Windows-1252.
    """
    # Parse inputs
    subs_path = sys.argv[1]
    try:
        subs_encoding = sys.argv[2]
    except IndexError:
        subs_encoding = 'Windows-1252'

    # Dictionary that holds original characters in keys, and their correct 
    # version as values
    change_dict = {'Æ': 'Ć',
                   'æ': 'ć',
                   'È': 'Č',
                   'è': 'č',
                   'ð': 'đ'}

    # Read the text of the original subtitle file and encode it as utf-8 (which
    # also converts it to bytes type automatically)
    with codecs.open(subs_path, 'r', encoding=subs_encoding) as f:
        subs = f.read().encode('utf-8')

    # Rename the original file so that we can keep it as a backup
    os.rename(subs_path, subs_path+'.bak')

    # Convert the characters
    # But dictionary keys/values also need to be converted to bytes first (this 
    # is what `encode()` does)
    for key, value in change_dict.items():
        subs = subs.replace(key.encode(), value.encode())

    # Create a new subs file with the same name as the original had, and write 
    # the converted data in
    with open(subs_path, 'wb') as f:
            f.write(subs)


# ------------------------------------------------------------------------------
#                                    MAIN
# ------------------------------------------------------------------------------

if __name__ == '__main__':

    convert_subtitles()
