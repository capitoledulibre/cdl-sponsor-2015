%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Classe de document pour la mise en page du dossier de sponsoring
% du Capitole du Libre
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cdl_sponsor}

\LoadClass[a4paper,12pt]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Packages

% Polices
%\RequirePackage{microtype}
\usepackage{xltxtra}
% ⇒ installer la font sur la machine.

\usepackage[francais]{babel}
\usepackage{tgadventor}
%\renewcommand*\familydefault{\sfdefault} %% Only if the base font of the document is to be sans serif
%\usepackage[T1]{fontenc}

% Mise en page
\RequirePackage{fancyhdr}
\RequirePackage[bookmarks=false,
                unicode=true,
                pdffitwindow=true,
                colorlinks=true,
                urlcolor=Cdl,
                citecolor=Cdl,
                filecolor=Cdl,
                allcolors=Cdl]{hyperref}
\usepackage{titlesec}

% Graphique
\RequirePackage{graphicx}
\RequirePackage{wallpaper}
\RequirePackage{tikz}
\RequirePackage{wrapfig}
\definecolor{white}{rgb}{1,1,1}
\definecolor{Cdl}{rgb}{0.81,0.24,0.00}
\definecolor{Cdlblue}{rgb}{0.00,0.57,0.81}
\definecolor{Cdlblack}{rgb}{0.15,0.04,0.00}
\graphicspath{ {Images/}{Photos/} }

% Utile
\RequirePackage{ifthen}
\RequirePackage{ifpdf}
\RequirePackage{lastpage}
\usepackage{pifont}
\usepackage{multirow}
\usepackage{enumitem}
\usepackage{multicol}
\usepackage{mparhack, manfnt}
\usepackage{svg}
\usepackage{nicefrac}
\usepackage{units}
\usepackage{pgf-pie}
%\setsvg{inkscape = inkscape -z -D}

% Divers 

