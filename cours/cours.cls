\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cours}[2021/06/11 Cours]

\LoadClass[11pt,twoside,a4paper]{exam}
\RequirePackage{packages}
\RequirePackage{commandes}



%------------------------------
% Réglages de la classe
%------------------------------

\setlength{\dottedlinefillheight}{1cm} % espace vertical entre les lignes de réponse

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

\setcounter{tocdepth}{0}    % profondeur de la table des matières
\setcounter{secnumdepth}{3} % profondeur de la numérotation
\newcounter{chapitre}


% booléen pour la version élève
\newif\ifeleve
\ifthenelse{\equal{\detokenize{eleve}}{\jobname}}{
\elevetrue
}{
\elevefalse
}

\newcounter{espace}    % numéro de l'espace à remplir



%------------------------------
% Options de la classe
%------------------------------

% Matière
\newcommand\matiere{}
%\DeclareOption{phy}{\renewcommand\matiere{\raisebox{\depth}{\scalebox{0.9}{\boldmath$\upphi$}}}}
%\DeclareOption{chi}{\renewcommand\matiere{\raisebox{\depth}{\boldmath$\upchi$}}}
\DeclareOption{phy}{\renewcommand\matiere{P}}
\DeclareOption{chi}{\renewcommand\matiere{C}}
\DeclareOption{rev}{\renewcommand\matiere{R}}

% Niveau
\newcommand\niveau{}
\DeclareOption{2nde}{\renewcommand\niveau{\color{DarkBlueChapter}\selectfont\sffamily\bfseries{Physique-chimie 2\up{nde}}}}
\DeclareOption{1ere}{\renewcommand\niveau{\color{DarkBlueChapter}\selectfont\sffamily\bfseries{Physique-chimie 1\iere}}}
\DeclareOption{Tspe}{\renewcommand\niveau{\color{DarkBlueChapter}\selectfont\sffamily\bfseries{Physique-chimie Terminale}}}
\DeclareOption{1es}{\renewcommand\niveau{\color{DarkBlueChapter}\selectfont\sffamily\bfseries{Enseignement scientifique 1\iere}}}
\DeclareOption{Tes}{\renewcommand\niveau{\color{DarkBlueChapter}\selectfont\sffamily\bfseries{Enseignement scientifique Terminale}}}
\DeclareOption{tstl}{\renewcommand\niveau{\color{DarkBlueChapter}\selectfont\sffamily\bfseries{Physique-chimie Terminale STL}}}

% Options par défaut
\ExecuteOptions{tstl}

\ProcessOptions



%------------------------------
% Titre du chapitre
%------------------------------

\newcommand\titre[1]{
  \begin{tikzpicture}[remember picture, overlay]
    \node[yshift=-3cm] at (current page.north west)
         {
           \begin{tikzpicture}[remember picture, overlay, xshift=0.02\paperwidth]%1cm]%, xshift=0.05\paperwidth]
             \fill[LightBlueChapter] (0,0) rectangle (0.96\paperwidth,2cm);
             \fill[white] (1.7cm,1cm) circle (1.3cm) {};
             \fill[DarkBlueChapter] (1.7cm,1cm) circle (1.2cm) node[yshift=0.5cm] {\selectfont\sffamily\bfseries\color{white}\small Chapitre}
             node[yshift=-0.25cm, scale=1.1] {\color{white}{\fontsize{24pt}{29pt}\selectfont\sffamily\bfseries\matiere\thechapitre}};
             \node[white,anchor=west,xshift=3.2cm,yshift=1cm,align=left] {\selectfont\sffamily\bfseries\Huge#1};
           \end{tikzpicture}
         };
  \end{tikzpicture}
  
  \vspace{30pt}
}




%------------------------------
% Sections
%------------------------------

