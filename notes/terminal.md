# ######### #
# Terminal  #
# ######### #

j desktop	- jump to desktop (tracks most used files)
Clear terminal: ⌃⌘L (Ctrl+Cmd+L) (Clear)
shift cmd c 	enter copy mode (then cntrl V to enter character selection mode)
Up 2 directories cd ../../
mkdir -p folder/subfolder
Git mv filename foldername
Mv ~/Documents/text1 .     This would move text1 to current directory (dot represents current directory) and keep same name
"mv file\*.csv"  (ignore the \) 		move all files that start with file and end in .csv mv text1 ~/Documents/.   Would move text1 to documents but keep the same name
cp text1 ~/Documents/.   As above but copy
Ls -lart   shows all files including hidden files.  e.g. would show touch .hidden_file
Touch .hidden_file   create a hidden file
cntrl z		move back to terminal from ipython but keep ipython running in background
fg		to move back to ipython from terminal

rm 		deletes a file
rm *file.csv	*delete all files that end in file.csv
mkr		make a folder
Rm -r 		remove a directory 
cat 		output what’s inside a file
cat textfile 1> outputfilename 	1>  represents standard out and will save the output from cat textfile into outputfilename
Python3 file.py 2> error.txt		output the error of the code to error.txt



