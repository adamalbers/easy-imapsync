#!/bin/bash

# Server names should be FQDN only. No protocol information.
sourceServer='source.contoso.com'
destinationServer='outlook.office365.com'

# Usernames with Full Access rights to mailboxes.
# The trailing backslash (\) is mandatory in the username.
# Can be CONTOSO\admin\ or admin@contoso.com\ format for on-premise Exchange source.
sourceUser='admin@contoso.com\'
sourcePassword='supersecurepassword1'
destinationUser='admin@contoso.com\'
destinationPassword='supersecurepassword2'

# Declare folders to exclude, separated by pipe character (|).
# 'Calendar|Contacts' should always be declared as IMAP cannot sync them.
# Do 'Calendar|Contacts|Deleted Items' to also ignore Deleted Items folder.
exclusions='Calendar|Contacts'

# Prompt for the mailbox aliases.
printf "\nMailbox aliases are almost always the part of the email before the @ unless you have done some weird config.\n\n"
echo -n "Enter source alias and press [ENTER]: "
read -r alias1
printf "\n"

echo -n "Enter destination alias and press [ENTER]: "
read -r alias2
printf "\n"

# Combine the usernames and aliases for the full command.
user1="$sourceUser$alias1"
user2="$destinationUser$alias2"

# Create a timestamped log file.
logfile="$(date +%Y-%m-%d-%H-%M-%S)-$alias2.txt"

# Put it all together and run the sync.
/usr/bin/imapsync --host1 $sourceServer --user1 "$user1" --password1 "$sourcePassword" --exchange1  --host2 $destinationServer --user2 "$user2" --password2 "$destinationPassword" --office2 --logfile $logfile --exclude $exclusions

# Send a notification to GNOME Shell that the sync is done.
notify-send -u normal "IMAP Sync Finished" "$logfile"
