\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{activites}[2020/06/13 Activites documentaires]

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
\setcounter{secnumdepth}{3} % profondeur de la numérotation
\newcounter{chapitre}
\newcounter{act}

% Couleur de section
% \definecolor{title-color}{RGB}{255,0,0}

% Géométrie
% \newgeometry{left=1cm,right=1cm,top=1cm,bottom=1cm}




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


% Type d'activité
\newcommand\typeact{}
\newcommand\coloract{}
\newcommand\lightcoloract{}
\DeclareOption{doc}{
	\renewcommand\typeact{documentaire}
	\renewcommand\coloract{red}
	\renewcommand\lightcoloract{red!40}
	\newgeometry{left=1cm,right=1cm,top=1cm,bottom=1.5cm}
	\pagestyle{empty}
}
\DeclareOption{exp}{
	\renewcommand\typeact{expérimentale}
	\renewcommand\coloract{darkgreen}
	\renewcommand\lightcoloract{darkgreen!50}
	% \renewcommand\coloract{black}
	% \renewcommand\lightcoloract{black!50}
}
\DeclareOption{num}{
	\renewcommand\typeact{numérique}
	\renewcommand\coloract{blue}
	\renewcommand\lightcoloract{blue!50}
}

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
\ExecuteOptions{doc}

\ProcessOptions



%------------------------------
% Titre
%------------------------------

\newcommand\titreno[2]{
	\begin{tikzpicture}[remember picture, overlay]
		\node[yshift=-3cm] at (current page.north west) {
			\begin{tikzpicture}[remember picture, overlay, xshift=1cm]
				\fill[\lightcoloract, rounded corners=10pt] (-0.5cm,0) rectangle (\linewidth+0.5cm,2cm);
				\fill[\lightcoloract, rounded corners=10pt] (1.4cm,0) rectangle (\linewidth+0.5cm,2cm) node[midway, white, yshift=0.55cm] {\bfseries\sffamily\Large#1~---~Activité \typeact{} \theact} node[midway, white, yshift=-0.35cm] {\bfseries\sffamily\huge#2};
				\fill[\coloract, rounded corners=10pt] (-0.5cm,0) rectangle (1.4cm,2cm) node[midway, yshift=0.55cm] {\color{white}\bfseries\sffamily\small Chapitre} node[midway, yshift=-0.3cm, scale=1.2] {\color{white}{\fontsize{24pt}{29pt}\bfseries\sffamily\matiere\thechapitre}};
			\end{tikzpicture}
		};
	\end{tikzpicture}

	\vspace{1.5cm}
}



\newcommand\titre[2]{
	\begin{tikzpicture}[remember picture, overlay]
		\node[yshift=-3cm] at (current page.north west) {
			\begin{tikzpicture}[remember picture, overlay, xshift=1cm]
				\fill[\lightcoloract, rounded corners=10pt] (-0.5cm,0) rectangle (\linewidth+0.5cm,2cm);
				\fill[\lightcoloract, rounded corners=10pt] (1.4cm,0) rectangle (\linewidth+0.5cm,2cm) node[midway, white, yshift=0.55cm] {\bfseries\sffamily\Large#1~---~Activité \typeact{}} node[midway, white, yshift=-0.35cm] {\bfseries\sffamily\huge#2};
				\fill[\coloract, rounded corners=10pt] (-0.5cm,0) rectangle (1.4cm,2cm) node[midway, yshift=0.55cm] {\color{white}\bfseries\sffamily\small Chapitre} node[midway, yshift=-0.3cm, scale=1.2] {\color{white}{\fontsize{24pt}{29pt}\bfseries\sffamily\matiere\thechapitre}};
			\end{tikzpicture}
		};
	\end{tikzpicture}

	\vspace{1.5cm}
}



\newcommand\blanktitre{
	\begin{tikzpicture}[remember picture, overlay]
		\node[yshift=-3cm] at (current page.north west) {
			\begin{tikzpicture}[remember picture, overlay, xshift=1cm]
				\fill[white, rounded corners=10pt] (-0.5cm,0) rectangle (\linewidth+0.5cm,2cm);
			\end{tikzpicture}
		};
	\end{tikzpicture}

	\vspace{1.5cm}
}



%------------------------------
% Sections
%------------------------------

\newcommand\SecTitle[1]{%
  \begin{tikzpicture}
    \coordinate (bottom) at (40pt, -9pt);
    \coordinate (top) at (65pt, 9pt);
    \draw[\coloract, fill=\coloract, rounded corners] (bottom) rectangle (top);
    \node (subsec) at ($(bottom)!0.5!(top)$) {\color{white}\fontsize{14pt}{20pt}\selectfont\sffamily\bfseries{\thesection}};
    \draw[\coloract] (subsec.north east) node[anchor=north west] {\hspace{5pt}\fontsize{14pt}{20pt}\selectfont\sffamily\bfseries{#1}};
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
    \draw[\coloract, fill=\coloract, rounded corners] (bottom) rectangle (top);
    \node (subsec) at ($(bottom)!0.5!(top)$) {\color{white}\fontsize{14pt}{20pt}\selectfont\sffamily\bfseries{Activité \thesubsection}};
    \draw[\coloract] (subsec.north east) node[anchor=north west] {\hspace{5pt}\fontsize{14pt}{20pt}\selectfont\sffamily\bfseries{#1}};
\end{tikzpicture}
}

\renewcommand\thesubsection{\alph{subsection}}
\titleformat{\subsection}[display]
            {\fontsize{12pt}{18pt}\selectfont\sffamily\bfseries}
            {\textcolor{\coloract!70}{\thesubsection. #1}}
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
\patchcmd{\run@fullhead}{\hrule}{\color{\coloract}\hrule height 1.5pt}{}{}
\makeatother

% En-tête
\runningheader{\color{\coloract}\selectfont\sffamily\bfseries{\matiere\thechapitre}}{}{\niveau}
\runningheadrule

% Pied de page
\extrafootheight{0.7cm}
\footrule
\footer{Lycée Simone Veil}{\thepage}{2022-2023}

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

% Duplication
\newcommand\duplicate[1]{
        #1
        \newpage
        \setcounter{section}{0}
        \setcounter{subsection}{0}
        \setcounter{docfloat}{0}
        #1
}

% Appel
\newcommand\appel[1]{\fullwidth{\centering{\fcolorbox{black!10}{black!10}{\bf \faHandPointerO~APPEL~: #1}}\\}}

% Important
\newcommand\important[1]{\fullwidth{\centering{\fcolorbox{black!10}{black!10}{\bf#1}}\\}}


% Bonus
\newcommand\bonus{\vspace{0.8cm} {\begin{center}\fontsize{14pt}{20pt}\selectfont\bfseries\sffamily\textcolor{darkgreen}{\faGift~BONUS~\faGift}\end{center}}}