\usepackage{eurosym}
\usepackage{siunitx}
\usepackage[francais]{babel}
\usepackage{pifont}
\newcommand{\logo}{\textcolor{Cdl}{\ding{'340}}}
\newcommand{\urllogoau}[2]{\href{#1}{\includegraphics[width=4cm]{Images/#2}}}
\newcommand{\urllogoag}[2]{\href{#1}{\includegraphics[width=3cm]{Images/#2}}}
\newcommand{\urllogobr}[2]{\href{#1}{\includegraphics[width=2cm]{Images/#2}}}

\usepackage{array,multirow,makecell}
\usepackage{colortbl}

% Macro

\newcommand{\g}[1]{\og #1 \fg{}}

\newcommand{\HRule}[1]{\hfill \rule{0.2\linewidth}{#1}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Constantes

% Séparateur
\newcommand{\Separateur}{\vspace*{0.5\baselineskip}}

% Espace de début de paragraphe
\setlength{\parindent}{0cm}

% Espace après le paragraphe
\setlength{\parskip}{0.25\baselineskip}

% Marges
\setlength{\hoffset}{0pt}
\setlength{\oddsidemargin}{0pt}
\setlength{\marginparsep}{0pt}
\setlength{\marginparwidth}{0pt}
\setlength{\marginparpush}{0pt}

\setlength{\voffset}{0pt}
\setlength{\topmargin}{0pt}
\setlength{\headheight}{0pt}
\setlength{\headsep}{0pt}

\setlength{\footskip}{40pt}

\setlength{\textwidth}{448pt}
\setlength{\textheight}{650pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Variables

% Titre du document (utiliser \DefTitre pour le changer)
\newcommand{\Titre}{}
\newcommand{\DefTitre}[1]{\renewcommand{\Titre}{#1}}
\DefTitre{Titre inconnu} % Valeur par défaut

% Sous-titre du document (utiliser \DefSousTitre pour le changer)
\newcommand{\SousTitre}{}
\newcommand{\DefSousTitre}[1]{\renewcommand{\SousTitre}{#1}}
\DefSousTitre{Sous-titre inconnu} % Valeur par défaut

% Auteur du document (utiliser \DefAuteur pour le changer)
\newcommand{\Auteur}{}
\newcommand{\DefAuteur}[1]{\renewcommand{\Auteur}{#1}}
\DefAuteur{Auteur inconnu} % Valeur par défaut

% Page web (utiliser \DefWeb pour le changer)
\newcommand{\Web}{}
\newcommand{\DefWeb}[1]{\renewcommand{\Web}{#1}}
\DefWeb{http://} % Valeur par défaut

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Création du titre
%  #1  : Image d'arrière-plan du titre
%  #2  : Crédits pour l'image
\newcommand{\CreerTitre}[2]{
  \begingroup
    \begin{tikzpicture}[remember picture, overlay]
      \node at (current page.north west){
        \begin{tikzpicture}[remember picture, overlay]
          % Noeud dont l'origine en haut à gauche est décalée de 0.14 vers la
          % gauche pour éviter une bande blanche incompréhensible.
          \node[anchor=north west, inner sep=0] at (-0.14,0){
            \ifthenelse{\equal{#1}{}}{}{
              \includegraphics[width=\paperwidth, height=0.35\paperheight]{#1}
            }
          };
          \node[anchor=west, text opacity=0.9] at (0,-0.34\paperheight){
            \footnotesize\textcolor{gray}{\textbf{#2}}
          };
          \draw[anchor=north] (0.5\paperwidth,-0.35\paperheight) node[fill=black, inner sep=5] {
            \huge\textcolor{white}{\hspace{0.05\paperwidth}\textbf{\bsc{\Titre}}\hspace{0.05\paperwidth}}
          };
        \end{tikzpicture}
      };
    \end{tikzpicture}
  \endgroup

  \par\vspace*{0.4\paperheight}

  \begingroup
    \begin{center}
      \Huge\bsc{\bsc{\SousTitre}}
      \par\vspace*{-0.015\paperheight}
      \begin{tikzpicture}
        \draw[line width=2pt] (0,0) -- (\textwidth-2pt,0);
      \end{tikzpicture}
    \end{center}
  \endgroup

  \par\vspace*{0.04\paperheight}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Insertion d'une photo
%  #1  : Image d'arrière-plan du titre
%  #2  : Crédits pour l'image
\newcommand{\InsertPhoto}[2]{
	\ifthenelse{\equal{#1}{}}{}{
	  \includegraphics[width=1.0\textwidth]{#1}
	}
	\footnotesize{\textbf{#2}}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% En-têtes et pieds de page
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyfoot[L]{\footnotesize{\Titre\\\url{\Web}}}
%\fancyfoot[C]{\footnotesize{\textit{~\\\SousTitre}}}
\fancyfoot[C]{\footnotesize{\textit{~ \\\SousTitre}}}
\fancyfoot[R]{
	%\colorbox{Cdl}{
		\footnotesize{~ \\\thepage/\pageref*{LastPage}}
	%}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Environnement pour la mise en page de l'introduction
\newenvironment{Introduction}{}{\newpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mise en page des sections
\makeatletter
\def\section#1{
  \vspace*{\baselineskip}
  \begingroup
    \noindent
    \leavevmode\Large\bfseries\raggedright\textcolor{Cdl}{#1}\par\nobreak
  \endgroup
  \vspace*{-0.01\paperheight}
  \noindent\textcolor{Cdl}{\hrulefill}\nobreak
  \vspace*{0.25\baselineskip}
  \vskip 1ex\nobreak
}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mise en page des sous-sections
\makeatletter
\def\subsection#1{
  \vspace*{0.5\baselineskip}
  \begingroup
    \noindent
    \leavevmode\large\bfseries\raggedright\textcolor{Cdl}{#1}\par\nobreak
  \endgroup
  \vspace*{0.25\baselineskip}
}
\makeatother


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Inclusion d'image dans le texte

% InsertImage
%  #1 : Nom du fichier
%  #2 : Largeur
%  #3 : alignement gauche ou droite

\newcommand{\InsertImage}[3]{
  \begin{wrapfigure}{#3}{#2\textwidth}
  	\vspace{-1.5\baselineskip}
    \centering
    \includegraphics[width=#2\textwidth]{#1}
  	\vspace{-3.0\baselineskip}
  \end{wrapfigure}
}

\newcommand{\ImageDroite}[1]{
  \begin{wrapfigure}{r}{0.33334\textwidth}
    \centering
    \includegraphics[width=0.33334\textwidth]{#1}
  \end{wrapfigure}
}

\newcommand{\ImageDroitebis}[1]{
  \begin{wrapfigure}{r}{0.15\textwidth}
    \centering
    \includegraphics[width=0.15\textwidth]{#1}
  \end{wrapfigure}
}

\newcommand{\ImageGauche}[1]{
  \begin{wrapfigure}{l}{0.4\textwidth}
    \centering
    \includegraphics[width=0.4\textwidth]{#1}
  \end{wrapfigure}
}

\renewcommand{\citation}[2]{
\vspace{5mm}
\hspace{15mm}{\fontsize{72}{72}\selectfont \textcolor{Cdl}{“}}\vspace{-18mm}
\begin{flushright}
	\begin{minipage}{0.8\textwidth}
		\begin{flushleft}
			\large \textit{\og #1 \fg{}} \\
		\end{flushleft}
		\begin{flushright}\vspace{-5mm}
			{\normalsize #2}
		\end{flushright}
	\end{minipage}
\end{flushright}
\begin{flushright}
\end{flushright}\vspace{-5mm}
}

\newcommand{\citationen}[2]{
\vspace{5mm}
\hspace{15mm}{\fontsize{72}{72}\selectfont \textcolor{Cdl}{“}}\vspace{-18mm}
\begin{flushright}
	\begin{minipage}{0.8\textwidth}
		\begin{flushleft}
			\large \textit{“#1”} \\
		\end{flushleft}
		\begin{flushright}\vspace{-5mm}
			{\normalsize #2}
		\end{flushright}
	\end{minipage}
\end{flushright}
\begin{flushright}
\end{flushright}\vspace{-5mm}
}


\newcommand{\image}[2]{
    \centering
    \includegraphics[width=#2]{Images/#1}
  }


\newcommand{\photo}[2]{
    \centering
	\includegraphics[width=#2]{Photos/#1}
  }