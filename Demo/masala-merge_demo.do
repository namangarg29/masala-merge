
// ========= Setting things up ==============

clear

// This should be the path of directory with all files in Masala Merge Demo
global demo_path "C:\TheDrive\Studies\Formal\Columbia\Research\communal_violence\Codes\MasalaMerge_Demo"
cd "$demo_path"

// masala_merge also needs definition of temp directory and MASALA_PATH

* Specify temp directory
global tmp "$demo_path\Temp"

* This should be path where lev.py is stored. Current Directory
global MASALA_PATH "$demo_path"

// Source masala_merge
do masala_merge.do

// =============== Start (masala) merging =================
use Iyer_Districts, clear

// Let's first match Names of States

fix_spelling STATE_UT, src(Census_Districts.dta) gen("STATE_fixed")

// Wow, works perfectly. Now let's keep only fixed names and replace bad names
drop STATE_UT
drop STATE_fixed_dist
rename STATE_fixed STATE_UT



masala_merge STATE_UT using Census_Districts.dta, s1(NAME) outfile($tmp/foo)


// Awesome works
