
// ========= Setting things up ==============
clear

// Start in the "Demo" Directory of reposirtory for this code to work
local dir `c(pwd)'

// masala_merge also needs definition of temp directory and MASALA_PATH

* Specify temp directory
global tmp "`dir'\Temp"

* This should be path where lev.py is stored.
cd ..
global MASALA_PATH `c(pwd)'
cd "`dir'"

// Source masala_merge
do "$MASALA_PATH\masala_merge.do"

// =============== Start (masala) merging =================
use Iyer_Districts, clear

// Let's first match Names of States

fix_spelling STATE_UT, src(Census_Districts.dta) gen("STATE_fixed")

// Wow, works perfectly. Now let's keep only fixed names fo states and replace bad names
drop STATE_UT
drop STATE_fixed_dist
rename STATE_fixed STATE_UT


// Masala Merge of names of districts
masala_merge STATE_UT using Census_Districts.dta, s1(NAME) outfile($tmp/foo)
