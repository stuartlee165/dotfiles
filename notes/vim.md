# ######### #
#    Vim    #
# ######### #

# coc-vim
cntl+w w            - enter popup window

# currently learning:
gf      - to go to module code
:set path+=/Users/stuart.lee/venv/lib/python3.10/site-packages/  - sets the path to the venv you're working in (allows you to use the above)
:CtrlP		- fuzzy search in vim
install script might need to add -> :CocInstall coc-pyright
>>		- shift line right in normal mode
gi		- go to last insert
gv		- use last visual mode 
gn		- go from current search to next in visual mode
gx		- open link in browser
gf 		- open file in system default
:*s/a           - search for "a" in the last visual mode selection (same as '<,'> )
'<,$		- from first line of last visual search to end of file


# regex
\v convert to full regex 

e.g. to replace everything in lines 191:253 that match regex pattern:
:191,253s/\v AR[0-9]{1,3}:/

# Vim Pope Surround
S<p> 		- surround in <p></p> using visual mode
ysiw" 		- surround in quotes or } ] etc. 
yss"		- surround line in quotes
ds"		- delete surrounding quotes
cs"		- change surrounding quotes
ysiw<em>	- surround in tag
h3+p*5,,        - creates h1 tag using emet (only works in html files)

# Copy Paste
Cycle through paste history
cntl n 		- back into past
cntl p		- into the future
x 		- remapped to be cut
dl		- has replaced x

# Jumping Around
mC		- mark working file
cntl o		- jump move to last jump
cntl i		- jump forward in jump register
cntl u / d -> move up / down half screen
shift h/b/m -> move cursor to high/middle/bottom of screen
marks -> view marked files
mV    -> mark file (globally) e.g. set this to vimrc file
mv    -> mark position in file only e.g. 'g in this file goes to git shortcuts
'v    => goes to marked position v
''    -> go to last position
'.    -> go to last editied position
cntrl w -> delete word in command mode
ctl B/E	-> go to beginngin end in command mode
ctrl R % -> paste current working file path name (if in vim command)

jump / moving / sneak
fa <a> 				- jump on a
ta <a>				- jump before a
sa <ab>				- sneak to next ab (capital S for backwards search)
sa; <ab><ab>			- using ; to skip to next ab
cntl o 				- back in jump register
cntl i 				- forward in jump register
''				- back and forward in jump register	
' and ;				- repeat last search forward / backward
				- note that only multiple line movements are recorded in jump register, hjkl are not
cntl u/d (up/down)		- half a page up / down
cntl f/b (forward/back(		- full page up down
H				- move cursor to top of page
L				- move cursor to bottom of page
M				- move cursor to middle of page
z enter				- make cursor top of screen
zz				- make cursor middle of screen

hight text  gq 		-> auto format to correct line length (comment)
Vim ~/.bash_profile		where all of your terminal setup stuff is stored
:PluginInstall		run from within vim to install plugins listed in vimdc:::
u 	undo
cnt r	redo
hjkl	left down up right
{} paragraph up down
$ 0	end / beginning
W b forward back one word
G gg end beginning of file
G;	back to where cursor last was 
o begin a new line after the cursor
d0 delete to beginning of line
d$ delete to end of line
dd delete line  (then can do p to put somewhere else)
ddp 		swap line with one below
u undo last operation 
Cont r redo
/searchforthispattern 	n find next 		N find previous
y	copy in visual mode (y$ copy to end, yy copy line, 3yy copy 3 lines, y^ to line begin, yw to begin next word, yiw this word,y% to matching char
d	cut in visual mode
gd	go to function definition

/\<gnu\>Terminal 	search for whole word gnu
:%s/foo/bar/gc		replace foo with bar, % = range (whole file), g = replace all, c = check first,	
:w new_name 	save with new_name
4,5>		indent lines 4 to 5 (also can use > with visual mode, < to put back or . to repeat)
:e filename		edit file in new buffer
:buffers		view all buffers
:b1			change to buffer1
Cntl 6			switch to last buffer
:bdelete 2		delete buffer 2
:enew			create a new empty buffer
:%bd			close all buffers
dit			delete inner tag block
4,6> 	indent lines 4 to 6
crtl v	visual mode
q2	record macro and set at 2 then q again to end record…. Play macro 10 times with 10@2 
CTRL-\ CTRL-n	move out of terminal window
dib 	delete everything in brackets 
di( 	delete everything in brackets
ds{	delete {}
ds"	delete "" etc. (using 'tpope/vim-surround')
sp	up down split

vs	left right split
cntl hjkl 	navigate windows
cntl wq	close window
:10 sp .bashrc		will open bash rc in horizontal split
Cntl w_ 		make current split maximum height
cntl w=		make windows equal again
Cntl w| (pipe) 	make vertical split max
Cntl wR		swap panes
:resize +5 		will increase current pane 5 lines (or just res +5)

:vert term		vertical terminal split (:term horizontal)
Cntl D			close terminal
cntl Ww		exit
view doc string		K
cntl space		autocomplete

o escp dd p p p p 	insert multiple blank lines (basically pasting blank lines)
10o escp		insert 10 lines above
o10 escp		insert 10 lines above cursor

mb 			copy file location to clipboard from NerdTree
~/.NERDTreeBookmarks	edit bookmarks nerdtree 
?			help in nerdtree

Iterm2
cmd w			close tab
cmd W			close all windows
cmd shift [		switch tab
cmd d 			split window vertically
cmd shift d		split window horizontally (shitft is a wide hoizontal key) 
cmd option arrow key	move to pane
cnt u 			clear command

# Spelling:
s[  or s]       - to move to next spelling mistake
z= 		- to correct spelling (shows list of suggested words)

json
:%! python -m json.tool 	- auto format json file using inbuilt vim script


