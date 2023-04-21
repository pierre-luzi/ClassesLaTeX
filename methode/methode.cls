\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{methode}[2022/07/27 Fiches outils]

\LoadClass[11pt,a4paper]{exam}
\RequirePackage{packages}
\RequirePackage{commandes}



%------------------------------
% Réglages de la classe
%------------------------------

\setlength{\dottedlinefillheight}{1cm} % espace vertical entre les lignes de réponse

% Commandes
% Page break entre plusieurs lignes de réponse
\makeatletter
\def\fillwithdottedlines#1{%
  \begingroup
  \ifhmode
    \par
  \fi
  \hrule height \z@
  \nobreak
  \setbox0=\hbox to \hsize{\hskip \@totalleftmargin
          \vrule height \dottedlinefillheight depth \z@ width \z@
          \dotfill}%
  % We use \cleaders (rather than \leaders) so that a given
  % vertical space will always produce the same number of lines
  % no matter where on the page it happens to start:
  \dimen0=\ht0
  \loop\ifdim\dimen0<#1\relax
    \advance\dimen0 by \ht0
    \copy0\space
  \repeat
  \endgroup
}
\makeatother

\newcommand\answerlines[1]{\fillwithdottedlines{#1.1\dottedlinefillheight}}
\setcounter{secnumdepth}{3} % profondeur de la numérotation

% Longueurs
\setlength{\dottedlinefillheight}{1cm} % espace vertical entre les lignes de réponse

% Compteurs
\newcounter{numero}

% Couleur de section
% \definecolor{title-color}{RGB}{255,0,0}

% Géométrie
% \newgeometry{left=1cm,right=1cm,top=1cm,bottom=1cm}




%------------------------------
% Options de la classe
%------------------------------

% Niveau
\newcommand\niveau{}
\DeclareOption{2nde}{\renewcommand\niveau{\selectfont\sffamily\bfseries{Physique-chimie 2\up{nde}}}}
\DeclareOption{1ere}{\renewcommand\niveau{\selectfont\sffamily\bfseries{Physique-chimie 1\iere}}}
\DeclareOption{tstl}{\renewcommand\niveau{\selectfont\sffamily\bfseries{Physique-chimie Terminale STL}}}

% Dyslexie
\newcommand\dysnewpage{}
\DeclareOption{dys}{
	\renewcommand\normalsize{%
	   \@setfontsize\normalsize{14}{20}%
	   \abovedisplayskip 14pt \@plus 2pt \@minus 5pt
	}

	\renewcommand{\familydefault}{\sfdefault}
	\newgeometry{left=1cm,right=1cm,top=1cm,bottom=1cm}

	\renewcommand\dysnewpage{\newpage}
}

% Options par défaut
\ExecuteOptions{2nde}

\ProcessOptions



%------------------------------
% Titre
%------------------------------

\newcommand\titre[1]{
	\begin{tikzpicture}[remember picture, overlay]
		\node[yshift=-3cm] at (current page.north west) {
			\begin{tikzpicture}[remember picture, overlay, xshift=1cm]
				\fill[purple!40, rounded corners=10pt] (-0.5cm,0) rectangle (\linewidth+0.5cm,2cm);
				\fill[purple!40, rounded corners=10pt] (1.4cm,0) rectangle (\linewidth+0.5cm,2cm) node[midway, white, yshift=0.55cm] {\bfseries\sffamily\Large Fiche outils~\thenumero} node[midway, white, yshift=-0.35cm] {\bfseries\sffamily\huge#1};
				\fill[purple!70, rounded corners=10pt] (-0.5cm,0) rectangle (1.4cm,2cm) node[midway, scale=1.2] {\color{white}{\fontsize{24pt}{29pt}\bfseries\sffamily\includegraphics[height=1cm]{logo}}};
			\end{tikzpicture}
		};
	\end{tikzpicture}

	\vspace{1cm}
}



\newcommand\blanktitre{
	\begin{tikzpicture}[remember picture, overlay]
		\node[yshift=-3cm] at (current page.north west) {
			\begin{tikzpicture}[remember picture, overlay, xshift=1cm]
				\fill[white, rounded corners=10pt] (-0.5cm,0) rectangle (\linewidth+0.5cm,2cm);
			\end{tikzpicture}
		};
	\end{tikzpicture}

	\vspace{0.7cm}
}



%------------------------------
% Sections
%------------------------------

\newcommand\SecTitle[1]{%
  \begin{tikzpicture}
    \coordinate (bottom) at (40pt, -9pt);
    \coordinate (top) at (65pt, 9pt);
    \draw[purple!70, fill=purple!70, rounded corners] (bottom) rectangle (top);
    \node (subsec) at ($(bottom)!0.5!(top)$) {\color{white}\fontsize{14pt}{20pt}\selectfont\sffamily\bfseries{\thesection}};
    \draw[purple!70] (subsec.north east) node[anchor=north west] {\hspace{5pt}\fontsize{14pt}{20pt}\selectfont\sffamily\bfseries{#1}};
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
\titlespacing{\section}{0pt}{15pt minus 0.2cm}{0pt minus 0.3cm}



%------------------------------
% Sous-sections
%------------------------------

\newcommand\SubsecTitle[1]{%
  \begin{tikzpicture}
    \coordinate (bottom) at (40pt, -9pt);
    \coordinate (top) at (110pt, 9pt);
    \draw[purple!70, fill=purple!70, rounded corners] (bottom) rectangle (top);
    \node (subsec) at ($(bottom)!0.5!(top)$) {\color{white}\fontsize{14pt}{20pt}\selectfont\sffamily\bfseries{Activité \thesubsection}};
    \draw[purple!70] (subsec.north east) node[anchor=north west] {\hspace{5pt}\fontsize{14pt}{20pt}\selectfont\sffamily\bfseries{#1}};
\end{tikzpicture}
}

\renewcommand\thesubsection{\alph{subsection}}
\titleformat{\subsection}[display]
            {\fontsize{12pt}{18pt}\selectfont\sffamily\bfseries}
            {\textcolor{purple!40}{\thesubsection. #1}}
            {0pt}{}
\titleformat{name=\subsection,numberless}[display]
            {\fontsize{12pt}{18pt} \selectfont \bfseries}
            {#1}
            {0pt}{}
\titlespacing{\subsection}{1cm}{0.3cm}{-0.5cm}



%------------------------------
% En-têtes et pieds de page
%------------------------------

% la classe exam définit ses propres headers/footers et n'est pas compatible avec le package fancyhdr

\makeatletter
\patchcmd{\run@fullhead}{\hrule}{\color{purple!70}\hrule height 1.5pt}{}{}
\makeatother

% En-tête
\runningheader{\color{purple!70}\selectfont\sffamily\bfseries{Fiche outils~\thenumero}}{}{\color{purple!70}\selectfont\sffamily\bfseries{Physique-chimie}}
\runningheadrule

% Pied de page
\extrafootheight{0.7cm}
\footrule
\footer{Lycée Simone Veil}{\thepage}{M. {\bsc{Luzi}}}

% \makeatletter
% \patchcmd{\run@fullhead}{\hrule}{\color{\coloract}\hrule height 1.5pt}{}{}
% \makeatother
%
% % En-tête
% % \renewcommand{\sectionmark}[1]{\markboth{Chapitre \thechapitre~:~#1}{}} % numéro du chapitre
% \runningheader{\color{\coloract}\selectfont\sffamily\bfseries{\matiere\theact~:~\titreseance}}{}{\niveau}
% \runningheadrule
%
% % Pied de page
% \extrafootheight{0.7cm}
% \footrule
% \footer{Lycée de Boulogne-Billancourt}{\thepage}{2021-2022}



%------------------------------
% Commandes
%------------------------------

\mdfdefinestyle{exemple}{
	linecolor                 = DarkBlueChapter,
	linewidth                 = 1pt,
	frametitle                = Exemple,
	frametitlefont            = {\normalfont\bf\sffamily\color{DarkBlueChapter}},
	backgroundcolor           = white
}
