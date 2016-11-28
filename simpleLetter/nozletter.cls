\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nozletter}[2016/11/10 First version]
 
\LoadClass[letterpaper,11pt]{article}
\RequirePackage{tabularx} % extra features for tabular environment
\RequirePackage{amsmath}  % improve math presentation
\RequirePackage{graphicx} % takes care of graphic including machinery
\RequirePackage[left=16mm,right=16mm,top=16mm,bottom=22mm,letterpaper]{geometry} % decreases margins
\RequirePackage{cite} % takes care of citations
\RequirePackage[final]{hyperref} % adds hyper links inside the generated pdf file
\hypersetup{
    colorlinks=true,       % false: boxed links; true: colored links
    linkcolor=blue,        % color of internal links
    citecolor=blue,        % color of links to bibliography
    filecolor=magenta,     % color of file links
    urlcolor=blue         
}
\RequirePackage{fixltx2e}
\RequirePackage[spanish,activeacute,es-noshorthands,es-nolists]{babel}

\RequirePackage{lmodern}
\RequirePackage{iftex}
\ifPDFTeX
    \RequirePackage[utf8]{inputenc}
    \RequirePackage[T1]{fontenc}
\else
    \ifXeTeX
        \RequirePackage{xltxtra}
        % set fonts
        % \RequirePackage{fontspec}
        % \setsansfont[ExternalLocation=../fonts/,
        %   Ligatures=TeX,
        %   BoldFont=FontinSansBold.otf,
        %   BoldItalicFont=FontinSansBoldItalic.otf,
        %   ItalicFont=FontinSansItalic.otf]{FontinSans.otf}
    \else
        \RequirePackage{luatextra}
    \fi
    \defaultfontfeatures{Ligatures=TeX}
\fi

%++++++++++++++++++++++++++++++++++++++++

\RequirePackage{enumitem}
\setlist[itemize]{topsep=-2pt, itemsep=-1pt}
\setlist[description]{topsep=0pt, itemsep=0pt}
\renewcommand{\labelitemi}{{\large \textbullet}}
\renewcommand{\labelitemii}{$\circ$}
\renewcommand{\labelitemiii}{---}

\RequirePackage{titlesec}
\titleformat{\section}[block]{\fontsize{14}{16}\bfseries}{\thesection.}{1em}{}[{\vspace{2pt}\titlerule[1.3pt]}]
\titleformat*{\subsection}{\normalsize\bfseries}

\RequirePackage{booktabs}

% \RequirePackage{multicol}
% \setlength{\columnsep}{9mm}

\RequirePackage{float}

\RequirePackage[spanish]{cleveref}
\RequirePackage[bottom]{footmisc}
\RequirePackage{dingbat}

\setlength{\parskip}{0.5em}
\renewcommand{\baselinestretch}{1.1}
% \setlength\parindent{34pt}

\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\def\todomsg{\textcolor{red}{TO DO}}

\RequirePackage{caption}
\RequirePackage{footnote}
\makesavenoteenv{tabular}
\makesavenoteenv{table}
\RequirePackage{float}

\RequirePackage{smartdiagram}
\RequirePackage[framemethod=TikZ]{mdframed}
\mdfdefinestyle{MyFrame}{%
linecolor=black,
outerlinewidth=1pt,
roundcorner=1em,
innertopmargin=\baselineskip,
innerbottommargin=\baselineskip,
innerrightmargin=20pt,
innerleftmargin=20pt,
backgroundcolor=gray!10!white}

\usetikzlibrary{positioning,backgrounds}
