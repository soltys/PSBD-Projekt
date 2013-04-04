@echo off

rem tworzenie katalogu tymczasowego
if not exist tmp mkdir tmp
rem skrypt do generacji doumentu PDF
rem wygenerowanie pierwszego pliku aux
pdflatex -file-line-error-style -output-directory=tmp -aux-directory=tmp -include-directory=tex tex/baza.tex
pdflatex -file-line-error-style -output-directory=tmp -aux-directory=tmp -include-directory=tex tex/baza.tex
rem tworzenie odwo³añ do bibliografii


rem i interaktywny pdf gotowy

move tmp\baza.pdf PSBD-projekt.pdf

