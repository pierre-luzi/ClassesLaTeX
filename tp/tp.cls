\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tp}[2020/09/06 TP]

\LoadClass[11pt,a4paper]{exam}
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
\setcounter{secnumdepth}{3} % profondeur de la numérotation

% Séance
\newcounter{numtp}
\newcommand\titreseance{}

% Espacement entre les questions
\let\oldquestions\questions
\let\oldendquestions\endquestions
\renewenvironment{questions}
{
  \oldquestions
  \setlength\itemsep{0.3cm}
}
{
  \oldendquestions
}



%------------------------------
% Options de la classe
%------------------------------

% Matière
\newcommand\matiere{}
\DeclareOption{phy}{\renewcommand\matiere{P}}
\DeclareOption{chi}{\renewcommand\matiere{C}}

% Niveau
\newcommand\niveau{}
\DeclareOption{2nde}{\renewcommand\niveau{\color{darkgreen}\selectfont\sffamily\bfseries{Physique-chimie 2\up{nde}}}}
\DeclareOption{1ere}{\renewcommand\niveau{\color{darkgreen}\selectfont\sffamily\bfseries{Physique-chimie 1\iere}}}
\DeclareOption{tstl}{\renewcommand\niveau{\color{darkgreen}\selectfont\sffamily\bfseries{Physique-chimie Terminale STL}}}

% Dyslexie
\DeclareOption{dys}{
	\renewcommand\normalsize{%
	   \@setfontsize\normalsize{14}{20}%
	   \abovedisplayskip 14pt \@plus 2pt \@minus 5pt
	}

	\renewcommand{\familydefault}{\sfdefault}
	\newgeometry{left=1cm,right=1cm,top=2cm,bottom=1.5cm}
}

% Options par défaut
\ExecuteOptions{2nde}

\ProcessOptions



