# ######### #
#   regex   #
# ######### #

regex
1)
"^[a-zA-Z0-9_]*$"
explanation:
^ : start of string
[ : beginning of character group
a-z : any lowercase letter
A-Z : any uppercase letter
0-9 : any digit
_ : underscore
] : end of character group
* : zero or more of the given characters
$ : end of string

2)
"^[\x00-\x7F]*$"
explanation:
allow only ASCI characters 00 to 7F defined in HEX system
\x means the next 2 characters are interpretted as the first two digits of hex number for character code
ASCI system has 127 characters only (it was used in the 1960s) of which only 96 are actual characters to be used
Because its only got 127 characters some symbols arent available e.g. £ sign.
127 characters are defined in hex system by 7F -> (7*16) + (9 + 6) -> 127
Hex system counts in 16s by using 123456789ABCDEF 
E.g. 9 is written by 9
     10 is written by A
     16 is written by F
     17 is written by 11
