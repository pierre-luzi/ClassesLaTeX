\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{competences}[2020/06/29 Competences d'un chapitre]


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

\newif\ifeleve
\ifthenelse{\equal{\detokenize{eleve}}{\jobname}}{
\elevetrue
}{
\elevefalse
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
\DeclareOption{2nde}{\renewcommand\niveau{2\up{nde}}}
\DeclareOption{1ere}{\renewcommand\niveau{1\iere}}
\DeclareOption{tstl}{\renewcommand\niveau{Terminale STL}}

\ProcessOptions



%------------------------------
% Titre
%------------------------------

\newcommand\titre{
  \pagestyle{empty}
  \begin{tikzpicture}[remember picture, overlay]
    \node[yshift=-2cm] at (current page.north west)
         {
           \begin{tikzpicture}[remember picture, overlay, xshift=1cm]
             \fill[DarkBlueChapter] (5cm,0) rectangle (\linewidth-5cm,1cm)
             node[midway] {\large\color{white}\bfseries\sffamily Chapitre \matiere\thechapitre~---~Notions et capacités};
           \end{tikzpicture}
         };
  \end{tikzpicture}
}



%------------------------------
% Notions et capacités
%------------------------------

\newcommand\programme[2]{
	\begin{center}
		\begin{tabular}{|m{0.67\linewidth-1cm}|*{3}{P{0.3cm}|}m{0.27\linewidth-1cm}|}
			\hline
				\rowcolor{black!20} \multicolumn{1}{|c|}{\bf Notions à connaître} & \faSmileO & \faMehO & \faFrownO & \multicolumn{1}{|c|}{\bf Pour réviser}
			\\
			\hline
				#1
				\rowcolor{black!20} \multicolumn{1}{|c|}{\bf Capacités à acquérir}& \faSmileO & \faMehO & \faFrownO & \multicolumn{1}{|c|}{\bf Pour réviser}
			\\
			\hline
				#2
		\end{tabular}
	\end{center}

	\vspace{0.3cm}
}



\newcommand\entree[2]{
	#1
	& & & &
	#2 \\
	\hline
}