\newcommand\titre[1]{
  \renewcommand\titreseance{#1}

  \begin{tikzpicture}[remember picture, overlay]
    \node[yshift=-3.5cm] at (current page.north west)
         {
           \begin{tikzpicture}[remember picture, overlay, xshift=1cm]
             \fill[darkgreen!70] (-0.5cm,0) rectangle (1.4cm,2cm) 
             node[midway, scale=1.2] {\color{white}{\selectfont\sffamily\Huge\bfseries\matiere\thenumtp}};
             \fill[darkgreen!40] (1.4cm,0) rectangle (\linewidth+0.5cm,2cm) node[midway, white, align=center] {\selectfont\sffamily\Huge\bfseries#1};
             \fill[darkgreen] (-0.5cm,2cm) rectangle (\linewidth+0.5cm,2.5cm) node[midway, scale=0.8] {\color{white}{\fontsize{14pt}{20pt}\selectfont\sffamily{}Activité expérimentale}};
           \end{tikzpicture}
         };
  \end{tikzpicture}
  
  \vspace{30pt}
}


\newcommand\blanktitre{
	\begin{tikzpicture}[remember picture, overlay]
		\node[yshift=-3.5cm] at (current page.north west) {
			\begin{tikzpicture}[remember picture, overlay, xshift=1cm]
				\draw[white] (-0.5cm,0) rectangle (\linewidth+0.5cm,2.5cm);
			\end{tikzpicture}
		};
	\end{tikzpicture}

	\vspace{1.5cm}
}



%------------------------------
% Sections
%------------------------------

\newcommand{\SecTitle}[1]{
  \begin{tikzpicture}
    \coordinate (bottom) at (40pt, -7pt);
    \coordinate (top) at (60pt, 7pt);
    \draw[color=darkgreen, fill=darkgreen, rounded corners] (bottom) rectangle (top);
    \node (subsec) at ($(bottom)!0.5!(top)$) {\color{white}\fontsize{13pt}{16pt}\selectfont\sffamily\bfseries{\thesection}};
    \draw[color=darkgreen] (subsec.north east) node[anchor=north west] {\hspace{5pt}\fontsize{13pt}{16pt}\selectfont\sffamily\bfseries{#1}};
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
\titlespacing{\section}{20pt}{0.3cm plus 0.5cm}{-5pt plus 0.2cm}



%------------------------------
% Sous-sections
%------------------------------

% \newcommand\SubsecTitle[1]{%
%   \begin{tikzpicture}
%     \coordinate (bottom) at (40pt, -7pt);
%     \coordinate (top) at (60pt, 7pt);
%     \draw[color=darkgreen, fill=darkgreen, rounded corners] (bottom) rectangle (top);
%     \node (subsec) at ($(bottom)!0.5!(top)$) {\color{white}\fontsize{13pt}{16pt}\selectfont\sffamily\bfseries{\thesubsection}};
%     \draw[color=darkgreen] (subsec.north east) node[anchor=north west] {\hspace{5pt}\fontsize{13pt}{16pt}\selectfont\sffamily\bfseries{#1}};
% \end{tikzpicture}
% }

\renewcommand\thesubsection{\alph{subsection}}
\titleformat{\subsection}[block]
            % {\gdef\subsectionlabel{}\fontsize{13pt}{16pt}\selectfont\sffamily\bfseries}
            % {\gdef\subsectionlabel{\thesection #1}}
            % {0pt}{\SubsecTitle{#1}}
            {\fontsize{12pt}{18pt}\selectfont\sffamily\bfseries}
            {\textcolor{red!70}{\thesubsection. #1}}
            {0pt}{}
\titleformat{name=\subsection,numberless}[display]
            % {\fontsize{13pt}{16pt} \selectfont \bfseries}
            % {#1}
            % {0pt}{}
			{\fontsize{12pt}{18pt} \selectfont \bfseries}
            {#1}
            {0pt}{}
\titlespacing{\subsection}{1.5cm}{0.3cm}{0.3cm}



%------------------------------
% Sous-sous-sections
%------------------------------

% \newcommand\SubsubsecTitle[1]{%
%   \begin{tikzpicture}
%     \coordinate (bottom) at (40pt, -9pt);
%     \coordinate (top) at (110pt, 9pt);
%     \draw[red, fill=red, rounded corners] (bottom) rectangle (top);
%     \node (subsec) at ($(bottom)!0.5!(top)$) {\color{white}\fontsize{14pt}{20pt}\selectfont\sffamily\bfseries{Activité \thesubsubsection}};
%     \draw[red] (subsec.north east) node[anchor=north west] {\hspace{5pt}\fontsize{14pt}{20pt}\selectfont\sffamily\bfseries{#1}};
% \end{tikzpicture}
% }

\renewcommand\thesubsubsection{\alph{subsubsection}}
\titleformat{\subsubsection}[display]
            {\fontsize{12pt}{18pt}\selectfont\sffamily\bfseries}
            {\textcolor{red!70}{\thesubsubsection. #1}}
            {0pt}{}
\titleformat{name=\subsubsection,numberless}[display]
            {\fontsize{12pt}{18pt} \selectfont \bfseries}
            {#1}
            {0pt}{}
\titlespacing{\subsubsection}{1.5cm}{0.3cm}{-0.5cm}



%------------------------------
% En-têtes et pieds de page
%------------------------------

% la classe exam définit ses propres headers/footers

\makeatletter
\patchcmd{\run@fullhead}{\hrule}{\color{darkgreen}\hrule height 1.5pt}{}{}
\makeatother

% En-tête
% \renewcommand{\sectionmark}[1]{\markboth{\matiere\thenumtp~:~#1}{}} % numéro du TP
\runningheader{\color{darkgreen}\selectfont\sffamily\bfseries{\matiere\thenumtp~:~\titreseance}}{}{\niveau}
\runningheadrule

% Pied de page
\extrafootheight{0.7cm}
\footrule
\footer{Lycée de Boulogne-Billancourt}{\thepage}{2020-2021}



%------------------------------
% Commandes
%------------------------------

\newcommand\appel[1]{\fullwidth{\centering{\fcolorbox{black!10}{black!10}{\bf \faHandPointerO~APPEL~: #1}}\\}}
\newcommand\bonus{\vspace{0.8cm} {\begin{center}\fontsize{14pt}{20pt}\selectfont\bfseries\sffamily\textcolor{darkgreen}{\faGift~BONUS~\faGift}\end{center}}}
