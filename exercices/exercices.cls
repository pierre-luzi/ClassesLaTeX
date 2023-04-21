\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{exercices}[2022/14/13 Exercices]

\LoadClass[11pt,a4paper]{exam}
\RequirePackage{packages}
\RequirePackage{commandes}



%------------------------------
% Réglages de la classe
%------------------------------

% Longueurs 
\setlength{\columnsep}{1.2cm}
\setlength{\columnseprule}{0.4pt}

% Compteurs
\setcounter{secnumdepth}{1} % profondeur de la numérotation
\newcounter{chapitre}

% Chapitre
\newcommand\titrechapitre{}

% Couleur de section
\definecolor{title-color}{RGB}{255,0,0}

% Booléen pour la correction
\ifthenelse{\equal{\detokenize{correction}}{\jobname}}{
	\printanswers
}{
	\noprintanswers
}



%------------------------------
% Options de la classe
%------------------------------

% Matière
\newcommand\matiere{}
\newcommand\headmatiere{}
\DeclareOption{chi}{
	% \renewcommand\matiere{\raisebox{5pt}{\boldmath$\upchi$}}
	% \renewcommand\headmatiere{\raisebox{2.35pt}{\boldmath$\upchi$}}
	\renewcommand\matiere{C}
	\renewcommand\headmatiere{C}
}
\DeclareOption{phy}{
	% \renewcommand\matiere{\raisebox{3pt}{\boldmath$\upphi$}}
	% \renewcommand\headmatiere{\raisebox{1.5pt}{\boldmath$\upphi$}}
	\renewcommand\matiere{P}
	\renewcommand\headmatiere{P}
}

% Niveau
\newcommand\niveau{}
\DeclareOption{2nde}{\renewcommand\niveau{\selectfont\sffamily\bfseries{Physique-chimie 2\up{nde}}}}
\DeclareOption{1ere}{\renewcommand\niveau{\selectfont\sffamily\bfseries{Physique-chimie 1\iere}}}
\DeclareOption{Tspe}{\renewcommand\niveau{\selectfont\sffamily\bfseries{Physique-chimie Terminale}}}
\DeclareOption{1es}{\renewcommand\niveau{\selectfont\sffamily\bfseries{Enseignement scientifique 1\iere}}}
\DeclareOption{Tes}{\renewcommand\niveau{\selectfont\sffamily\bfseries{Enseignement scientifique Terminale}}}
\DeclareOption{tstl}{\renewcommand\niveau{\selectfont\sffamily\bfseries{Physique-chimie Terminale STL}}}

% Dyslexie
\newcommand\dysnewpage{}
\DeclareOption{dys}{
	\renewcommand\normalsize{%
	   \@setfontsize\normalsize{14}{20}%
	   \abovedisplayskip 14pt \@plus 2pt \@minus 5pt
	}

	\renewcommand{\familydefault}{\sfdefault}
	\newgeometry{left=1cm,right=1cm,top=2cm,bottom=1.5cm}

	\renewcommand\dysnewpage{\newpage}
}

% Options par défaut
\ExecuteOptions{2nde}

\ProcessOptions



%------------------------------
% Titre
%------------------------------

