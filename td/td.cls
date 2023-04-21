\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{td}[2020/02/05 TD]

\LoadClassWithOptions{exam}
\RequirePackage{packages}
\RequirePackage{commandes}



%------------------------------
% Réglages de la classe
%------------------------------

% Longueurs 
\setlength{\columnsep}{1.2cm}
\setlength{\columnseprule}{0.4pt}

% Compteurs
\setcounter{secnumdepth}{3} % profondeur de la numérotation
\newcommand\theme{}

% Couleur de section
\definecolor{title-color}{RGB}{255,0,0}



%------------------------------
% Options de la classe
%------------------------------

% Matière
\newcommand\secmatiere{}
\newcommand\headmatiere{}
\DeclareOption{chi}{
  \renewcommand\secmatiere{\raisebox{5pt}{\boldmath$\upchi$}}
  \renewcommand\headmatiere{\raisebox{2.35pt}{\boldmath$\upchi$}}
}
\DeclareOption{phy}{
  \renewcommand\secmatiere{\raisebox{3pt}{\boldmath$\upphi$}}
  \renewcommand\headmatiere{\raisebox{1.5pt}{\boldmath$\upphi$}}
}

% Niveau
\newcommand\niveau{}
\DeclareOption{2nde}{\renewcommand\niveau{\selectfont\sffamily\bfseries{Physique-chimie 2\up{nde}}}}
\DeclareOption{1spe}{\renewcommand\niveau{\selectfont\sffamily\bfseries{Physique-chimie 1\iere}}}
\DeclareOption{Tspe}{\renewcommand\niveau{\selectfont\sffamily\bfseries{Physique-chimie Terminale}}}
\DeclareOption{1es}{\renewcommand\niveau{\selectfont\sffamily\bfseries{Enseignement scientifique 1\iere}}}
\DeclareOption{Tes}{\renewcommand\niveau{\selectfont\sffamily\bfseries{Enseignement scientifique Terminale}}}
\DeclareOption{PT}{\renewcommand\niveau{\selectfont\sffamily\bfseries{Physique-chimie PT$^*$}}}


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
% Partie
%------------------------------

\newcommand{\titre}[2][]{
	\renewcommand\theme{#1}
	\begin{tikzpicture}[remember picture, overlay]
		\node[yshift=-3cm] at (current page.north west)
		     {
				\begin{tikzpicture}[remember picture, overlay, xshift=1cm]
				\fill[red] (-0.5cm,0) rectangle (1.4cm,2cm) node[midway, yshift=0.52cm] {\color{white}\bfseries\sffamily\small Exercices} node[midway, yshift=-0.3cm, scale=1] {\color{white}{\fontsize{24pt}{29pt}\bfseries\sffamily\theme}};
				\fill[red!40] (1.4cm,0) rectangle (\linewidth+0.5cm,2cm);% node[midway, white] {\Huge\bfseries#1};
				\node[white,anchor=west,xshift=1.8cm,yshift=1cm,align=left] {\bfseries\sffamily\Huge#2};
				\end{tikzpicture}
			};
		\end{tikzpicture}
}




%------------------------------
% Section
%------------------------------

\newcommand\SecTitle[1]{%
  \begin{tikzpicture}
    \draw[DarkBlueChapter, fill=DarkBlueChapter] (0,-10pt) rectangle (40pt,10pt)
    node[pos=0.5, white, anchor=center] {\fontsize{14pt}{20pt}\selectfont\sffamily\bfseries{\theme\thesection}};
    \node[DarkBlueChapter, anchor=west, xshift=40pt, align=left] {\fontsize{14pt}{20pt}\selectfont\sffamily\bfseries{#1}};
    \draw[DarkBlueChapter, thick] (0,-10pt) -- (\linewidth,-10pt);
\end{tikzpicture}
}

%\renewcommand\thesection{\Roman{section}}

\titleformat{\section}[block]
            {\gdef\sectionlabel{}\fontsize{14pt}{20pt}\selectfont\sffamily}
            {\gdef\sectionlabel{\thesection #1}}
            {0pt}{\SecTitle{#1}}
\titleformat{name=\section,numberless}[display]
            {\fontsize{14pt}{12pt} \selectfont \bfseries}
            {#1}
            {0pt}{}
\titlespacing{\section}{0pt}{0.7cm}{-20pt}



%------------------------------
% Sous-sections
%------------------------------

\newcommand\SubsecTitle[1]{%
  \begin{tikzpicture}
    \coordinate (bottom) at (40pt, -7pt);
    \coordinate (top) at (90pt, 7pt);
    \draw[color=title-color, fill=title-color, rounded corners] (bottom) rectangle (top);
    \node (subsec) at ($(bottom)!0.5!(top)$) {\color{white}\fontsize{13pt}{16pt}\selectfont\sffamily\bfseries{\theme\thesection.\thesubsection}};
    \draw[color=title-color] (subsec.north east) node[anchor=north west] {\hspace{5pt}\fontsize{13pt}{16pt}\selectfont\sffamily\bfseries{#1}};
\end{tikzpicture}
}

\renewcommand\thesubsection{\arabic{subsection}}
\titleformat{\subsection}[block]
            {\gdef\subsectionlabel{}\fontsize{13pt}{16pt}\selectfont\sffamily\bfseries}
            {\gdef\subsectionlabel{\thesection #1}}
            {0pt}{\SubsecTitle{#1}}
\titleformat{name=\subsection,numberless}[display]
            {\fontsize{13pt}{16pt} \selectfont \bfseries}
            {#1}
            {0pt}{}
\titlespacing{\subsection}{0pt}{0.5cm}{0pt}



%------------------------------
% En-têtes et pieds de page
%------------------------------

% la classe exam définit ses propres headers/footers et n'est pas compatible avec le package fancyhdr

\makeatletter
\patchcmd{\run@fullhead}{\hrule}{\color{black}\hrule height 1.5pt}{}{}
\makeatother

% En-tête
% \renewcommand{\sectionmark}[1]{\markboth{\headmatiere\thechapitre~:~#1}{}} % numéro du chapitre
\runningheader{\color{black}\selectfont\sffamily\bfseries{\leftmark}}{}{\niveau}
\runningheadrule

% Pied de page
\extrafootheight{0.7cm}
\footrule
\footer{Lycée Jean-Baptiste Say}{\thepage}{2019-2020}



%------------------------------
% Commandes
%------------------------------

% Chargement des énoncés
\newcommand\inputexo[2][Exercice~\thesubsection]{
  \subsection{#1}
  \input{#2}
}

% Structure d'un exercice
\newcommand\exercice[2]{
  \ifprintanswers
  % correction
  #2
  \else
  % énoncé
  #1
  \fi
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
