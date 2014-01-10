\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{KnuBulletin}

%% LaTeX/XeTeX шаблон для статтей у Вісник Київського національного університету імені Тараса Шевченка, 
%% Серія фізико-математичні науки.
%% 
%% Остання версія завжди тут: https://github.com/ertong/knu-bulletin
%% 
%% Автор: Ігор Литвиненко

\LoadClass[a4paper, 11pt]{article}

%Технічні пакети
\usepackage{ifxetex}
\usepackage{etoolbox}

\ifxetex
    \usepackage[no-math]{fontspec}
    \setmainfont[Ligatures=TeX]{Times New Roman}
    \setsansfont{Arial}
    \setmonofont[Scale=0.9]{Courier New}
	\newfontfamily{\cyrillicfonttt}[Scale=0.9]{Courier New}
	
    \RequirePackage{polyglossia}
    \setdefaultlanguage{ukrainian}
\else
    \RequirePackage[utf8]{inputenc}
    \RequirePackage[english,russian,ukrainian]{babel}
\fi

\usepackage{calc}

\RequirePackage[font=small,format=plain,labelfont=bf,up, skip=2pt, labelsep=period]{caption}
\RequirePackage[stable]{footmisc}
\RequirePackage{graphicx}
\RequirePackage{amsmath}
\RequirePackage{wasysym}%
\RequirePackage{mnsymbol}%
\RequirePackage{amsthm}
\RequirePackage{thmtools}

\RequirePackage{multicol} % Робота з колонками
\RequirePackage{setspace} 

\RequirePackage{url}
\RequirePackage[unicode,bookmarks, colorlinks=false, pdfauthor={Igor Lytvynenko}]{hyperref}

\RequirePackage{float}
\RequirePackage{titlesec}
\titleformat*{\section}{\normalfont\centering\bfseries}
\titlespacing{\section}{0pt}{*1}{*1}


%1em=12pt 1.4pt = 0.117
\usepackage{soul}

% % Оформлення теорем

\declaretheoremstyle[
bodyfont=\normalfont
]{thmstyle}
\declaretheorem[name=Теорема, style=thmstyle]{theorem}
\declaretheorem[name=Твердження, style=thmstyle]{statement}
\declaretheorem[name=Лема, style=thmstyle]{lemma}
\declaretheorem[name=Наслідок, style=thmstyle]{corollary}

\declaretheoremstyle[
headfont=\normalfont\it,
bodyfont=\normalfont
]{defstyle}
\declaretheorem[name=Означення, style=defstyle]{definition}

\declaretheoremstyle[
headfont=\normalfont,
bodyfont=\normalfont
]{examplestyle}
\declaretheorem[name={\addfontfeature{LetterSpace=14.0} Приклад}, style=examplestyle]{example}
\declaretheorem[name={\addfontfeature{LetterSpace=14.0} Зауваження}, style=examplestyle]{remark}

%\theoremstyle{definition}
%\newtheorem{definition}[theorem]{Означення}
%\newtheorem{example}[theorem]{Приклад}
%\theoremstyle{remark}
%\newtheorem{remark}[theorem]{Зауваження}


\renewenvironment{proof}
{\par\noindent{\it Доведення.}}
{\hfill$\scriptstyle \blacksquare $}

% % Деякі скорочення для формул

\def\argmax{\mathop{\rm argmax}\limits}
\def\argmin{\mathop{\rm argmin}\limits}
\def\M{\mathop{\rm M}}
\def\D{\mathop{\rm D}}

