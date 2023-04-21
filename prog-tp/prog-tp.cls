\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{prog-tp}[2019/08/06 Programmation d'un TP]

\LoadClass[11pt,a4paper]{exam}
\RequirePackage{packages}
\RequirePackage{commandes}



%------------------------------
% Réglages de la classe
%------------------------------

% Style de page
\pagestyle{empty}

% Compteurs
\newcounter{chapitre}
\newcounter{seance}



%------------------------------
% Options de la classe
%------------------------------

% Matière
\newcommand\matiere{}
\DeclareOption{phy}{\renewcommand\matiere{P}}
\DeclareOption{chi}{\renewcommand\matiere{C}}

% Niveau
\newcommand\niveau{}
\DeclareOption{2nde}{\renewcommand\niveau{2\up{nde}}}
\DeclareOption{1ere}{\renewcommand\niveau{1\iere}}
\DeclareOption{tstl}{\renewcommand\niveau{TSTL}}

\ProcessOptions



%------------------------------
% Titre d'un TP
%------------------------------

\newcommand\titretp[1]{
  \pagestyle{empty}
  \begin{tikzpicture}[remember picture, overlay]
    \node[yshift=-2cm] at (current page.north west)
         {
           \begin{tikzpicture}[remember picture, overlay, xshift=1cm]
             \fill[DarkBlueChapter] (2cm,0) rectangle (\linewidth-2cm,1cm)
             node[midway] {\large\color{white}\bfseries\sffamily \niveau~TP~\matiere\thechapitre~---~#1};
           \end{tikzpicture}
         };
  \end{tikzpicture}
}



%------------------------------
% Titre d'enseignement scientifique
%------------------------------

\newcommand\titresciens{
  \setcounter{page}{1}
  \begin{tikzpicture}[remember picture, overlay]
    \node[yshift=-2cm] at (current page.north west)
         {
           \begin{tikzpicture}[remember picture, overlay, xshift=1cm]
             \fill[DarkBlueChapter] (5cm,0) rectangle (\linewidth-5cm,1cm)
             node[midway] {\large\color{white}\bfseries\sffamily Chapitre~\thechapitre~---~Déroulement de la séance~\theseance};
           \end{tikzpicture}
         };
  \end{tikzpicture}
}




%------------------------------
% Date et salle
%------------------------------

\newcommand\calendrier[2]{
  \begin{center}
    \setlength{\tabcolsep}{0pt}
    \begin{tabular}{|*{3}{C{0.32\linewidth}}|}
      \hline
      \faCalendar~#1
      & \faUser~Pierre Luzi
      & \faLocationArrow~Salle #2
      \\
      \hline
    \end{tabular}
  \end{center}
}



%------------------------------
% Sections
%------------------------------

\newcommand\SecTitle[1]{%
  \begin{tikzpicture}
    \coordinate (bottom) at (40pt, -9pt);
    \coordinate (top) at (65pt, 9pt);
    \draw[DarkBlueChapter, fill=DarkBlueChapter, rounded corners] (bottom) rectangle (top);
    \node (subsec) at ($(bottom)!0.5!(top)$) {\color{white}\fontsize{14pt}{20pt}\selectfont\sffamily\bfseries{\thesection}};
    \draw[DarkBlueChapter] (subsec.north east) node[anchor=north west] {\hspace{5pt}\fontsize{14pt}{20pt}\selectfont\sffamily\bfseries{#1}};
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
% Planning de la séance
%------------------------------

\newenvironment{planning}
{
  \begin{center}
    \begin{tabular}{|C{0.075\linewidth}|m{0.4\linewidth}|m{0.4\linewidth}|}
      \hline
      \multicolumn{1}{|C{0.075\linewidth}}{\faClockO} & \multicolumn{1}{|C{0.4\linewidth}}{\bf Activité} & \multicolumn{1}{|C{0.4\linewidth}|}{\bf Notions travaillées} \\
      \hline
}{
      \hline
    \end{tabular}
  \end{center}
}



%------------------------------
% Matériel disponible
%------------------------------

\newcommand\materiel[2]{
  \begin{minipage}[t]{0.47\linewidth}
    \begin{mdframed}[
        linecolor                 = DarkBlueChapter,
        linewidth                 = 1pt,
        frametitle                = {\color{white}Paillasse élève},
        frametitlefont            = \sffamily\bfseries,
        frametitlebackgroundcolor = DarkBlueChapter
      ]
      \begin{itemize}[leftmargin=*]
        #1
      \end{itemize}
    \end{mdframed}    
  \end{minipage}
  \hfill
  \begin{minipage}[t]{0.47\linewidth}
    \begin{mdframed}[
        linecolor                 = DarkBlueChapter,
        linewidth                 = 1pt,
        frametitle                = {\color{white}Paillasse professeur},
        frametitlefont            = \sffamily\bfseries,
        frametitlebackgroundcolor = DarkBlueChapter
      ]
      \begin{itemize}[leftmargin=*]
        #2
      \end{itemize}
    \end{mdframed}
  \end{minipage}
  \vspace{0.3cm}
}



%------------------------------
% Produis et gestion des déchets
%------------------------------

\newcommand\produits[1]{
  \begin{mdframed}[
      linecolor                 = DarkBlueChapter,
      linewidth                 = 1pt,
      frametitle                = {\color{white}Produits et gestion des déchets},
      frametitlefont            = \sffamily\bfseries,
      frametitlebackgroundcolor = DarkBlueChapter
    ]
    #1
  \end{mdframed}
}



\newcommand\produit[1]{
  \begin{center}
    \begin{tabular}{C{3.5cm}C{7cm}m{6.5cm}}
      #1
    \end{tabular}
  \end{center}
}



%------------------------------
% Bilan de la séance
%------------------------------

\newcommand\bilan[1]{
  \begin{mdframed}[
      linecolor                 = DarkBlueChapter,
      linewidth                 = 1pt,
      frametitle                = {\color{white}Bilan},
      frametitlefont            = \sffamily\bfseries,
      frametitlebackgroundcolor = DarkBlueChapter
    ]
    #1
  \end{mdframed}
}
