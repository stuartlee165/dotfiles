# ######### #
#  python   #
#  project  #
# structure #
# ######### #




new_project
├── antigravity
│   ├── __init__.py         # make it a package
│   └── antigravity.py
└── test
    ├── __init__.py         # also make test a package
    └── test_antigravity.py
And in the test modules inside the test package, you can import the antigravity package and its modules as usual:

# import the package
import antigravity

# import the antigravity module
from antigravity import antigravity

# or an object inside the antigravity module
from antigravity.antigravity import my_object

tests testing pytest
python -m pytest
folder structure:



