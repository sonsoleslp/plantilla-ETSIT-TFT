%%% =========================================================================
%%% File Name: upmthesis.cls
%%% Last Modification Date: %G%     %U%
%%% Current Version: %M%    %I%
%%% File Creation Date: November 24, 2011
%%% Changed: Javier Cervino Arriba <jcervino@dit.upm.es>
%%% Changed: Sonsoles López Pernas <slopez@dit.upm.es>
%%% =========================================================================
%%%
%%% This is not a clean and optimal LaTeX2e class port yet.
%%%
%%% I would appreciate any help/comments and improvements. The goal is
%%% to make this an official ETSIT UPM thesis style for LaTeX2e.
%%%
\ProvidesClass{thesis_style/upmthesis}[2011/11/24 Thesis Class, DIT, Universidad Politecnica de Madrid, jca]

\LoadClass[a4paper,12pt,twoside]{report}

\RequirePackage[a4paper,heightrounded=true]{geometry}
\RequirePackage{ifthen,ulem,setspace,mathptmx}
\RequirePackage[dvips]{graphicx}
\RequirePackage[usenames,dvipsnames]{color}

\RequirePackage[T1]{fontenc}
\RequirePackage{times}
\usepackage[spanish]{babel}
\selectlanguage{spanish}
\usepackage[utf8]{inputenc}
%\setlength{\paperheight}{297mm}%
%\setlength{\paperwidth}{210mm}%

\DeclareOption{twoside}{\@twosidetrue}

\graphicspath{{logos/}}

\ProcessOptions

\newif\if@upmthesis
\@upmthesistrue

