%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Twenty One Seconds Resume/CV
% LaTeX Template
% Version 1.0 (2022/12/29)
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
%
% profile image is from https://publicdomainvectors.org/photos/nayrhcrel-alice-32.png
%
% License
% Original author:
% Carmine Spagnuolo (cspagnuolo@unisa.it) with major modifications by 
% Alessandro Trinca Tornidor (alessandro at trinca dot tornidor dot com)
%% Copyright 2023-now Alessandro Trinca Tornidor (alessandro at trinca dot tornidor dot com)
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is Alessandro Trinca Tornidor
%
% This work consists of the files template.tex and twentyonesecondcv.cls
% and the derived file twentyonesecondcv.pdf

\ProvidesClass{twentyonesecondcv}[2017/01/08 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

% page layout packages
\usepackage{blindtext}
\usepackage{xcolor}
\usepackage{geometry}
\usepackage{titlesec}
\usepackage[most]{tcolorbox}
\geometry{margin=0pt}

%%
\RequirePackage[sfdefault]{ClearSans}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}
\RequirePackage{fontawesome}
\RequirePackage{etoolbox}
\usepackage{hyperref}

\usepackage{graphicx}
\graphicspath{ {./} }

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
%%%%%%%%%% end packages

\pagestyle{empty}

\hypersetup{colorlinks=true,linkcolor=blue,urlcolor=blue}

\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{f2f2f2}
\definecolor{mainblue}{HTML}{000F61}
\definecolor{maingray}{HTML}{f2f2f2}
\definecolor{bluecolorurl}{HTML}{142376}

\renewcommand{\bfseries}{\color{gray}} % Make \textbf produce coloured text instead

% ------------------ page layout ------------------------- %

