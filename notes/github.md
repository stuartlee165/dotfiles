# ######### #
#    Git    #
# ######### #

Git / git
git grep -l         - only show the file names that match
nvim $(git grep -l 'search string')  - open all the files found in nvim (run a sub shell process from nvim to open)
git grep -l -- tests        - only look for files in subdirectory tests
git grep <search sting> -- '\*.py'             - look for files ending in py  (exclude backslash)
git grep -E 'regex here'    - use regular expression
git rebase master           - rebase master in branch (ensure master up to date before rebasing)
 
:GRename 	- git rename file
:Git diff --merge-base origin/HEAD -- infra/data-science-lib/custom-models/custom_models/ifrs9/features.py    			-> compare working file with other git commit
By default, Vim folds unchanged lines. The zR command unfolds them all for you so you can see the whole file.
za command does the opposite. It folds the unchanged lines for you.
zo unfolds a section for you
zc folds the unfolded section back
If you need more context (The lines before and after a set of changes), use the :set diffopt=context=X to adjust the number of lines you wish to see

Git reset Head^ --soft	to undo a commit: this resets to commit before last, but unlike hard reset doesn't reset working directory

Git reset Head --hard	(check this before using) but presumably this will reset to last commit (including resetting working directory)
Git reset ORIGIN_HEAD --hard	could then presumably be used to undo the above hard reset as ORIG_HEAD stores state before hard actions such as resets

Git reset <filename> 	to unstage file (i.e. undo git add)
Git branch 		show local branches
Git branch -a 		show all branches available
Git fetch 		update branches shown in line above this
Git fetch -p		update branches and remove branches that have been merged or deleted

Git checkout commit 631182869dd1c8b3152855e2eba4b219f76c6e08		will take you back to old version of code (get from get log)
Git checkout -b STAR-38876/this-is-an-example.  (Pull from master first!)

Git diff filename 	show all changes made to file 
Git restore —staged filename 		to upstage file
Git restore —staged filename 		to upstage file
Git checkout ORIG_HEAD -- my-file.txt   to reset / restore file to origin head (-- means the next string is a file path)
Git branch -a 		show all branches available
Git fetch 		update branches shown in line above this
git branch -D branchname	delete local branch
Git fetch -p		update branches and remove branches that have been merged or deleted


If have made changes to branch that haven’t added -> can’t change branch without losing work
But could do
Git stash
Then change branch
Then change back to working branch
Git stash pop. (Note this is risky and can lose work!)
git stash list  			-> view list of stashes
git stash drop stash@{n}                -> drop certain stash
git stash clear				-> drop all stashes
git stash apply stash@{n}		-> apply certain stash number

git stash push -m "my_stash_name" 	-> name stash
git stash apply stash^{/my_stash_name}  -> apply stash with message
git stash apply <custom-name> 		-> apply stash with custom name



