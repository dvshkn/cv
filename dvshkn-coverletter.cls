\ProvidesClass{dvshkn-coverletter}

\NeedsTeXFormat{LaTeX2e}
\ProcessOptions\relax

\LoadClass[letterpaper, 10pt]{letter}

\RequirePackage[left=1.2in, top=0.25in, right=1.2in, bottom=1in, nohead, nofoot]{geometry}

\longindentation=0pt


%%%%%%%%%%%%%%%%%%
% Fonts & Colors %
%%%%%%%%%%%%%%5%%%
\RequirePackage[quiet]{fontspec}
\RequirePackage{xcolor}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text]{Roboto Light}
\newfontfamily{\sectionfont}{Roboto Bold Condensed}
\newfontfamily{\thinfont}{Helvetica Neue UltraLight}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{555555}

\newcommand{\sectionheader}[1]
{
    {\fontsize{12pt}{14pt}\sectionfont\color{lightgray}#1}
}


%%%%%%%%%%
% Header %
%5%%%%%%%%
\RequirePackage{tikz}

\newcommand{\header}[4]
{
    \begin{tikzpicture}[remember picture, overlay]
    % alignment boxes
    \node [rectangle, fill=white, anchor=north west, minimum width=2.437in, minimum height=0.5in] (leftcol) at (current page.north west) {};
    \node [rectangle, fill=white, anchor=north west, minimum width=2.497in, minimum height=0.5in] (rightcol) at (current page.north west) {};
    \node [rectangle, fill=white, anchor=north east, minimum width=1.141in, minimum height=0.5in] (farrighttop) at (current page.north east) {};
    \node [rectangle, fill=white, anchor=north east, minimum width=1.141in, minimum height=0.52in] (farrightbottom) at (farrighttop.south east) {};

    \node [anchor=north east] (firstname) at (leftcol.south east) {
        {\fontsize{40pt}{40pt}\thinfont#1}
    };
    \node [anchor=north west] (lastname) at (rightcol.south east) {
        {\fontsize{40pt}{40pt}\thinfont#2}
    };
    \node [anchor=north east] (emailinfo) at (farrighttop.south west) {
        {\fontsize{14pt}{14pt}\thinfont#3}
    };
    \node [anchor=south east] (phoneinfo) at (farrightbottom.south west) {
        {\fontsize{14pt}{14pt}\thinfont#4}
    };
    \end{tikzpicture}
}