% https://tex.stackexchange.com/a/310989/109031
% https://tex.stackexchange.com/questions/220094/vertical-spacing-vfill-inside-tcolorbox
% options, from tcolorbox package docs: https://ctan.mirror.garr.it/mirrors/ctan/macros/latex/contrib/tcolorbox/tcolorbox.pdf
% - nobeforeafter: Abbreviation for clearing the keys before and after. The colored box is not put into a paragraph and there is no space before or after the box.
% - boxrule=0pt: boxrule=⟨length⟩ (style, no default, initially 0.5mm) Sets all rules of the frame to ⟨length⟩
% - enhanced jigsaw: abbreviation for skin=enhanced, while this skin translates the drawing commands of the core package into tikz path commands
% - height=⟨length⟩ Sets the total height of the colored box to ⟨length⟩ independent of the box content. (no default)
% - text fill This style sets /tcb/before upper→ P. 70 and /tcb/after upper→ P. 71 to embed the upper part with a minipage. This allows to use vertical glue macros like \vfill to act like expected. If the box has no fixed height, setting /tcb/text fill has no other effect as making the box unbreakable. (style, no value)
\newtcolorbox{sidebgbox}[1][]{nobeforeafter,boxrule=0pt,enhanced jigsaw,height=\heigthpage,text fill,#1}
\newtcolorbox{bgbox}[1][]{nobeforeafter,boxrule=0pt,enhanced jigsaw,#1}

\newcommand{\sidesection}[1]{%
    \noindent
    \begin{sidebgbox}[height=\paperheight,colback=sidecolor,width=0.33\textwidth]
    #1
    \end{sidebgbox}%
}
\newcommand{\mainsection}[1]{%
    \noindent
    \begin{bgbox}[height=\paperheight,colback=white,width=0.67\textwidth]
    #1
    \end{bgbox}%
}

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
	\vspace{4pt}% Whitespace before the section title
	\settowidth{\SectionTitleLength}{\large #1 }% Calculate the width of the section title
	\addtolength\TotalSectionLength{-\SectionTitleLength}% Subtract the section title width from the total width
	\addtolength\TotalSectionLength{-2.22221pt}% Modifier to remove overfull box warning
	\vspace{8pt}% Whitespace before the section title
	{\color{mainblue} \large #1 \rule[0.15\baselineskip]{\TotalSectionLength}{1pt}}% Print the title and auto-width rule
}

% show different url and colorize 
\newcommand{\colorhrefcustom}[2]{\href{#1}{\textcolor{bluecolorurl}{{#2}}}}
\newcommand{\colorhref}[1]{
    \colorhrefcustom{#1}{#1}
}

% Define custom commands for CV info
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvsitepersonal}[1]{\renewcommand{\cvsitepersonal}{#1}}
\newcommand{\cvstackoverflow}[1]{\renewcommand{\cvstackoverflow}{#1}}
\newcommand{\cvlinkedin}[1]{\renewcommand{\cvlinkedin}{#1}}
\newcommand{\cvskypeurl}[1]{\renewcommand{\cvskypeurl}{#1}}
\newcommand{\cvgithub}[1]{\renewcommand{\cvgithub}{#1}}
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}

% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}}

% Command for printing skill progress bars
\newcommand\skills[1]{ 
	\renewcommand{\skills}{
		\begin{tikzpicture}
			\foreach [count=\i] \x/\y in {#1}{
				\draw[fill=maingray,maingray] (0,-\i) rectangle (6,-\i+0.4);
				\draw[fill=white,mainblue](0,-\i) rectangle (1.2*\y,-\i+0.4);
				\node [above right] at (0,-\i+0.4) {\x};
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

%----------------------------------------------------------------------------------------
%	 SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makenamejobrows}{
    
    %------------------------------------------------
    
    {\Large\color{mainblue}\cvname\medskip}
    
    {\Large\color{black!80}\cvjobtitle\bigskip}

}

\newcommand{\makeheaderprofilenoimg}{
    \bigskip
    \makenamejobrows
}

\newcommand{\makeheaderprofile}{
    
	% use \centerline to handle image margins
    \centerline{\includegraphics[width=\textwidth]{\profilepic}\bigskip}
    
    %------------------------------------------------
    
    \makenamejobrows

}

\newcommand{\makeinfoprofile}{
    \begin{tabular}{p{0.5cm} @{\hskip 0.5cm}p{5cm}}
        % \ifthenelse{\equal{\cvdate}{}}{}{\textsc{\Large\icon{\Info}} & \cvdate\\}
        \ifthenelse{\equal{\cvnumberphone}{}}{}{\textsc{\Large\icon{\Telefon}} & \cvnumberphone\\}
        \ifthenelse{\equal{\cvaddress}{}}{}{\textsc{\Large\icon{\faMapMarker}} & \cvaddress\\}
        % \ifthenelse{\equal{\cvgithub}{}}{}{\textsc{\large\icon{\faGithub}} & \href{https://github.com/\cvgithub}{\textcolor{mainblue}{{\cvgithub}}}\\}
        % \ifthenelse{\equal{\cvgithub}{}}{}{\textsc{\large\icon{\Mundus}} & \href{https://\cvsitepersonal}{\textcolor{mainblue}{{\cvsitepersonal}}}\\}
        \ifthenelse{\equal{\cvmail}{}}{}{\textsc{\large\icon{@}} & \href{mailto:\cvmail}{\textcolor{mainblue}{{\cvmail}}}\\}
        %\ifthenelse{\equal{\cvlinkedin}{}}{}{\textsc{\Large\icon{\faLinkedin}} & \href{https://www.linkedin.com/in/\cvlinkedin/en}{\textcolor{mainblue}{{\cvlinkedin}}}\\}
        % \ifthenelse{\equal{\cvskypeurl}{}}{}{\textsc{\Large\icon{\faSkype}} & \href{skype:\cvskypeurl?chat}{\textcolor{black!80}{{\cvskypeurl}}}\\}
        % \ifthenelse{\equal{\cvstackoverflow}{}}{}{\textsc{\Large\icon{\faStackOverflow}} & \href{https://stackoverflow.com/users/\cvstackoverflow}{\textcolor{mainblue}{{\cvstackoverflow}}}\\}
    \end{tabular}
    
}

\newcommand{\makeskillsprofile}{

    %------------------------------------------------
        % In case of longer "about me" or "languages" section, move languages to \makeprofileshort command
        
    \profilesection{Skills}

    \skills
    \bigskip
    \scriptsize
    Schaal: 0 (Basis skills) - 10 (Expert).
    \normalsize
    
    %------------------------------------------------
}

\newcommand{\aboutme}[1]{
    \profilesection{Over Mij}
    \begin{flushleft}
        #1
    \end{flushleft}
}

\newcommand{\customsidesection}[2]{
    \profilesection{#1}
    \begin{flushleft}
        #2
    \end{flushleft}
}

\newcommand{\makefooterprofile}[2]{
        \smallskip
        \scriptsize
		#1.\newline
		#2
}


%----------------------------------------------------------------------------------------
%	 COLOURED SECTION TITLE BOX
%----------------------------------------------------------------------------------------

\newcommand{\customsection}[1]{%
  \colorbox{maingray}{\parbox{\dimexpr\textwidth-2\fboxsep}{\large #1}}
}

\renewcommand{\section}[1]{
	{%
            \bigskip
		\color{mainblue}%
		\customsection{#1}%
            % \smallskip
	}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}{%
		\large\color{maingray} #1%
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

\newcommand{\twentyitem}[4]{%
	#1&\parbox[t]{0.83\textwidth}{%
		% \textbf{#2}%
		#2 %
		\hfill%
		{\footnotesize#3}\\%
		\textbf{#4}\vspace{\parsep}%
	}\\
}

%----------------------------------------------------------------------------------------
%	 MID LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{twentymid}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentymiditem}[3]{%
	#1&\parbox[t]{0.83\textwidth}{%
		% \textbf{#2}%
		#2 %
		\hfill%
		{\footnotesize#3}\\%
		% \textbf{#4}\vspace{\parsep}%
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
		% \textbf{#2}%
		\textbf{#2}
	}\\
}

%----------------------------------------------------------------------------------------
%	 MARGINS AND LINKS
%----------------------------------------------------------------------------------------

%\RequirePackage[left=7.6cm,top=0.1cm,right=1cm,bottom=0.2cm,nohead,nofoot]{geometry}

% end
