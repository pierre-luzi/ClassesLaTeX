\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{punitions}[2021/07/21 Punitions]

\LoadClass[11pt,a4paper]{exam}
\RequirePackage{packages}
\RequirePackage{commandes}



%------------------------------
% Réglages de la classe
%------------------------------

% Géométrie
\newgeometry{top=2cm,bottom=2cm,left=1cm,right=1cm}

% Longueurs 
\setlength{\columnsep}{1.2cm}




%------------------------------
% Titre
%------------------------------

\newcommand\titre[1]{
	\pagestyle{empty}
	\begin{tikzpicture}[remember picture, overlay]
	\node[yshift=-2cm] at (current page.north west)
	     {
	       \begin{tikzpicture}[remember picture, overlay, xshift=1cm]
		   		\draw[red, line width=0.75mm] (0cm,0) rectangle (\linewidth,1cm);
	         %             node[midway] {\large\color{white}\bfseries\sffamily{}\niveau~---~Devoir surveillé~\thenumero:~#1};
		   		\draw (0.5\linewidth,0.5) node {\color{red}\LARGE\bfseries\sffamily{}Punition~:~#1};
	       \end{tikzpicture}
	     };
	\end{tikzpicture}
	
	\begin{center}
		\begin{minipage}{0.9\linewidth}
			\textbf{\emph{\sffamily Ce travail doit être fait sérieusement et proprement, sur une copie. S’il est bâclé, il devra être refait durant une heure de retenue.}}
		\end{minipage}
	\end{center}
}