\newcommand{\makefrontmatter}[3]{

\makeindex
\begin{document}

  \begin{frontmatter}
   \pagenumbering{gobble}
   \makecover
   \maketitle
   \makecommittee
   \include{#1}
   \include{#2}
   \tableofcontents
    \renewcommand{\addvspace}[1]{}
   \listoffigures
   \listoftables
   \include{#3}
  \end{frontmatter}
\pagenumbering{arabic}
\linespacing{1.2}

}
\definecolor{orange}{rgb}{1,0.5,0}
\newcommand{\note}[1]{\noindent{\color{orange}\textbf{[\textbf{NOTE:} #1]}}}
\newcommand{\todo}[1]{
    \addcontentsline{tdo}{todo}{\protect{#1}}
    \noindent{\color{blue}[\textbf{TODO:} #1]}
}
\newcommand\l@todo[2]{\@dottedtocline{1}{0em}{0em}{{\color{blue}- #1}}{#2}}
\newcommand \listoftodos{
    \chapter*{Todo List}
    {\normalsize \color{blue} \linespacing{1.5} \@starttoc{tdo}}
}


\setlength{\belowcaptionskip}{6pt}
 
\newcommand{\change}[2]{{\color{red}[\textbf{CHANGE:} \sout{#1}/#2]}}

\newcommand{\ie}{i.e.\ }
\newcommand{\eg}{e.g.\ }
\newcommand{\etal}{et al.\ }
\newcommand{\code}{\texttt}


% MARGIN DEFINITIONS

%\lineskip 1pt
%\normallineskip 1pt
\def\baselinestretch{1}

% Left and right margins
\if@twoside
 \oddsidemargin 0.92cm
 \evensidemargin 0cm
 \marginparwidth 0cm
\else
 \oddsidemargin 0cm
 \evensidemargin 0cm
 \marginparwidth 0cm
\fi
\marginparsep 0in
\textwidth 15cm

% Top and bottom margins
\voffset 0cm       %    Plus 1 inch
\topmargin 0cm
\headheight 0.3cm
\headsep 0.7cm
\textheight 22.16cm

%\columnsep 10pt
%\columnseprule 0pt

\footnotesep 11.4pt
%\let\footnotesize\small


\skip\footins 18pt plus 12pt minus 6pt
\floatsep 24pt plus 6pt minus 6pt
\textfloatsep 36pt plus 10pt minus 10pt
\intextsep 24pt plus 6pt minus 6pt

\def\@pnumwidth{1.55em}
\def\@tocrmarg {2.55em plus 1fil}
\def\@dotsep{4.5}
\setcounter{tocdepth}{2}

\def\tableofcontents{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \fi\chapter*{Índice\@mkboth{ÍNDICE}{ÍNDICE}} \thispagestyle{empty}
 \@starttoc{toc}\if@restonecol\twocolumn\fi}

\def\l@part#1#2{\addpenalty{-\@highpenalty}
 \addvspace{2.25em plus 1pt}
 \begingroup
 \@tempdima 3em
 \parindent \z@ \rightskip \@pnumwidth
 \parfillskip -\@pnumwidth   
 {\large \bf
 \leavevmode
 #1\hfil \hbox to\@pnumwidth{\hss #2}}\par
 \nobreak
 \endgroup}

\def\l@chapter#1#2{\pagebreak[3] 
 \vskip 1.0em plus 1pt
 \@tempdima 1.5em
 \begingroup
 \parindent \z@ \rightskip \@pnumwidth 
 \parfillskip -\@pnumwidth 
 \parskip \z@
 \large \bf
 \leavevmode
 \advance\leftskip\@tempdima
 \hskip -\leftskip
 #1\nobreak\hfil \nobreak\hbox to\@pnumwidth{\hss #2}\par
 \endgroup}
 
\def\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\def\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\def\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\def\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\def\l@subparagraph{\@dottedtocline{5}{12em}{6em}}

\def\listoffigures{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \fi\chapter*{Figuras\@mkboth
 {FIGURAS}{FIGURAS}} \thispagestyle{empty}
 \addcontentsline{toc}{frontmatter}{\protect\numberline
 {\hfil}Lista de Figuras}\@starttoc{lof}\if@restonecol
 \twocolumn\fi}

\def\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}

\def\listoftables{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \fi\chapter*{Tablas\@mkboth
 {TABLAS}{TABLAS}} \thispagestyle{empty}
 \addcontentsline{toc}{frontmatter}{\protect\numberline
 {\hfil}Lista de Tablas}\@starttoc{lot}\if@restonecol
 \twocolumn\fi}

\let\l@table\l@figure

\def\l@frontmatter#1#2{\pagebreak[3]
 \@tempdima 1.5em \begingroup
 \parindent \z@ \rightskip \@pnumwidth 
 \parfillskip -\@pnumwidth 
 \leavevmode #1\hfil \hbox to\@pnumwidth{\hss #2}\par
 \endgroup}

% \def\thebibliography#1{\chapter*{Bibliograf\'ia\@mkboth
%  {BIBLIOGRAF\'IA}{BIBLIOGRAF\'IA}}\addcontentsline
%  {toc}{chapter}{\protect\numberline {\hfill} Bibliograf\'ia}\list
%  {[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
%  \advance\leftmargin\labelsep
%  \usecounter{enumi}}
%  \def\newblock{\hskip .11em plus .33em minus .03em}
%  \sloppy
%  \uchyph=1\sfcode`\.=1000\relax}

% \let\endthebibliography=\endlist

\def\titlepage{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \else \newpage \fi \thispagestyle{empty}\c@page\z@}

\def\endtitlepage{\if@restonecol\twocolumn \else \newpage \fi}

% Rich Baraniuk's modifications to make fig and table caps work
%\renewcommand{\fnum@figure}{Figure \thefigure \setlength{\baselineskip}{5.5mm}}
%\renewcommand{\fnum@table}{Table \thetable \setlength{\baselineskip}{5.5mm}}
\renewcommand{\fnum@figure}{Figura \thefigure \linespacing{1}}
\renewcommand{\fnum@table}{Tabla \thetable \linespacing{1}}

\newcommand{\upmlogo}{%
  \includegraphics[scale=0.4]{upm.eps}}
\newcommand{\art}{\@coverart}

\newcommand{\etsitlogo}{%
  \includegraphics[width=0.6\textwidth]{logoETSIT.eps}}

\def\makecover{%
\begin{titlepage}
  \null\linespacing{1}\setcounter{page}{1}\vfill
  \vbox to 0pt{\vss\vbox to 8.75in{\parskip 0pt \parindent 0pt\centering
      {\Large \bf \uppercase\expandafter{\@university} \par} \vskip 0pt plus 1fil
      {\Large \@school \par} \vskip 0pt plus 4fil
      \etsitlogo \vskip 0pt plus 4fil
      
      {\Large \bf \uppercase\expandafter{\@title} \par} \vskip 0pt plus 2fil
      {\Large \uppercase\expandafter{\@degree} \par} \vskip 0pt plus 3.5fil
      {\Large \expandafter{\@typeofwork} \par} \vskip 0pt plus 3fil
      {\Large \bf \uppercase\expandafter{\@author} \par}  \vskip 0pt plus 0fil
      {\large \bf \textit{\@authortitle} \par}  \vskip 0pt plus .8fil
      {\large \@city, \@country \par} \vskip 0pt plus 0fil
      {\large \@monthf, \@yearf \par}}}\cleardoublepage

\end{titlepage}}

\def\maketitle{% Second title page
\begin{titlepage}
  \null\linespacing{1}\setcounter{page}{1}\vfill
  \vbox to 0pt{\vss\vbox to 8.75in{\parskip 0pt \parindent 0pt\centering
      {\large \bf \@department \par} \vskip 0pt plus 1fil
      {\large \bf \@school \par} \vskip 0pt plus 3fil
      \upmlogo \vskip 0pt plus 3fil
      {\large \uppercase\expandafter{\@title} \par} \vskip 0pt plus 1.3fil
      {\Large \bf \uppercase\expandafter{\@degree} \par} \vskip 0pt plus 4.5fil
      {\Large \expandafter{\@typeofwork} \par} \vskip 0pt plus 6fil
      {\large \bf Autor: \@author \par} \vskip 0pt plus 0fil
      {\large \bf \textit{\@authortitle} \par} \vskip 0pt plus 3fil
      {\large \bf Tutor: \@director \par} \vskip 0pt plus 0fil
      {\large \bf \textit{\@directortitle} \par} \vskip  0pt plus 1fil
      {\large \bf Ponente: \@ponente \par} \vskip 0pt plus 0fil
      {\large \bf \textit{\@directortitle} \par} \vskip  0pt plus 3fil
     
      {\large \@monthf, \@yearf \par}}}\cleardoublepage
\end{titlepage}}

\def\makecommittee{% Committe page
\begin{titlepage}
  \null\linespacing{1}\setcounter{page}{1}\vfill
  \vbox to 0pt{\vss\vbox to 600pt{\parskip 0pt \parindent 0pt
      
      \begingroup
      \vskip 1em
      \def\and{\par \vskip 0em plus 1fil\moveright\leftskip%
        \vbox{\hrule width \leftskip}} 
        {\small \textbf{Presidente:}} \@committeepresident \and
        
        {\small \textbf{Vocal:}} \@committeevocalc \and
        {\small \textbf{Secretario:}} \@committeesecretary \and
        {\small \textbf{Suplente:}} \@committeesubstituteb
  \par
      \endgroup \vskip 0pt plus 3fil
      { Realizado el acto de defensa y lectura del TFM el d\'ia \@day~de 
  \@month~de \@year~en \@city, habiendo obtenido la calificaci\'on 
  de \hrulefill\par} \vskip 0pt plus 5fil
      {  El presidente, {\hskip 0pt plus 3fil } El secretario, {\hskip 0pt plus 4fil} El vocal, \par} \vskip 0pt plus 5fil
      }} \cleardoublepage
\end{titlepage}}

\newif\if@bigcommittee \@bigcommitteefalse

\def\school#1{\gdef\@school{#1}}
\def\university#1{\gdef\@university{#1}}
\def\author#1#2{\gdef\@author{#1}\gdef\@authortitle{#2}}
\def\director#1#2{\gdef\@director{#1}\gdef\@directortitle{#2}}
\def\ponente#1#2{\gdef\@ponente{#1}\gdef\@ponentetitle{#2}}
\def\department#1{\gdef\@department{#1}}
\def\coverart#1{\gdef\@coverart{#1}}
\def\degree#1{\gdef\@degree{#1}}
 
 \def\typeofwork#1{\gdef\@typeofwork{#1}}

\def\committee#1{\gdef\@committee{#1}}
\def\committeepresident#1{\gdef\@committeepresident{#1}}
\def\committeevocala#1{\gdef\@committeevocala{#1}}
\def\committeevocalb#1{\gdef\@committeevocalb{#1}}
\def\committeevocalc#1{\gdef\@committeevocalc{#1}}
\def\committeesecretary#1{\gdef\@committeesecretary{#1}}
\def\committeesubstitutea#1{\gdef\@committeesubstitutea{#1}}
\def\committeesubstituteb#1{\gdef\@committeesubstituteb{#1}}
\def\bigcommittee#1{\@bigcommitteetrue\gdef\@committee{#1}}
\def\addr#1#2{\gdef\@city{#1}\gdef\@country{#2}}
\def\donedate#1#2#3{\gdef\@day{#1}\gdef\@month{#2}\gdef\@year{#3}} 
\def\donedatefront#1#2#3{\gdef\@dayf{#1}\gdef\@monthf{#2}\gdef\@yearf{#3}} 
\def\doneday#1{\gdef\@day{#1}} 
\def\donemonth#1{\gdef\@month{#1}}
\def\doneyear#1{\gdef\@yearf{#1}}
\def\donedayf#1{\gdef\@dayf{#1}} 
\def\donemonthf#1{\gdef\@monthf{#1}}
\def\doneyearf#1{\gdef\@year{#1}}
\def\committeedate#1#2#3{\gdef\@cday{#1}\gdef\@cmonth{#2}\gdef\@cyear{#3}} 

\def\@school{Universidad Polit\'ecnica de Madrid}
\def\@department{Departamento de Ingenier\'ia Telem\'atica}
\def\@coverart{\includegraphics{upm.eps}}
\def\@degree{Doctor of Philosophy}
\def\@committee{member 1, Chairman \\ prof \and
 member 2 \\ prof \and member 3 \\ prof}
%\def\@addr{Madrid}{Espa\~na}
\def\@month{\ifcase\month ?\or January\or February\or March\or April\or
 May\or June\or July\or August\or September\or October\or
 November\or December\fi}
\def\@year{\number\year}

\def\abstract{\chapter*{Abstract}\thispagestyle{empty}
 \linespacing{1.2}
 \setcounter{footnote}{0}
 \addcontentsline{toc}{frontmatter}{\protect\numberline
 {\hfil}Abstract}}

% \def\endacknowledge{\setcounter{footnote}{0}}

\def\resumen{\chapter*{Resumen}\thispagestyle{empty}
 \linespacing{1.2}
 \setcounter{footnote}{0}
 \addcontentsline{toc}{frontmatter}{\protect\numberline
 {\hfil}Resumen}}

% \def\endacknowledge{\setcounter{footnote}{0}}

% \def\acknowledge{\chapter*{Agradecimientos}\thispagestyle{empty}
%  \linespacing{1.2}
%  \setcounter{footnote}{0}
%  \addcontentsline{toc}{frontmatter}{\protect\numberline
%  {\hfil}Agradecimientos}}

% \def\endacknowledge{\setcounter{footnote}{0}}

\def\acronyms{\chapter*{Acrónimos \@mkboth
 {ACRÓNIMOS}{ACRÓNIMOS}}\thispagestyle{empty}
 \setcounter{footnote}{0}
 \addcontentsline{toc}{frontmatter}{\protect\numberline
 {\hfil}Lista de Acrónimos}}

\def\endacronyms{\setcounter{footnote}{0}}

\def\preface{\chapter*{Prefacio} \thispagestyle{empty}
 \setcounter{footnote}{0}
 \addcontentsline{toc}{frontmatter}{\protect\numberline
 {\hfil}Preface}}

\def\endpreface{\setcounter{footnote}{0}}

\def\frontmatter{\relax}
\def\endfrontmatter{\cleardoublepage
  \pagenumbering{arabic}\def\thefootnote{\arabic{footnote}}}


\def\linespacing#1{\def\baselinestretch{#1} \let\@tempa\@currsize
 \let\@currsize\relax \@tempa}

\def\@makechapterhead#1{\begingroup
 \def \baselinestretch{1} \parskip \z@ \parindent \z@ \par
 \Large\bf \null \vskip 1.5ex \centering
 \ifnum \c@secnumdepth >\m@ne \@chapapp~\thechapter \vskip 3.5ex \fi
 #1 \vskip 3ex plus .2ex\endgroup}

\def\@makeschapterhead#1{\begingroup
 \def \baselinestretch{1} \parskip \z@ \parindent \z@ \par
 \null \vskip .3in \centering
 \Large \bf #1\par \endgroup \nobreak \vskip .6in\relax}

\renewcommand*{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}%
\thispagestyle{plain}%
\newpage%
\if@twocolumn\hbox{}\newpage\fi\fi\fi}

\def\chapter{\cleardoublepage
 \thispagestyle{empty}
 \global\@topnum\z@
 \@afterindentfalse
 \secdef\@chapter\@schapter}

\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
 \refstepcounter{chapter}
 \typeout{\@chapapp\space\thechapter.}
 \addcontentsline{toc}{chapter}{\protect
 \numberline{\thechapter}#1}\else
 \addcontentsline{toc}{chapter}{#1}\fi
 \chaptermark{#1}
 \addtocontents{lof}{\protect\addvspace{\baselineskip}}
 \addtocontents{lot}{\protect\addvspace{\baselineskip}}
 \if@twocolumn
 \@topnewpage[\@makechapterhead{#2}]  
 \else \@makechapterhead{#2}
 \@afterheading
 \fi}

\def\@schapter#1{\if@twocolumn \@topnewpage[\@makeschapterhead{#1}]
 \else \@makeschapterhead{#1} 
 \@afterheading\fi}

\def\section{\@startsection{section}{1}{\z@}{-3.25ex plus -1ex minus 
 -.2ex}{1.5ex plus .2ex}{\large\bf}}
\def\subsection{\@startsection{subsection}{2}{\z@}{-3.25ex plus -1ex minus 
 -.2ex}{1.5ex plus .2ex}{\normalsize\bf}}
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{-3.25ex plus 
 -1ex minus -.2ex}{1.5ex plus .2ex}{\normalsize\bf}}
\def\paragraph{\@startsection
 {paragraph}{4}{\z@}{3.25ex plus 1ex minus .2ex}{-1em}{\normalsize\bf}}
\def\subparagraph{\@startsection
 {subparagraph}{4}{\parindent}{3.25ex plus 1ex minus 
 .2ex}{-1em}{\normalsize\bf}}

\def\chaptermark#1{}

\setcounter{secnumdepth}{3}

\def\appendix{\par
 \setcounter{chapter}{0}
 \setcounter{section}{0}
 \def\@chapapp{Anexo}
 \def\thechapter{\Alph{chapter}}}

\if@twoside
\def\ps@headings{%
  \let\@mkboth\markboth
  \def\@oddfoot{\centerline{\rm \thepage}}
  \def\@evenfoot{\centerline{\rm \thepage}}
  \def\@evenhead{\hfil \sl \leftmark}
  \def\@oddhead{\hbox{}\sl \rightmark \hfil}
  \def\chaptermark##1{\markboth {\uppercase{##1}}{}}
  \def\sectionmark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\z@
        \thesection. \ \fi ##1}}}}
\else
\def\ps@headings{%
  \let\@mkboth\markboth
  \def\@oddfoot{}\def\@evenfoot{}
  \def\@oddhead{\hbox {}\hfil oneside \rm\thepage}
  \def\chaptermark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\m@ne
        \@chapapp\ \thechapter. \ \fi ##1}}}}
\fi

%\def\ps@myheadings{\let\@mkboth\@gobbletwo
%\def\@oddhead{\hbox{}\sl\rightmark \hfil \rm\thepage}
%\def\@oddfoot{}\def\@evenhead{\rm \thepage\hfil\sl\leftmark\hbox {}}
%\def\@evenfoot{}\def\chaptermark##1{}\def\sectionmark##1{}
%\def\subsectionmark##1{}}

\ps@headings
\onecolumn
\if@twoside\else\raggedbottom\fi

\pagenumbering{roman}
\def\thefootnote{\roman{footnote}}

%
% Until Graduate Studies comes to their senses, put all page numbers
% in the upper-right.  They think that the page number at the bottom-center
% is too close to the bottom of the page.
%
% \let\ps@plain\ps@headings

