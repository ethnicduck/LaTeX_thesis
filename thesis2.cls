%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Identification part
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[2001]
\ProvidesClass{thesis2}[2003/11/30 UCD Thesis Class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Declaration of options
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\widowpenalty=10000 
\clubpenalty=10000

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Execution of options
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Package loading
%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[12pt,letterpaper]{report}
\usepackage{epsfig}
\usepackage{theorem}
\usepackage{longtable}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{url}
\usepackage{moreverb}
\usepackage{fancyhdr}
\usepackage{geometry}
\usepackage[nodayofweek]{datetime}
\usepackage{graphicx}%		added here so not in thesis.tex
\usepackage{afterpage}
\usepackage{rotating}
\usepackage{caption}%		used in insertable
\usepackage{lscape}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Special commands for
% package and class files
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tells the fancyhdr package to put page numbers on the right - For this, use \pagestyle{fancy} instead of {plain}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\rfoot{\thepage}

% Sets up the \verbatim environment To Print As \small by default.
\g@addto@macro\@verbatim\small 

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Special class file commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\geometry{ % 1.5in On Left, 1.0in On top/bottom/Right, gives 6x9 For text
  body={6.5in, 9in},		%this was body={6in,9in},
  left=1in,				%this was left=1.5in,
  top=1in,
  footskip=.25in % puts .3in between text/footer, so footer Is .75in from bottom of page.
}

% Horizotal Margins - removed, overruled by "geometry" package.
%\setlength{\evensidemargin}{0in} % For two-sided printing
%\setlength{\oddsidemargin}{.5in}
%\setlength{\textwidth}{6in}
% Vertical Margins
%\setlength{\topmargin}{0in}
%\setlength{\headheight}{0in}
%\setlength{\headsep}{0in}
% 1.5 inch top margin
%\setlength{\textheight}{8in}
% 1.5 inch bottom margin (footer .75 in from bottom)
%\setlength{\footskip}{0.7in}

\setlength{\parindent}{4ex}
\setlength{\arraycolsep}{0.25\arraycolsep}
\tolerance=500

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Effective \baselinestretch          %
% values for different font sizes.    %
% Latex Companion page 53             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spacing          | 10pt  11pt  12pt %
%------------------|------------------%
% one and one-half | 1.25  1.21  1.24 %
% double           | 1.67  1.62  1.66 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set line spacing
\newcommand{\singlespace}{0.8}
\newcommand{\normalspace}{1.66}
\newcommand{\dblspace}{1.66}
\newcommand{\oneplushalf}{1.24}
\renewcommand{\baselinestretch}{\normalspace}
\newcommand{\@linespace}{%
  \renewcommand{\baselinestretch}{\singlespace}
  \normalsize
  \null\par
  \renewcommand{\baselinestretch}{\normalspace}
  \normalsize
}

% Setup counters for sections (add more as needed)
\@addtoreset{section}{chapter}
\@addtoreset{subsection}{section}
\@addtoreset{subsubsection}{subsection}
\setcounter{secnumdepth}{4}
\renewcommand{\thepart}{}
\renewcommand{\thechapter}{\Roman{chapter}}						%changed from \arabic to \Roman
\renewcommand{\thesection}{\thechapter.\arabic{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}

% Setup counters for figures and tables
\@addtoreset{figure}{chapter}
\@addtoreset{table}{chapter}
\renewcommand{\thefigure}{\thechapter.\arabic{figure}}
\renewcommand{\thetable}{\thechapter.\arabic{table}}

\@addtoreset{equation}{chapter}
\renewcommand{\theequation}{\thechapter.\arabic{equation}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup Tables of Contents,
% List of Figures,
% List of Tables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Someone Put this so there was no indentation of the tables of contents; seems the graduate school DOES want this, so I fixed it.
% To revert, swap the commented out lines For section, subsection, subsubsection.
% I also removed the vertical Space above the titles For these pages; I think they are supposed To be flush With the page.

\renewcommand{\l@part}{\@dottedtocline{0}{0em}{0em}}
\renewcommand{\l@chapter}{\@dottedtocline{0}{0em}{1.4em}}
%\renewcommand{\l@section}{\@dottedtocline{1}{0em}{2.3em}}
\renewcommand{\l@section}{\@dottedtocline{1}{2em}{2.3em}}
%\renewcommand{\l@subsection}{\@dottedtocline{2}{0em}{3.2em}}
\renewcommand{\l@subsection}{\@dottedtocline{2}{4em}{3.2em}}
%\renewcommand{\l@subsubsection}{\@dottedtocline{2}{0em}{4.1em}}
\renewcommand{\l@subsubsection}{\@dottedtocline{2}{6em}{4.1em}}
\renewcommand{\l@figure}{\@dottedtocline{0}{0em}{2.4em}}
\renewcommand{\l@table}{\@dottedtocline{0}{0em}{2.4em}}
\renewcommand{\tableofcontents}{
  \clearpage
  %\vspace*{0.25in}
  \centerheading{TABLE OF CONTENTS}
  \addtocontents{toc}{CHAPTER}  			%chapters should have capital Roman numerals and be all caps
\@starttoc{toc}
  \clearpage
}
\renewcommand{\listoffigures}{
  \clearpage
  %\vspace*{0.25in}
  \part[Figures]{LIST OF FIGURES}
  \addtocontents{lof}{FIGURE}
  \@starttoc{lof}
  \clearpage
}
\renewcommand{\listoftables}{
  \clearpage
  %\vspace*{0.25in}
  \part[Tables]{LIST OF TABLES}
  \addtocontents{lot}{TABLE}
  \@starttoc{lot}

  \clearpage
}
\newcommand{\centerheading}[1]{\begin{center}{\textbf{#1}}\end{center}}

%%%%%%%%%%%%%%%%%%%%
% Front-matter
%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Define parts of title page.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\title}[1]{
  \gdef\@title{#1}
}
\renewcommand{\author}[2]{
  \gdef\@fwdname{#1 #2}
  \gdef\@revname{#2, #1}
}
\newcommand{\degree}[2]{
  \gdef\@fulldegree{#1}
  \gdef\@degree{#2}
}
\newcommand{\degreeyear}[1]{
  \gdef\@degreeyear{#1}
}
\newcommand{\otherdegrees}[1]{
  \gdef\@otherdegrees{#1}
}
\newcommand{\dept}[2]{
  \gdef\@deptorg{#1}
  \gdef\@deptname{#2}
}
\renewcommand{\titlepage}{
  \clearpage
  \renewcommand{\baselinestretch}{\dblspace}
  \normalsize

% Adjusted spacing And wording To align With the graduate school template.
  
  \vspace*{1.00in}
  \begin{center}
    \uppercase\expandafter{\@title}\\
    by\\
    \uppercase\expandafter{\@fwdname}\\
    \@otherdegrees\\
  \end{center}
  \null\par
  \null\par
  \null\par
  \begin{center}
    A thesis submitted to the\\
    Faculty of the Graduate School of the\\
    University of Colorado in partial fulfillment\\
    of the requirements for the degree of\\
    \@fulldegree\\
    \@deptorg \@deptname\\
    \@degreeyear\\
  \end{center}

  \renewcommand{\baselinestretch}{\normalspace}
  \normalsize
  \clearpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Environment for dedication or acknowledgment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{block}{%
  \renewcommand{\baselinestretch}{\oneplushalf}
  \normalsize
  \noindent
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Approval page
% Add more readers as necessary.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\chair}[1]{
  \gdef\@chair{#1}
}
\newcommand{\advisor}[2]{
  \gdef\@advisor{#2}
  \gdef\@advisortitle{#1}
}
\newcommand{\readerone}[1]{
  \gdef\@readerone{#1}
}
\newcommand{\readertwo}[1]{
  \gdef\@readertwo{#1}
}
\newcommand{\readerthree}[1]{
  \gdef\@readerthree{#1}
}
\newcommand{\@signature}[1]{
  \vspace{.40in}
  \renewcommand{\baselinestretch}{\singlespace}
  \normalsize
  \begin{center}
    \rule{3in}{0.4pt}\\
    #1
  \end{center}
  \renewcommand{\baselinestretch}{\normalspace}
  \normalsize
}
\newcommand{\@dateline}{%
  \renewcommand{\baselinestretch}{\singlespace}
  \normalsize

% Style of Date Line has been updated.
  
  \vspace{.5in}
  \vfill
  \begin{flushright}
%       October 26, 2012\\
%     Date~\rule{1.5in}{0.4pt}\\
    Date:  \usdate\displaydate{defensedate}
  \end{flushright}
  \renewcommand{\baselinestretch}{\normalspace}
  \normalsize
}
\newcommand{\approvalpage}{
  \clearpage
  \vspace*{0.5in}
  \renewcommand{\baselinestretch}{\dblspace}
  \normalsize

  % There have been some wording And spacing adjustments, As well As the removal of the signature lines.
  % This one was a special Fix For my Case; the advisor And chair are no longer supposed To be the same person,
  % And If the advisor Is Not On the committee, their Name should appear at the End.  You may have To customize this.
  
  \begin{center}
    This thesis for the \@fulldegree\ degree by\\
    \@fwdname\\
    has been approved for the\\
 \@deptorg \\
    by\\
  \end{center}
  \null\par
  \null\par
  \begin{center}
    \@chair, Chair\\
   \@advisor, Advisor\\
    \@readerone\\
    \@readertwo\\
    \@readerthree\\
  \end{center}

 \@dateline

  \renewcommand{\baselinestretch}{\normalspace}
  \normalsize
  \clearpage
}

%%%%%%%%%%%%%%%%
% Abstract page
%%%%%%%%%%%%%%%%
% The wording here has been updated. Also, no more signature lines.

\newcommand{\@abstractsignature}[1]{
  \renewcommand{\baselinestretch}{\normalspace}
  \normalsize
  \noindent
 \begin{flushright}
 The form and content of this abstract are approved. I 			%this is supposed to be right justified
  recommend its publication.
\end{flushright}
 % \null\par
  %\null\par
  \begin{flushright}
    \renewcommand{\baselinestretch}{\singlespace}
    \normalsize
    Approved:~\@advisor
  \end{flushright}

  \renewcommand{\baselinestretch}{\normalspace}
  \normalsize
}
\newcommand{\@abstractheading}{
  \renewcommand{\baselinestretch}{\singlespace}
  \normalsize
  %\vspace*{0.24in} %Don't want vertical space here
  \noindent
  \@revname\ (\@degree)
  \newline
  \@linespace
  \noindent
  \@title
  \@linespace
  \noindent
  Thesis directed by \@advisortitle\ \@advisor

  \renewcommand{\baselinestretch}{\normalspace}
  \normalsize
}
\newcommand{\abstractpage}[1]{
  \clearpage
  %\pagestyle{empty} %removed; want these pages With numbers.
  %\vspace*{0.25in}  %also removed; want pages To start at top of page.
  \@abstractheading

  \renewcommand{\baselinestretch}{\oneplushalf}
  \normalsize
  \@linespace
  \@linespace
  \@linespace
  \@linespace

  \centerline{ {\bf ABSTRACT} }
  #1

  %\@linespace
  %\@linespace
  \@linespace
  \@linespace

  \@abstractsignature{\expandafter\@advisor}
  \clearpage
  %\pagestyle{empty} %removed this; seems we want these pages With numbers.
}

%%%%%%%%%%%%%%%%%%
% Section commands
%%%%%%%%%%%%%%%%%%
%
% The part section is used for List of Figures and Tables
% For some reason, the startsection method does not work
% for this level
%

\renewcommand{\part}{\secdef\@part\@spart}
\renewcommand{\@part}[2][]{%
  \centerheading{#2}
%  \addcontentsline{toc}{part}{#1}
}
\renewcommand{\@spart}[1]{%
  \centerheading{#1}
}

\renewcommand{\chapter}{\clearpage
  %\vspace*{0.24in}
  \@afterindenttrue
  \secdef\@chapter\@schapter
}

\renewcommand{\@chapter}[2][]{%
  \refstepcounter{chapter}
  \begin{center}
 %{\textbf{CHAPTER \thechapter~~#2}}
{\textbf{CHAPTER \thechapter\\#2}}
  \end{center}
  \vspace{-1em}
  \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter.}#1}
  \@afterheading
}
\renewcommand{\@schapter}[1]{%
  \clearpage
  \begin{flushleft}
  {\bf#1}
  \end{flushleft}
  \vspace{-1em}
  \@afterheading
}

\renewcommand{\section}{
  \vspace{-0.24in}
  \vspace*{0.24in}
  \@afterindenttrue
  \secdef\@section\@ssection
}
\newcommand{\@section}[2][]{%
  \refstepcounter{section}
  \begin{flushleft}
  {\bf\thesection~~#2}
  \end{flushleft}
  \vspace{-1em}
  \addcontentsline{toc}{section}{\protect\numberline{\thesection}#1}
  \@afterheading
}
\newcommand{\@ssection}[1]{%
  \clearpage
  \begin{flushleft}
  {\bf#1}
  \end{flushleft}
  \vspace{-1em}
  \@afterheading
}

\renewcommand{\subsection}{
  \vspace{-0.24in}
  \vspace*{0.24in}
  \@afterindenttrue
  \secdef\@subsection\@ssubsection
}
\newcommand{\@subsection}[2][]{%
  \refstepcounter{subsection}
  \begin{flushleft}
  {\bf\thesubsection~~#2}
  \end{flushleft}
  \vspace{-1em}
  \addcontentsline{toc}{subsection}{\protect\numberline{\thesubsection}#1}
  \@afterheading
}
\newcommand{\@ssubsection}[1]{%
  \clearpage
  \begin{flushleft}
  {\bf#1}
  \end{flushleft}
  \vspace{-1em}
  \@afterheading
}

\renewcommand{\subsubsection}{
  \vspace{-0.24in}
  \vspace*{0.24in}
  \@afterindenttrue
  \secdef\@subsubsection\@ssubsubsection
}
\newcommand{\@subsubsection}[2][]{%
  \refstepcounter{subsubsection}
  \begin{flushleft}
  {\bf\thesubsubsection~~#2}
  \end{flushleft}
  \vspace{-1em}
  \addcontentsline{toc}{subsubsection}{\protect\numberline{\thesubsubsection}#1}
  \@afterheading
}
\newcommand{\@ssubsubsection}[1]{%
  \clearpage
  \begin{flushleft}
  {\bf#1}
  \end{flushleft}
  \vspace{-1em}
  \@afterheading
}


% New environment for appendix
\renewenvironment{appendix}{%
  \clearpage
  \addtocontents{toc}{\noindent\underline{Appendix}}

  \renewcommand{\chapter}{\clearpage
    \vspace*{0.24in}
    \@afterindenttrue
    \secdef\@chapter\@schapter
  }

  \renewcommand{\@chapter}[2][]{%
    \refstepcounter{chapter}
    \begin{flushleft}
    {\bf APPENDIX \thechapter.~~##2}
    \end{flushleft}
    \vspace{-1em}
    \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter.}##1}
    \@afterheading
  }

  \renewcommand{\@schapter}[1]{%
    \clearpage
    \begin{flushleft}
    {\bf##1}
    \end{flushleft}
    \vspace{-1em}
    \@afterheading
  }

  %\renewcommand{\thechapter}{\Alph{chapter}}			% I think this is where I can change format of title chapters in table of contents
%\renewcommand\thechapter{\Roman{chapter}}

  \setcounter{chapter}{0}}

  {\renewcommand{\thechapter}{\arabic{chapter}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Special commands for formatting the
% captions.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newlength{\C@aptionWidth}
\newcommand{\@maketblcaption}[2]{%
  \vspace{10pt}
  \settowidth{\C@aptionWidth}{{\bf Table \thetable:~~}#2}

    \renewcommand{\baselinestretch}{\singlespace}
    \normalsize

  \ifnum\C@aptionWidth<\linewidth
    \begin{center}
    {\bf Table \thetable:~~}#2
    \end{center}
  \else
    {\bf Table \thetable:~~}#2
  \fi
}
\newcommand{\@makefigcaption}[2]{%
  \vspace{10pt}
  \settowidth{\C@aptionWidth}{{\bf Figure \thefigure:~~}#2}

    \renewcommand{\baselinestretch}{\singlespace}
    \normalsize

  \ifnum\C@aptionWidth<\linewidth
    \begin{center}
    {\bf Figure \thefigure:~~}#2
    \end{center}
  \else
    {\bf Figure \thefigure:~~}#2
  \fi
}
\renewcommand{\figure}{\let\@makecaption\@makefigcaption\@float{figure}}
\renewcommand{\table}{\let\@makecaption\@maketblcaption\@float{table}}

%% added figuretitle because I couldn't find a better way to include a title and a caption in a figure
\newcommand*{\figuretitle}[1]{%
    {\centering%   <--------  will only affect the title because of the grouping (by the
    \textbf{#1}%              braces before \centering and behind \medskip). If you remove
    \par\medskip}%            these braces the whole body of a {figure} env will be centered.
}

%inserts new figure with title and caption
% syntax is \insertfigure{File}{label}{Title}{Caption}
\newcommand{\insertfigure}[4]{
	\afterpage{
		\begin{figure}[p!] %consider other placement options. see: https://en.wikibooks.org/wiki/LaTeX/Floats,_Figures_and_Captions
	%	ht! seemed to interleave it with the text pretty well
		\centering
		\figuretitle{#3}
		\includegraphics[width=\linewidth]{#1}
		\renewcommand{\baselinestretch}{0.5}
		\caption[#3]{#4 \label{#2}}
		\end{figure}
		\clearpage
	}
}

%inserts new figure with title and caption
% syntax is \insertfigure{File}{label}{Title}{Caption}
\newcommand{\insertscalefigure}[5]{
	\afterpage{
		\begin{figure}[p!] %consider other placement options. see: https://en.wikibooks.org/wiki/LaTeX/Floats,_Figures_and_Captions
	%	ht! seemed to interleave it with the text pretty well
		\centering
		\figuretitle{#3}
		\includegraphics[totalheight=#5]{#1}
		\renewcommand{\baselinestretch}{1}
		\caption[#3]{#4 \label{#2}}
		\end{figure}
		\clearpage
	}
}

\newcommand{\inserthfigure}[4]{
	\afterpage {
		\begin{sidewaysfigure}
		\centering
		\figuretitle{#3}
    		 \includegraphics[width=\linewidth]{#1}
		\renewcommand{\baselinestretch}{1}
		\caption[#3]{#4 \label{#2}}
		\end{sidewaysfigure}
		 \clearpage
	}
}

\newcommand{\insertscalehfigure}[5]{
	\afterpage {
		\begin{sidewaysfigure}
		\centering
		\figuretitle{#3}
    		 \includegraphics[width=#5]{#1}
		\renewcommand{\baselinestretch}{1}
		\caption[#3]{#4 \label{#2}}
		\end{sidewaysfigure}
		\clearpage
	}
}

\newcommand{\inserttable}[5]{
	\afterpage {
		\begin{table}
		\centering
		\renewcommand{\baselinestretch}{1}
		\caption[#3]{\textbf{#3} \\#4 \label{#2}}
		{\small\renewcommand{\arraystretch}{#5}
			\resizebox*{\textwidth}{!}{\input{#1}}
		}
		\end{table}
		\clearpage
	}
}

%insert a sideways table- still needs de-bugging
\newcommand{\inserthtable}[5]{
	\afterpage {
		\begin{sidewaystable}
		\centering
		\renewcommand{\baselinestretch}{1}
		\caption[#3]{\textbf{#3} \\#4 \label{#2}}
		{\small\renewcommand{\arraystretch}{#5}
			\resizebox*{\textwidth}{!}{\input{#1}} 
		}
		\end{sidewaystable}
		\clearpage
	}
}

% Places Reference page in table of contents
\renewcommand{\thebibliography}[1]{%
  \renewcommand{\baselinestretch}{1}
  \normalsize

  \section*{\centerheading{REFERENCES}
            \markboth{REFERENCES}{REFERENCES}}
  \addcontentsline{toc}{chapter}{REFERENCES}
  \vspace*{0.5cm}
  \list
  {[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
  \advance\leftmargin\labelsep
  \usecounter{enumi}}
  \def\newblock{\hskip .11em plus .33em minus -.07em}
  \sloppy
  \sfcode`\.=1000\relax}

% FOOTNOTES
% change it so that footnotes are printed in single spacing
%
\long\def\@footnotetext#1{\insert\footins{\renewcommand\baselinestretch{1}
    \footnotesize
    \interlinepenalty\interfootnotelinepenalty 
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
   \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
    {\rule{\z@}{\footnotesep}\ignorespaces
      #1\strut}\renewcommand\baselinestretch{\@spacing}}}
