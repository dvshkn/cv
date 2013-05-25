\ProvidesClass{dvshkn-resume}

\NeedsTeXFormat{LaTeX2e}
\ProcessOptions\relax

\LoadClass[letterpaper, 10pt]{article}

\RequirePackage[left=2.5in, top=0.5in, right=0.5in, bottom=0.1in, nohead, nofoot]{geometry}

% load support for compactitem lists and set indentation
\RequirePackage{paralist}
\setdefaultleftmargin{1.6em}{}{}{}{}{}

% load font support and fontawesome aliases
\RequirePackage[quiet]{fontspec}
\RequirePackage{fontawesome}

\setlength{\parindent}{0.0in}
\setlength{\parskip}{0.075in}

% load drawing packages
\RequirePackage{tikz}
\RequirePackage{xcolor}

% disable footer page numbers
\thispagestyle{empty}


%%%%%%%%%
% Fonts %
%%%%%%%%%

\newfontfamily{\thinfont}{Helvetica Neue UltraLight}
\newfontfamily{\sectionfont}{Roboto Bold Condensed}
\newfontfamily{\subsectionfont}{Roboto Condensed}

\newfontfamily{\FA}{FontAwesome}
\renewcommand{\labelitemi}{\FA\symbol{"F101}}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Roboto Light}

\newenvironment{resumebody}
{
    \fontsize{8pt}{10pt}\selectfont
}
{
}

\newcommand{\sectionheader}[1]
{
    {\fontsize{11pt}{13.2pt}\selectfont\sectionfont\color{headercolor}#1}\par
}

\newcommand{\subsectionheader}[1]
{
    {\subsectionfont\color{headercolor}#1}\par
}

\newcommand{\sectionbody}[1]
{
    \begin{minipage}[c]{\linewidth}
        #1
    \end{minipage}
}

\renewcommand{\bfseries}{\fontsize{9pt}{10.8pt}\selectfont\sectionfont\color{headercolor}}

\newcommand{\sectionbreak}[0]
{
    \par\vspace{0.12in}
}

\newcommand{\textawesomeright}[2]
{
    #2\hspace{6pt}{\FA#1}
}

\newcommand{\textawesomeleft}[2]
{
    {\FA#1}\hspace{6pt}#2
}


%%%%%%%%%%
% Header %
%%%%%%%%%%

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{
    \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{555555}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}


\colorlet{fillheader}{gray}
\colorlet{header}{white}
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

\newcommand{\rolefont}{
    \fontsize{14pt}{24pt}\selectfont
    \thinfont
    \color{darkgray}
}

\newcommand{\header}[3]
{
    \begin{tikzpicture}[remember picture, overlay]
        % alignment boxes
        \node [rectangle, fill=white, anchor=north west, minimum width=2.37in, minimum height=0.5in] (leftcol) at (current page.north west) {};
        \node [rectangle, fill=white, anchor=north west, minimum width=2.43in, minimum height=0.5in] (rightcol) at (current page.north west) {};

        \node [anchor=north east] (firstname) at (leftcol.south east) {
            {\fontsize{40pt}{40pt}\thinfont#1}
        };
        \node [anchor=north west] (lastname) at (rightcol.south east) {
            {\fontsize{40pt}{40pt}\thinfont#2 }{\fontsize{20pt}{20pt}\thinfont#3}
        };
    \end{tikzpicture}
    \vspace{0.5in}
}


%%%%%%%%%%%%
% Side Bar %
%%%%%%%%%%%%

\RequirePackage[absolute, overlay]{textpos}
\setlength{\TPHorizModule}{1in}
\setlength{\TPVertModule}{1in}
\newenvironment{sidebar}
{
    \begin{textblock}{1.8}(0.5,1.0)
    \begin{flushright}
}
{
    \end{flushright}
    \end{textblock}
}


%%%%%%%%%
% Lists %
%%%%%%%%%

\setlength{\tabcolsep}{0pt}

\newenvironment{alphalist}
{
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}
{
    \end{tabular*}
}

\newcommand{\entry}[4]
{
    #1&
    \parbox[t]{11.8cm}
    {
        \textbf{#2}\hfill{\addfontfeature{Color=lightgray}#3}\par#4
    }\par\vspace{\parskip}\\
}

\newcommand{\newentry}[4]
{
    \parbox[t]{0.15\linewidth}{#1}
    \parbox[t]{0.85\linewidth}
    {
        \textbf{#2}\hfill{\addfontfeature{Color=lightgray}#3}\par#4
    }\\[0.5em]
}


%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

\RequirePackage[style=verbose, maxnames=99, sorting=ydnt]{biblatex}

\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[misc]{title}{#1\par}
\DeclareFieldFormat[report]{title}{#1\par}

\defbibheading{none}[\refname]{}

\DeclareBibliographyDriver{article}{%
    \printfield{title}%
    \newblock%
    \printnames{author}%
    \par%
    \newblock%
    {%
        \footnotesize\addfontfeature{Color=lightgray}\itshape%
        \usebibmacro{journal+issuetitle}%
        \setunit{\space}%
        \printfield{pages}%
        \newunit%
        \printlist{publisher}%
        \setunit*{\addcomma\space}%
        \printfield{year}%
        \newunit%
    }
    \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{inproceedings}{%
    \footnotesize\printfield{title}%
    \newblock%
    {%
        \fontsize{8pt}{10pt}\selectfont\printnames{author}%
    }
    \par%
    \newblock%
    {%
        \footnotesize\addfontfeature{Color=lightgray}%
        \printfield{booktitle}%
        \setunit{\addcomma\space}%
        \printfield{year}%
        \setunit{\addcomma\space}%
        \printlist{location}%
        \newunit%
    }
    \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{misc}{%
    \printfield{title}%
    \newblock%
    \printnames{author}%
    \par%
    \newblock%
    {%
        \footnotesize\addfontfeature{Color=lightgray}\itshape%
        \printfield{booktitle}%
        \setunit*{\addcomma\space}%
        \printfield{note}%
        \setunit*{\addcomma\space}%
        \printfield{year}%
        \setunit{\addcomma\space}%
        \printlist{location}%
        \newunit%
    }
    \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{report}{%
    \printfield{title}%
    \newblock%
    \printnames{author}%
    \par%
    \newblock%
    {%
        \footnotesize\addfontfeature{Color=lightgray}\itshape%
        \printfield{type}%
        \setunit{\space}%
        \printfield{number}%
        \setunit{\addcomma\space}%
        \printfield{year}%
        \newunit%
    }
    \par\vspace{0.3\baselineskip}
}

\DeclareNameFormat{author}{%
    \footnotesize\addfontfeature{Color=lightgray}%
    \ifblank{#3}{}{#3\space}#1%
    \ifthenelse{\value{listcount}<\value{liststop}}
        {\addcomma\space}
        {}%
}

\newcommand{\printbibsection}[2]{
    \begin{refsection}
        \nocite{*}
        \printbibliography[sorting=chronological, type={#1}, title={#2}, heading=subbibliography]
    \end{refsection}
}

\DeclareSortingScheme{chronological}{
    \sort[direction=descending]{\field{year}}
    \sort[direction=descending]{\field{month}}
}