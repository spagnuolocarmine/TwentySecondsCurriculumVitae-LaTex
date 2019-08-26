%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Curriculum Vitae Timeline/CV
% LaTeX Template
% Version 1.0 (5/23/19)
%
% Original author:
% Carmine Spagnuolo (cspagnuolo@unisa.it) with major modifications by 
% Vel (vel@LaTeXTemplates.com) and finally by
% Augusto Cunha (contact@augustoicaro.com)
%
% License:
% The MIT License (see included LICENSE file)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{twentysecondcv}[2017/01/08 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\RequirePackage[sfdefault]{ClearSans}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}
\RequirePackage{fontawesome}
\RequirePackage{multicol}
\RequirePackage{pgf}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\usetikzlibrary{calc}
\newsavebox\mybox

%----------------------------------------------------------------------------------------
%	 COLOURS
%----------------------------------------------------------------------------------------

\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{maingray}{HTML}{B9B9B9}

%----------------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------
%\renewcommand{\bfseries}{\color{gray}}
\renewcommand{\textbf}[1]{{\textcolor{gray}#1}} % Make \textbf produce coloured text instead

\pagestyle{empty} % Disable headers and footers

\setlength{\parindent}{0pt} % Disable paragraph indentation

\newcommand{\interestList}[2][ $\cdot $ ]{%
  \def\nextitem{\def\nextitem{#1}}%
  \@for \el:=#2\do{\nextitem\el}%
}

\newcommand{\lateruse}[1]{%
  \@ifundefined{late@#1}{??}{\@nameuse{late@#1}}%
}
\newcommand\laterdef[2]{%
  \protected@write\@auxout{}{%
    \global\string\@namedef{late@#1}{#2}%
  }%
}

%\newcommand{\makeList}[1]{%
%\vspace{-1em}
%\begin{itemize}
%    \@for \el:=#1\do{%
%        \item \el%
%    }%
%\end{itemize}
%}

\newcommand{\makeList}[1]{%
\vspace{-1em}
\begin{itemize}
\ls{#1}
\end{itemize}
}

\def\ls#1{\lsA#1;;}
\def\lsA#1;{\ifx;#1;\else \dosomething{#1}\expandafter\lsA\fi}
\def\dosomething#1{\item #1} 
%----------------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1cm} % Top margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newlength{\TotalSectionLength} % Define a new length to hold the remaining line width after the section title is printed
\newlength{\SectionTitleLength} % Define a new length to hold the width of the section title
\newcommand{\profilesection}[1]{%
	\setlength\TotalSectionLength{\linewidth}% Set the total line width
	\settowidth{\SectionTitleLength}{\huge #1 }% Calculate the width of the section title
	\addtolength\TotalSectionLength{-\SectionTitleLength}% Subtract the section title width from the total width
	\addtolength\TotalSectionLength{-2.22221pt}% Modifier to remove overfull box warning
	\vspace{8pt}% Whitespace before the section title
	{\color{black!80} \huge #1 \rule[0.15\baselineskip]{\TotalSectionLength}{1pt}}% Print the title and auto-width rule
}

% Define custom commands for CV info
\newboolean{cv@aboutme}
\setboolean{cv@aboutme}{false}
\newboolean{cv@interest}
\setboolean{cv@interest}{false}
\newboolean{cv@profile}
\setboolean{cv@profile}{false}
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvgithub}[1]{\renewcommand{\cvgithub}{#1}}
\newcommand{\cvlinkedin}[1]{\renewcommand{\cvlinkedin}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\cvsite}{#1}}
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}
\newcommand{\aboutme}[2]{\setboolean{cv@aboutme}{true}\renewcommand{\aboutme}{%
\profilesection{#1}
\begin{justify}%
#2%
\end{justify}%
}}
\newcommand{\interest}[2]{\setboolean{cv@interest}{true}\renewcommand{\interest}{%
\profilesection{#1}
\begin{justify}%
\interestList{#2}%
\end{justify}%
}}
\newcommand{\profile}[2]{\setboolean{cv@profile}{true}\renewcommand{\profile}{%
\profilesection{#1}
\begin{justify}%
#2%
\end{justify}%
}}

% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}}

% Command for printing skill progress bars
\newcommand\skills[1]{ 
	\renewcommand{\skills}{
		\begin{tikzpicture}
			\foreach [count=\i] \x/\y in {#1}{
				\draw[fill=maingray,maingray] (0,-\i) rectangle (6,-\i+0.4);
				\draw[fill=white,mainblue](0,-\i) rectangle (\y,-\i+0.4);
				\node [above right] at (0,-\i+0.4) {\x};
				\foreach \z in {0,1,2,...,12}
                {
				    \coordinate (A\z) at ($(0,-\i)+(\z*0.5cm,0)$) {};
				    \ifodd\z
                        \draw[white] ($(A\z)$) -- ($(A\z)+(0,2.5pt)$);
                    \else
                        \draw[white] ($(A\z)$) -- ($(A\z)+(0,5pt)$);
                    \fi
                }
			}
		\end{tikzpicture}
	}
}

% Command for printing skills text
\newcommand\skillstext[1]{ 
	\renewcommand{\skillstext}{
		\begin{flushleft}
			\foreach [count=\i] \x/\y in {#1}{ 
				\x$ \star $\y
			}
		\end{flushleft}
	}
}

\def\timeline#1#2#3#4#5{
    \begin{tabular}[c]{@{}l@{}}
        \begin{tikzpicture}[every node/.style={inner sep=0,outer sep=0}]
            \node [below] at (0,-0.1) {#4};
            \path [bottom color=#2,top color=#3] (-0.1,0) rectangle (0.1,#1-1) ;
            \node [above] at (0,#1-0.9) {#5};
        \end{tikzpicture}
    \end{tabular}
}

%----------------------------------------------------------------------------------------
%	 SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makeprofile}{
	\begin{tikzpicture}[remember picture,overlay]
   		\node [rectangle, fill=sidecolor, anchor=north, minimum width=9cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
	\end{tikzpicture}

	%------------------------------------------------

	\begin{textblock}{6}(0.5, 0.2)
			
		%------------------------------------------------
		
		\ifthenelse{\equal{\profilepic}{}}{}{
			\begin{center}
				\begin{tikzpicture}[x=\imagescale,y=-\imagescale]
					\clip (600/2, 567/2) circle (567/2);
					\node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,0) {\includegraphics[width=\imagewidth]{\profilepic}};
				\end{tikzpicture}
			\end{center}
		}

		%------------------------------------------------

		{\Huge\color{mainblue}\cvname}

		%------------------------------------------------

		{\Large\color{black!80}\cvjobtitle}

		%------------------------------------------------

		\renewcommand{\arraystretch}{1.6}
		\begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
			\ifthenelse{\equal{\cvdate}{}}{}{\textsc{\large\icon{\faInfoCircle}
			} & \cvdate\\}
			\ifthenelse{\equal{\cvaddress}{}}{}{\textsc{\large\icon{\faGlobe}} & \cvaddress\\}
			\ifthenelse{\equal{\cvnumberphone}{}}{}{\textsc{\large\icon{\faPhone}} & \cvnumberphone\\}
			\ifthenelse{\equal{\cvsite}{}}{}{\textsc{\large\icon{\faUser}} & \href{\cvsite}{\cvsite}\\}
			\ifthenelse{\equal{\cvmail}{}}{}{\textsc{\large\icon{\faAt}} & \href{mailto:\cvmail}{\cvmail}\\}
			\ifthenelse{\equal{\cvgithub}{}}{}{\textsc{\large\icon{\faGithub}} & \href{https://www.github.com/\cvgithub}{\cvgithub}\\}
			\ifthenelse{\equal{\cvlinkedin}{}}{}{\textsc{\large\icon{\faLinkedin}} & \href{https://www.linkedin.com/in/\cvlinkedin}{\cvlinkedin}}
		\end{tabular}

		%------------------------------------------------
		\ifthenelse{\boolean{cv@profile}}{
	        \emergencystretch=3em
	        \profile
	    }{}
	    \ifthenelse{\boolean{cv@aboutme}}{
	        \emergencystretch=3em
	        \aboutme
	    }{}
	    \ifthenelse{\boolean{cv@interest}}{
	        \emergencystretch=3em
	        \interest
	    }{}
		
		

		%------------------------------------------------

		\profilesection{Skills}

		\skills
		%\skillstext
		{\scriptsize 
		The skill scale is from 0 (Fundamental Awareness) to 6 (Expert).}
			
		%------------------------------------------------
			
	\end{textblock}
}

%----------------------------------------------------------------------------------------
%	 COLOURED SECTION TITLE BOX
%----------------------------------------------------------------------------------------

% Command to create the rounded boxes around the first three letters of section titles
\newcommand*\round[2]{%
	\tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded corners, inner sep=1.6pt, minimum size=5.5mm, text height=3.6mm, fill=#2,#2,text=white](char){#1};%
}

\newcounter{colorCounter}
\newcommand{\sectioncolor}[1]{%
	{%
		\round{#1}{
			\ifcase\value{colorCounter}%
			maingray\or%
			mainblue\or%
			maingray\or%
			mainblue\or%
			maingray\or%
			mainblue\or%
			maingray\or%
			mainblue\or%
 			maingray\or%
			mainblue\else%
			maingray\fi%
		}%
	}%
	\stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
	{%
		\color{gray}%
		\Large\sectioncolor{#1}%
	}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}{%
		\large\color{gray} #1%
	}
	\par\vspace{.25\parskip}%
}

%----------------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{twenty}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitemtime}[7]{%
    &
	\sbox{\mybox}{\parbox[]{0.805\textwidth}{%
		\textbf{#5}%
		\hfill%
		{\footnotesize#6}\\%
		#7\vspace{\parsep}
	}}\pgfmathparse{0.0351459804*(\ht\mybox+\dp\mybox)}\global\let\pheight\pgfmathresult%
	\pgfmathparse{0.0351459804*(\dp\mybox)-0.1}\global\let\pshift\pgfmathresult\\[-2ex]

    
	\raisebox{-\pshift cm}{
	    \timeline{\pheight}{#1}{#2}{#3}{#4}
	}
	&
	\parbox[t]{0.805\textwidth}{%
		\textbf{#5}%
		\hfill%
		{\footnotesize#6}\\%
		#7\vspace{\parsep}
	}\\
}

\newcommand{\twentyitem}[4]{%
	#1
	&
	\parbox[t]{0.805\textwidth}{%
		\textbf{#2}%
		\hfill%
		{\footnotesize#3}\\%
		#4\vspace{\parsep}
	}\\
}

\newcommand{\twentyactualitemtime}[7]{%
    &
	\sbox{\mybox}{\parbox[]{0.805\textwidth}{%
		\bf#5 \mdseries%
		\hfill%
		{\footnotesize#6}\\%
		#7\vspace{\parsep}
	}}\pgfmathparse{0.0351459804*(\ht\mybox+\dp\mybox)}\global\let\pheight\pgfmathresult%
	\pgfmathparse{0.0351459804*(\dp\mybox)-0.25}\global\let\pshift\pgfmathresult\\[-2ex]

	\raisebox{-\pshift cm}{
	    \timeline{\pheight}{#1}{#2}{#3}{#4}
	}
	&
	\parbox[t]{0.805\textwidth}{%
		\bf#5 \mdseries%
		\hfill%
		{\footnotesize#6}\\%
		#7\vspace{\parsep}
	}\\
}

\newcommand{\twentyactualitem}[4]{%
	\bf#1 \mdseries%
	&
	\parbox[t]{0.805\textwidth}{%
		\bf#2 \mdseries%
		\hfill%
		{\footnotesize#3}\\%
		#4\vspace{\parsep}%
	}\\
}

%----------------------------------------------------------------------------------------
%	 SMALL LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the small list
\newenvironment{twentyshort}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitemshort}[2]{%
	#1&\parbox[t]{0.83\textwidth}{%
		\textbf{#2}%
	}\\
}

%----------------------------------------------------------------------------------------
%	 MARGINS AND LINKS
%----------------------------------------------------------------------------------------

\RequirePackage[left=7.6cm,top=0.1cm,right=1cm,bottom=0.2cm,nohead,nofoot]{geometry}

\RequirePackage[%
  backref,%
  pdftex,%
  colorlinks=true,%
  bookmarksopen=true,%
  breaklinks=true,%
  linkcolor=black,% blue
  anchorcolor=black,%
  citecolor=black,% cyan
  urlcolor=black,% red
  bookmarksnumbered=false%
]{hyperref}