\newcommand\SecTitle[1]{%
  \begin{tikzpicture}
    \draw[DarkBlueChapter, fill=DarkBlueChapter] (0,-10pt) rectangle (20pt,10pt)
    node[pos=0.5, white, anchor=center] {\fontsize{14pt}{20pt}\selectfont\sffamily\bfseries{\thesection}};
    \node[DarkBlueChapter, anchor=west, xshift=25pt, align=left] {\fontsize{14pt}{20pt}\selectfont\sffamily\bfseries{#1}};
    \draw[DarkBlueChapter, thick] (0,-10pt) -- (\linewidth,-10pt);
\end{tikzpicture}
}

\renewcommand\thesection{\Roman{section}}

\titleformat{\section}[block]
            {\gdef\sectionlabel{}\fontsize{14pt}{20pt}\selectfont\sffamily\bfseries}
            {\gdef\sectionlabel{\thesection #1}}
            {0pt}{\SecTitle{#1}}
\titleformat{name=\section,numberless}[display]
            {\fontsize{14pt}{12pt} \selectfont \bfseries}
            {#1}
            {0pt}{}
\titlespacing{\section}{0pt}{0.7cm}{-40pt}



%------------------------------
% Sous-sections
%------------------------------

\newcommand\SubsecTitle[1]{%
  \begin{tikzpicture}
    \coordinate (bottom) at (40pt, -7pt);
    \coordinate (top) at (60pt, 7pt);
    \draw[DarkOrangeSection, fill=DarkOrangeSection, rounded corners] (bottom) rectangle (top);
    \node (subsec) at ($(bottom)!0.5!(top)$) {\color{white}\fontsize{12pt}{14pt}\selectfont\sffamily\bfseries{\thesubsection}};
    \draw[DarkOrangeSection] (subsec.north east) node[anchor=north west] {\hspace{5pt}\fontsize{12pt}{14pt}\selectfont\sffamily\bfseries{#1}};
\end{tikzpicture}
}

\renewcommand\thesubsection{\arabic{subsection}}
\definecolor{darkblue}{RGB}{40,72,140}
\titleformat{\subsection}[display]
            {\gdef\sectionlabel{}\fontsize{12pt}{14pt}\selectfont\sffamily\bfseries}
            {\gdef\sectionlabel{\thesubsection #1}}
            {0pt}{\SubsecTitle{#1}}
\titleformat{name=\subsection,numberless}[display]
            {\fontsize{12pt}{12pt} \selectfont \bfseries}
            {\textcolor{darkblue}{#1}}
            {0pt}{}
\titlespacing{\subsection}{20pt}{0pt}{0pt}



%------------------------------
% En-têtes et pieds de page
%------------------------------

% la classe exam définit ses propres headers/footers

\makeatletter
\patchcmd{\run@fullhead}{\hrule}{\color{DarkBlueChapter}\hrule height 1.5pt}{}{}
\makeatother

% En-tête
\runningheader{\color{DarkBlueChapter}\selectfont\sffamily\bfseries{Chapitre \matiere\thechapitre}}{}{\niveau}
\runningheadrule

% Pied de page
\extrafootheight{0.7cm}
\footrule
\footer{Lycée Simone Veil}{\thepage}{M. {\bsc{Luzi}}}



%------------------------------
% Exercices d'applications
%------------------------------

\newcounter{exappcounter}

\newcommand\exapp[1]{
	\stepcounter{exappcounter}
	\begin{mdframed}[
		linecolor                 = darkgreen,
		linewidth                 = 1pt,
		frametitle                = Exercice d'application \theexappcounter,
		frametitlefont             = {\normalfont\bf\sffamily\color{white}},
		frametitlebackgroundcolor = darkgreen,
		backgroundcolor           = darkgreen!10
	]
		#1
	\end{mdframed}
}



%------------------------------
% Espaces à remplir
%------------------------------

\newcommand\espaceeleve[2]{
	\ifeleve
	\vspace*{#1}
	\else
	#2
	\fi
	
	\stepcounter{espace}
	\rightline{\sffamily\scriptsize\textit{\color{black!40}Espace \theespace}}
}
	

