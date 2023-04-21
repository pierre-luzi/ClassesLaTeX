\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sci-ens}[2019/08/28 Enseignement scientifique]



%------------------------------
% Options de la classe
%------------------------------

% Niveau
\newcommand\niveau{}
\DeclareOption{1ere}{\renewcommand\niveau{\color{red}\selectfont\sffamily\bfseries{Enseignement scientifique 1\iere}}}
\DeclareOption{Term}{\renewcommand\niveau{\color{red}\selectfont\sffamily\bfseries{Enseignement scientifique Terminale}}}

% Options héritées de la classe exam
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}

% Options par défaut
\ExecuteOptions{1ere}

\ProcessOptions\relax

% Héritage de la classe exam
\LoadClass[12pt,a4paper]{exam}



%------------------------------
% Packages
%------------------------------

\RequirePackage{packages}
\RequirePackage{commandes}



%------------------------------
% Réglages de la classe
%------------------------------

% Marges
\newgeometry{left=1cm,right=1cm,top=2cm,bottom=1cm}

% Longueurs
\setlength{\headheight}{0pt} % défaut : 15pt
\setlength{\headsep}{0pt}    % défaut : 15pt
\setlength{\footskip}{0pt}  % défaut : 30pt
\setlength{\textheight}{790pt}
\setlength{\intextsep}{0.2cm}
\setlength{\dottedlinefillheight}{1cm}

% Compteurs
\setcounter{secnumdepth}{3} % profondeur de la numérotation
\newcounter{theme}
\newcounter{chapitre}
\newcounter{seance}

% Couleurs
\definecolor{TableOrange}{RGB}{255,64,0}

% \renewcommand\normalsize{%
%    \@setfontsize\normalsize{14}{20}%
%    \abovedisplayskip 14pt \@plus 2pt \@minus 5pt
% }



%------------------------------
% Séquence
%------------------------------

% Chapitre
\newcommand\titre[2]{
  \begin{tikzpicture}[remember picture, overlay]
    \node[yshift=-3cm] at (current page.north west)
         {
           \begin{tikzpicture}[remember picture, overlay, xshift=1cm]
	           \fill[red!40, rounded corners=10pt] (-0.5cm,0) rectangle (\linewidth+0.5cm,2cm) node[midway, white, yshift=0.55cm] {\bfseries\sffamily\Large Thème~\thetheme~---~Chapitre~\thechapitre~: #1} node[midway, white, yshift=-0.35cm] {\bfseries\sffamily\huge Activité~\theseance~: #2};
	           % \node[white, anchor=west, xshift=1.8cm, yshift=1.3cm, align=left] {\bfseries\sffamily\Huge\titrechapitre};
			   % \node[white, xshift=0.5\linewidth, yshift=0.5cm] {\bfseries\sffamily\large Activité~\theseance~: \titreseance};
             % \fill[red, rounded corners=10pt] (-0.5cm,0) rectangle (1.4cm,2cm) node[midway, yshift=0.55cm] {\color{white}\bfseries\sffamily\small Chapitre}
             node[midway, yshift=-0.3cm, scale=1.2] {\color{white}{\fontsize{24pt}{29pt}\bfseries\sffamily\thechapitre}};
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
    \draw[red, fill=red, rounded corners] (bottom) rectangle (top);
    \node (subsec) at ($(bottom)!0.5!(top)$) {\color{white}\fontsize{14pt}{20pt}\selectfont\sffamily\bfseries{\thesection}};
    \draw[red] (subsec.north east) node[anchor=north west] {\hspace{5pt}\fontsize{14pt}{20pt}\selectfont\sffamily\bfseries{#1}};
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
    \draw[red, fill=red, rounded corners] (bottom) rectangle (top);
    \node (subsec) at ($(bottom)!0.5!(top)$) {\color{white}\fontsize{14pt}{20pt}\selectfont\sffamily\bfseries{Activité \thesubsection}};
    \draw[red] (subsec.north east) node[anchor=north west] {\hspace{5pt}\fontsize{14pt}{20pt}\selectfont\sffamily\bfseries{#1}};
\end{tikzpicture}
}

\renewcommand\thesubsection{\alph{subsection}}
\titleformat{\subsection}[display]
            {\fontsize{12pt}{18pt}\selectfont\sffamily\bfseries}
            {\textcolor{red!70}{\thesubsection. #1}}
            {0pt}{}
\titleformat{name=\subsection,numberless}[display]
            {\fontsize{12pt}{18pt} \selectfont \bfseries}
            {#1}
            {0pt}{}
\titlespacing{\subsection}{1cm}{0.3cm}{-0.5cm}



%------------------------------
% Sous-sous-sections
%------------------------------

\renewcommand\thesubsubsection{\Alph{subsubsection}}
\definecolor{darkblue}{RGB}{40,72,140}
\titleformat{\subsubsection}[display]
            {\fontsize{12pt}{12pt} \selectfont \bfseries}
            {\textcolor{darkblue}{\underline{\thesubsubsection. #1}}}
            {0pt}{}
\titleformat{name=\subsubsection,numberless}[display]
            {\fontsize{12pt}{12pt} \selectfont \bfseries}
            {\textcolor{darkblue}{\underline{#1}}}
            {0pt}{}
\titlespacing{\subsubsection}{20pt}{7pt}{-0.4cm}



%------------------------------
% En-têtes et pieds de page
%------------------------------

% la classe exam définit ses propres headers/footers et n'est pas compatible avec le package fancyhdr

\makeatletter
\patchcmd{\run@fullhead}{\hrule}{\color{red}\hrule height 1.5pt}{}{}
\makeatother

% En-tête
% \renewcommand{\sectionmark}[1]{\markboth{Chapitre \thechapitre~:~#1}{}} % numéro du chapitre
% \runningheader{\color{red}\selectfont\sffamily\bfseries{Chapitre \thechapitre~:~\titrechapitre}}{}{\niveau}
% \runningheadrule

% Pied de page
% \extrafootheight{0.7cm}
% \footrule
% \footer{Lycée Albert Camus}{\thepage}{2019-2020}
\footer{}{}{}



%------------------------------
% Commandes
%------------------------------

\newcommand\duplicate[1]{
	#1
	\newpage
	\setcounter{section}{0}
	\setcounter{subsection}{0}
	\setcounter{docfloat}{0}
	#1
}

\newcommand\appel[1]{\fullwidth{\centering{\fcolorbox{black!10}{black!10}{\bf \faHandPointerO~APPEL~: #1}}\\}}
