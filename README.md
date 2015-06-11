# Dossier sponsoring Cdl 2015

Installer la police linux-libertine et linux biolinum,
et d'autres paquets fournissants siunitx.sty, francais.ldf

	sudo apt-get install texlive-xetex texlive-latex-extra texlive-fonts-extra
	sudo apt-get install texlive-science texlive-lang-french

Si néanmoins il manque des paquets

	sudo apt-get install texlive-full

Compilation du document (2 fois consécutive) : 

	xelatex sponsor_cdl15.tex
