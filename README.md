# easy-imapsync

This is a simple script to use the imapsync tool from https://github.com/imapsync/imapsync.

imapsync has proved to be much faster and more reliable than the built-in Office365 IMAP migration tool.

---

1. Install imapsync. *See imapsync documentation. Installation is beyond the scope of this README.*
2. Edit **easy-imapsync.sh** for your source and destination servers and usernames.
3. Run `bash easy-imapsync.sh` and enter the aliases for the source and destination mailboxes when prompted.

A log file will be created in your `imapsync/LOG_imapsync/` folder, typically in `~/imapsync/LOG_imapsync/`.