\newcommand\titre[1]{
  \renewcommand\titrechapitre{#1}

  \begin{tikzpicture}[remember picture, overlay]
    \node[yshift=-3cm] at (current page.north west)
         {
           \begin{tikzpicture}[remember picture, overlay, xshift=1cm]
             \fill[red] (-0.5cm,0) rectangle (1.8cm,2cm) node[midway, yshift=0.55cm] {\color{white}\bfseries\sffamily\small Exercices}
             node[midway, yshift=-0.3cm, scale=1.2] {\color{white}{\fontsize{24pt}{29pt}\bfseries\sffamily\matiere\thechapitre}};
             \fill[red!40] (1.8cm,0) rectangle (\linewidth+0.5cm,2cm);% node[midway, white] {\Huge\bfseries#1};
             \node[white,anchor=west,xshift=2.2cm,yshift=1cm,align=left] {\bfseries\sffamily\Huge#1};
           \end{tikzpicture}
         };
  \end{tikzpicture}
  
  \vspace{1cm}
}



%------------------------------
% Sections
%------------------------------

\newcommand\SecTitle[1]{%
  \begin{tikzpicture}
    \coordinate (bottom) at (40pt, -7pt);
    \coordinate (top) at (60pt, 7pt);
    \draw[color=title-color, fill=title-color, rounded corners] (bottom) rectangle (top);
    \node (subsec) at ($(bottom)!0.5!(top)$) {\color{white}\fontsize{13pt}{16pt}\selectfont\sffamily\bfseries{\thesection}};
    \draw[color=title-color] (subsec.north east) node[anchor=north west] {\hspace{5pt}\fontsize{13pt}{16pt}\selectfont\sffamily\bfseries{#1}};
\end{tikzpicture}
}

\titleformat{\section}[block]
            {\gdef\sectionlabel{}\fontsize{14pt}{20pt}\selectfont\sffamily}
            {\gdef\sectionlabel{\thesection #1}}
            {0pt}{\SecTitle{#1}}
\titleformat{name=\section,numberless}[display]
            {\fontsize{14pt}{12pt} \selectfont \bfseries}
            {#1}
            {0pt}{}
\titlespacing{\section}{0pt}{0.3cm plus 0.5cm}{-5pt}



%------------------------------
% En-têtes et pieds de page
%------------------------------

% la classe exam définit ses propres headers/footers et n'est pas compatible avec le package fancyhdr

\makeatletter
\patchcmd{\run@fullhead}{\hrule}{\color{red}\hrule height 1.5pt}{}{}
\makeatother

% En-tête
% \renewcommand{\sectionmark}[1]{\markboth{\headmatiere\thechapitre~:~#1}{}} % numéro du chapitre
% \runningheader{\color{black}\selectfont\sffamily\bfseries{\leftmark}}{}{\niveau}
\runningheader{\color{red}\selectfont\sffamily\bfseries{\headmatiere\thechapitre~:~\titrechapitre}}{}{\color{red}\niveau}
\runningheadrule

% Pied de page
\extrafootheight{0.7cm}
\footrule
\footer{Lycée Simone Veil}{\thepage}{M. {\bsc{Luzi}}}



%------------------------------
% Commandes
%------------------------------

% Chargement des énoncés
%\newcommand\inputexo[1]{\input{enonces/#1}}
\newcommand\inputexo[2][Exercice~\thesection]{
  \section{#1}
  \input{enonces/#2}
}



%------------------------------
% Environnements
%------------------------------

% Exercices d'application
\newenvironment{application}
{
  \definecolor{title-color}{RGB}{255,0,0}
  
  \begin{center}
    \begin{minipage}{0.35\linewidth}
      \begin{mdframed}[roundcorner=10pt, linecolor=title-color, backgroundcolor=title-color]
        \centering
        {\bfseries\sffamily\Large\color{white}Exercices d'application}
      \end{mdframed}
    \end{minipage}
  \end{center}

  \begin{multicols}{2}
}
{
  \end{multicols}
  \vspace{0.4cm}
}

% Exercices d'entraînement
\newenvironment{entrainement}
{
  \definecolor{title-color}{RGB}{52,120,255}
  
  \dysnewpage
  \begin{center}
    \begin{minipage}{0.35\linewidth}
      \begin{mdframed}[roundcorner=10pt, linecolor=title-color, backgroundcolor=title-color]
        \centering
        {\bfseries\sffamily\Large\color{white}Entraînement}
      \end{mdframed}
    \end{minipage}
  \end{center}

  \begin{multicols}{2}
}
{
  \end{multicols}
  \vspace{0.4cm}
}

% Exercices d'approfondissement
\newenvironment{approfondissement}
{
  \definecolor{title-color}{RGB}{144,2,188}
  \dysnewpage
  \begin{center}
    \begin{minipage}{0.35\linewidth}
      \begin{mdframed}[roundcorner=10pt, linecolor=title-color, backgroundcolor=title-color]
        \centering
        {\bfseries\sffamily\Large\color{white}Approfondissement}
      \end{mdframed}
    \end{minipage}
  \end{center}

  \vspace{-1cm}
}
{
  \vspace{0.4cm}
}
