# OL-extract
Extract useable numbers from published orienteering results

Results of orienteering meets (specifically, the _splits_ table giving times for each competitor and each control) are usually presented in a hard-to parse way: Two lines per competitor (split and leg time) are layed out with blanks and newlines only (no HTML table). Moreover, these two lines are wrapped as a pair (so line 1 continues as line 3, 2 continues as 4).

Therefore, importing times into a spreadsheet to perform post-race analysis is a hassle.
OL-extract is a simple bash/awk script that can be used to convert split times into a useable format:

    extract.sh infile.txt |xclip -selection clipboard
