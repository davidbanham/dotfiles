#!/bin/bash
echo `keybase decrypt -i ~/.sec/pass.gpg 2> /dev/null | awk '/gmailOfflineImapPersonal/ {print $2}'`
