#!/usr/bin/python

import os
import time
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler
import shutil

FSTAB_LOCATION = "/etc/fstab"
BACKUP_APPEND = ".bak"
BY_PATH_LOCATION = "/dev/disk/by-path/"

#noauto,nofail,rw,user,noatime
FSTAB_ENTRY = "{0} /mnt/p{1} auto rw,user,noauto,noatime,uid=1000,gid=1000 0 0"

START_OF_SECTION = "#---START MEMORY CARDS---"
END_OF_SECTION = "#---END MEMORY CARDS---"

player1_dir = ""
player2_dir = ""

#https://www.michaelcho.me/article/using-pythons-watchdog-to-monitor-changes-to-a-directory
class Handler(FileSystemEventHandler):
	
	player1 = ""
	player2 = ""
	
	def __init__(self):
		player1 = ""
		player2 = ""

	def on_any_event(self, event):
		if event.is_directory:
			return None
		elif event.event_type == 'created':
			if "-part1" in event.src_path:
				#print("Found new disk: %s." % event.src_path)
				
				global player1_dir
				global player2_dir
				
				if player1_dir == "":
					print("Found Player 1, please insert Player 2")
					player1_dir = event.src_path
				elif player2_dir == "":
					print("Found Player 2")
					player2_dir = event.src_path
				else:
					exit(0)

def BackupFile():
	shutil.copyfile(FSTAB_LOCATION, FSTAB_LOCATION + BACKUP_APPEND)

def DeleteSection():
	with open(FSTAB_LOCATION + BACKUP_APPEND) as infile, open(FSTAB_LOCATION, 'w') as outfile:
		copy = True
		
		for line in infile:
			if line.strip() == START_OF_SECTION:
				copy = False
			elif line.strip() == END_OF_SECTION:
				copy = True
			elif copy:
				outfile.write(line)
				
def StartSection():
	with open(FSTAB_LOCATION, 'a') as wrfile:
		wrfile.write(START_OF_SECTION + "\r\n")
		
def AddPlayer(location, number):
	with open(FSTAB_LOCATION, 'a') as wrfile:
		wrfile.write((FSTAB_ENTRY.format(location, number)) + "\r\n")
		
def EndSection():
	with open(FSTAB_LOCATION, 'a') as wrfile:
		wrfile.write(END_OF_SECTION + "\r\n")

if __name__ == '__main__':
	
	print("Cleaning up previous fstab entries...")
	BackupFile()
	DeleteSection()
	StartSection()
	
	#start watching for USB entry.
	event_handler = Handler()
	observer = Observer()
	observer.schedule(event_handler, BY_PATH_LOCATION, recursive=True)
	observer.start()
	
	print("Please put the USB drive in the player 1 slot.")
	try:
		#wait for the user fumble around the cabinet.
		while player1_dir == "" or player2_dir == "":
			time.sleep(1)
	except KeyboardInterrupt:
		observer.stop()
	except:
		observer.stop()
		print("Error")

	#quit finding things already, we found them.
	observer.stop()
	
	print("USB drives located, writing to disk...")
	
	AddPlayer(player1_dir, 1)
	AddPlayer(player2_dir, 2)
	EndSection()
	
	print("Done.")