\newcommand{\set}[1]{{\left\{#1\right\}}}
\newcommand{\abs}[1]{{\left\lvert#1\right\rvert}}
\newcommand{\norm}[2][]{\left\lVert#2\right\rVert_{#1}}

\newcommand{\prob}[1]{{{\rm P}\set{#1}}}
\newcommand{\E}[1]{{{\rm E}\set{#1}}}

\setlength{\parindent}{.2in}

\DeclareMathSizes{10.95}{10}{8}{6}   % For size 10 text
%\DeclareMathSizes{10}{18}{12}{8}   % For size 10 text
%\DeclareMathSizes{11}{19}{13}{9}   % For size 11 text
%\DeclareMathSizes{12}{20}{14}{10}  % For size 12 text


% % Розміри сторінки

%\RequirePackage[left=0.79in,right=0.79in,top=0.98in,bottom=0.95in,headheight=35pt %,showframe
%]{geometry}
\setlength\voffset{-1in}
\setlength\topmargin{35pt}
\setlength\hoffset{-16pt}
\setlength\oddsidemargin{0pt}
\setlength\textwidth{483pt}
\setlength\textheight{686pt}
\setlength\footskip{30pt}
\setlength\headheight{30pt}
\setlength\headsep{14pt}

% % Колонтитули

\RequirePackage{fancyhdr}

\fancyhf{}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0 pt}
\fancyhead{}
\fancyhead[C]{\bf\fontsize{9pt}{11pt} \selectfont \@yearNumber \\ \ \\ \ }
\fancyhead[L]{
    \it\fontsize{9pt}{11pt}\selectfont 
    Вісник Київського національного університету \\
    імені Тараса Шевченка\\
    Серія фізико-математичні науки 
} 
\fancyhead[R]{
    \it \fontsize{9pt}{11pt} \selectfont Bulletin of Taras Shevchenko \\
    National University of Kyiv \\
    Series Physics \& Mathematics    
} 

\fancyfoot{}
\fancyfoot[L]{\ifnumcomp{\thepage}{=}{1}{ 
    \fontsize{10pt}{12pt} \selectfont \authorsCopyright }{}} 

\ifxetex
\else
\fancyfoot[R]{\bf Цей шаблон потребує компіляції за допомогою XeLaTeX!}
\fi

%for matlab2tkiz
\usepackage{pgfplots}
\pgfplotsset{compat=newest}
\pgfplotsset{plot coordinates/math parser=true}
\newlength\figureheight
\newlength\figurewidth
\pgfplotsset{
    title style={font=\small}, 
    tick label style={font=\small},
    label style={font=\small},
    legend style={font=\footnotesize}
}

% % Деякі блоки

\def\@year{Year}
\def\@yearNumber{Year, Number}
\newcommand\yearNumber[2]{
    \def\@yearNumber{#1, #2}
    \def\@year{#1}
}

\def\@submittedDate{date submitted}
\newcommand\submittedDate[1]{
    \def\@submittedDate{#1}
}
\AtEndDocument{
    {
        \hfill\ Надійшла до редколегії \@submittedDate
    }
}

\newcommand{\UDC}[1]{\noindent УДК #1}


% %

\def\authorsCopyright{\ifdef\@authors@copyright{\copyright \ \@authors@copyright, \@year}{}}
\def\authorsUK{\ifdef\@authorsUK{\@authorsUK}{}}
\def\authorsDetailsUK{\ifdef\@author@detailsUK{\@author@detailsUK}{}}
\def\authorsEN{\ifdef\@authorsEN{\@authorsEN}{}}
\def\authorsDetailsEN{\ifdef\@author@detailsEN{\@author@detailsEN}{}}
\newcounter{authorCnt}
\setcounter{authorCnt}{1} 
\renewcommand\author[7]{
    % % UK
    \ifdef\@authorsUK{\appto\@authorsUK{, \\}}{\def\@authorsUK{\noindent}}
    \xappto\@authorsUK{#1${}^{\arabic{authorCnt}}$, #2}
    %\expandafter\g@addto@macro\expandafter\@authors\expandafter{#1${\@tempNum}^{}$, #2}
    %\g@addto@macro\@authors@details{#3\\e-mail:#4}
    
    \ifdef\@author@detailsUK{\appto\@author@detailsUK{, \\[6pt]}}{\def\@author@detailsUK{\noindent}}
    \xappto\@author@detailsUK{${}^{\arabic{authorCnt}}$}
    \appto\@author@detailsUK{#3\\e-mail:~#7}

    \ifdef\@authors@copyright{\appto\@authors@copyright{, }}{\def\@authors@copyright{\noindent}}
    \xappto\@authors@copyright{#1}
        
    % % EN
    \ifdef\@authorsEN{\appto\@authorsEN{, \\}}{\def\@authorsEN{\noindent}}
    \xappto\@authorsEN{#4${}^{\arabic{authorCnt}}$, #5}
    
    \ifdef\@author@detailsEN{\appto\@author@detailsEN{, \\[6pt]}}{\def\@author@detailsEN{\noindent}}
    \xappto\@author@detailsEN{${}^{\arabic{authorCnt}}$}
    \appto\@author@detailsEN{#6\\e-mail:~#7}
    
    \addtocounter{authorCnt}{1} 
}

\newcommand\header[7]{
    \UDC{#1}
    \setlength\columnseprule{0.4pt}
    \setlength\columnsep{0.7cm}
    \begin{multicols}{2}
        \raggedcolumns
        \authorsUK
        
        \vspace{8pt}
        \noindent
        {\bf \fontsize{12pt}{16pt} \selectfont #2 }
        \vspace{8pt}
        
        {\it #3 }
        
        \vspace{6pt}
        \noindent Ключові слова: #4.
        
        \vspace{6pt}
        \authorsDetailsUK
        
        \columnbreak
        \authorsEN
        
        \vspace{8pt}
        \noindent
        {\bf \fontsize{12pt}{16pt}\selectfont #5 }
        \vspace{8pt}
        
        {\it #6 }
        
        \vspace{6pt}
        \noindent Key Words: #7. 
        
        \vspace{6pt}
        \authorsDetailsEN
    \end{multicols}
    \setlength\columnseprule{0.0pt}
    \setlength\columnsep{0.4cm}
}



\AtBeginDocument{%
    \selectlanguage{ukrainian}
    \renewcommand\refname{Список використаних джерел}
    \bibliographystyle{ugost2008}
        
    \addtolength\abovedisplayskip{0\baselineskip \@plus .1em \@minus .1em }%
    \addtolength\belowdisplayskip{0\baselineskip \@plus .1em \@minus .1em }%
    %\addtolength\abovedisplayshortskip{0.5\baselineskip}%
    %\addtolength\belowdisplayshortskip{0.5\baselineskip}%
}