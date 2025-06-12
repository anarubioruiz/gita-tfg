% -*- coding: utf-8 -*-

%
% Copyright © 2013-2019 David Villa Alises
% esi-tfg.cls
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

%
% Modifications © 2024 Ana Rubio Ruiz
% gita-tfg.cls
%
% This modified version of the program includes additional content and
% style changes made by Ana Rubio Ruiz. These modifications are also
% distributed under the terms of the GNU General Public License as
% published by the Free Software Foundation; either version 2 of the License,
% or (at your option) any later version.
%
% As with the original version, this modified version is distributed in the
% hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
% implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
% See the GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this modified version; if not, write to the Free Software
% Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gita-tfg}[2013/08/15 TFG del Grado de Ing. Informática de Talavera de la Reina]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\PassOptionsToClass{a4paper, 12pt, oneside, openright}{book}
\ProcessOptions\relax
\LoadClass{book}

\makeatletter

\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[spanish]{babel}
\deactivatetilden  % FAQ-CervanTeX-6.html#ss6.7

%% -- Fundiciones
\renewcommand{\rmdefault}{ptm}   % times
\renewcommand{\sfdefault}{phv}   % helvetica
\renewcommand{\ttdefault}{pcr}   % courier

\usepackage[htt]{hyphenat}
\usepackage{atbeginend}
\usepackage{xifthen}

\usepackage[inline]{enumitem}
\setlist{topsep=0pt, itemsep=0pt}
\newlist{definitionlist}{description}{1}
\setlist[definitionlist]{
  style = nextline,
}

%% -- Redefinir entorno quote
\renewenvironment{quote}
  {\begin{quotation}\itshape}
  {\end{quotation}}

% Las normas tipográficas que aparecen en los comentarios corresponden al libro:
% J. Martínez de Sousa. Ortografía y ortotipografía del español actual. Trea, 2008.

%% -- MEDIDAS Y DISTANCIAS -----------------------------------------------------
\usepackage[left=35mm, right=20mm, top=25mm, bottom=25mm]{geometry}
\usepackage{setspace}
\setlength{\parskip}{2.5mm plus 0.2mm minus 0.2mm}

%% Párrafos
% La indentación que precede al párrafo normal debe ser de un
% cuadratín (1em) (-> 13.4.1.1)
\parindent   = 0em

% El espacio en blanco al final de una línea corta debe ser mayor que
% la indentación del párrafo. (-> 13.4.1.1)
\parfillskip = 1.5em plus 1fil


%% -- GRÁFICOS -----------------------------------------------------------------
\usepackage{graphicx}
\usepackage{epsfig}
\graphicspath{{figures/}{/usr/share/arco/figures/}}

%% -- COLORES ------------------------------------------------------------------
\usepackage[table]{xcolor}
\definecolor{white}{gray}{1}
\definecolor{gray97}{gray}{0.97}
\definecolor{gray95}{gray}{0.95}
\definecolor{gray85}{gray}{0.85}
\definecolor{gray45}{gray}{0.45}
\colorlet{tabheadbg}{gray!25}
\colorlet{tabrowbg} {gray!12.5}

%% -- EPÍGRAFES ----------------------------------------------------------------
% \usepackage[font=footnotesize,
%             labelfont=sc,
%             format=hang, indention=-5mm,
%             width=.9\textwidth]{caption}

%% --  CUADROS -----------------------------------------------------------------
\usepackage{booktabs}
\usepackage{colortbl} % coloreado de cuadros

\newcommand{\tabheadformat}{\rowcolor{tabheadbg} \parbox[c][.4cm]{0pt}{}}
\newcommand{\tabfootformat}{\tabheadformat}
\newcommand{\tabhead}[1]{{\textscale{.8}{\textbf{#1}}}}
\newcommand{\tabfoot}[1]{#1}
\newcommand{\tabcolorrow}{\rowcolor{tabrowbg}}

% cebreado para cuadros
\newcommand{\myrowcolors}[1]{\rowcolors{#1}{tabrowbg}{}}
\AfterEnd{tabular}{\rowcolors{1}{}{}}
\AfterBegin{document}{\renewcommand\bibname{Referencias}}
\BeforeEnd{document}{\attributionArco}

%% -- LISTADOS DE CÓDIGO -------------------------------------------------------
\usepackage{listings}
\usepackage[scaled=.73]{beramono}
\renewcommand{\lstlistlistingname}{Índice de listados}
\renewcommand{\lstlistingname}{Listado}

% de tocbibind, para que el índice de listados aparezca en la ToC
\renewcommand{\lstlistoflistings}{%
  \begingroup
  \tocfile{\lstlistlistingname}{lol}
  \endgroup}

% \newcommand{\lstfont}{\ttfamily\fontfamily{pcr}}
\newcommand{\lstfont}{\ttfamily}


\lstset{%
  backgroundcolor   = \color{gray97},
  linewidth         = \linewidth,
  xleftmargin       = 25pt,
  xrightmargin      = 0pt,
  aboveskip         = 15pt,
  belowskip         = 15pt,
  captionpos        = b,
  showspaces        = false,
  showstringspaces  = false,
  showtabs          = false,
  tabsize           = 2,
  keywordstyle      = \bfseries,
  commentstyle      = \itshape,
  basicstyle        = \footnotesize\fontfamily{pcr}\selectfont,
  frame             = leftline,
  framerule         = 3pt,
  framexleftmargin  = 8pt,
  rulecolor         = \color{gray},
  numbers           = left,
  numberstyle       = \scriptsize\sffamily,
  numbersep         = 20pt,
  inputencoding     = utf8,
  extendedchars     = true,
  breaklines        = true,
  breakatwhitespace = true,
  postbreak         = \mbox{\textcolor{red}{$\hookrightarrow$\space}},
}

\lstnewenvironment{listing}[1][]
  {\pagebreak[3]\singlespacing\lstset{#1}}%
  {\pagebreak[3]}

\lstdefinestyle{consoleStyle}{
  basicstyle=\footnotesize\bf\lstfont,
  backgroundcolor=\color{gray85},
  numbers=none,
}

\lstnewenvironment{console}[1][]
  {\pagebreak[3]\lstset{style=consoleStyle,#1}}
  {\pagebreak[3]}



%% -- ACRÓNIMOS Y GLOSARIO -----------------------------------------------------
\usepackage[printonlyused, smaller]{acronym}

\renewcommand*{\acsfont}[1]{{\textsc{#1}}} % enunciado del acrónimo: OO
\renewcommand*{\acfsfont}[1]{#1}
\renewcommand*{\acffont}[1]{#1}

% imprime: "Object Oriented (OO)"
\newcommand{\acx}[1]{\acused{#1}\acs{#1} %
  \nolinebreak[3] %
  (\acl{#1})}

\newcommand{\Acro}[2]{\acro{#1}{#2}\acused{#1}}
\newcommand{\sigla}[1]{\textsc{\textscale{.85}{#1}}}


%% -- HIPER-ENLACES PARA PDF ---------------------------------------------------
\usepackage[%
    bookmarks,
    breaklinks,
    hyperfootnotes = false,
    pdfview        = {fitv},
    colorlinks,
    linkcolor      = black,
    citecolor      = black,
    urlcolor=      = black,
    ]{hyperref}

\hypersetup{
  pdftitle   = {\@title},
  pdfauthor  = {\@author},
  pdfsubject = {Trabajo Fin de Grado},
}

% -- urls
% https://www.joachim-breitner.de/blog/archives/519-guid.html
\let\UrlSpecialsOld\UrlSpecials
\def\UrlSpecials{\UrlSpecialsOld\do\/{\Url@slash}\do\_{\Url@underscore}}%
\def\Url@slash{\@ifnextchar/{\kern-.11em\mathchar47\kern-.2em}%
    {\kern-.0em\mathchar47\kern-.08em\penalty\UrlBigBreakPenalty}}
\def\Url@underscore{\nfss@text{\leavevmode \kern.06em\vbox{\hrule\@width.3em}}}
\let\urlOld\url


%% -- BIBLIOGRAFÍA -------------------------------------------------------------
\bibliographystyle{acm}

\newcommand{\bibfont}{\small}      % Bibliography's font size
%% \setlength{\bibhang}{4ex}       % Indent of Bibliography entries
%% \setlength{\bibsep}{3pt}

% añadir listados, bibliografia, etc a la tabla de contenido
\usepackage{tocbibind}


%% -- FORMATO DE CAPÍTULOS Y SECCIONES -----------------------------------------
\usepackage[rigidchapters, clearempty, pagestyles]{titlesec}
% - rigidchapters: Todos los títulos de capítulo tienen la misma altura
% - clearempty: Elimina encabezados y pies de páginas (izquierdas) vacías.

\newcommand{\chapterformat}[1]{%
  \fontsize{22}{22}\selectfont\sffamily\bfseries #1%
}

% doc: \titleformat{ command }[ shape ]{ format }{ label }{ sep }{ before }[ after ]

\titleformat{\section}
  {\normalfont\sffamily\bfseries\fontsize{15.0pt}{1em}\selectfont}{\thesection}{.7em}{}
\titleformat{\subsection}
  {\normalfont\sffamily\bfseries\fontsize{13.5pt}{1em}\selectfont}{\thesubsection}{1em}{}

% -- standard definitions
% \titleformat{\chapter}[display]
% {\normalfont\huge\bfseries}{\chaptertitlename\ \thechapter}{20pt}{\Huge}
% \titleformat{\section}
% {\normalfont\Large\bfseries}{\thesection}{1em}{}
% \titleformat{\subsubsection}
%   {\normalfont\normalsize\bfseries}{\thesubsubsection}{1em}{}
% \titleformat{\paragraph}[runin]
%   {\normalfont\normalsize\bfseries}{\theparagraph}{1em}{}
% \titleformat{\subparagraph}[runin]
%   {\normalfont\normalsize\bfseries}{\thesubparagraph}{1em}{}


\newcommand{\frontchapterformat}{
  \titleformat{\chapter}[display]%
    {}
    {}
    {0mm}
    {\chapterformat}

  \titlespacing{\chapter}{0cm}{2cm}{2cm}
}

\let\frontmatterorig\frontmatter
\renewcommand{\frontmatter}{
  \frontmatterorig
  \onehalfspacing
  \pagestyle{mainstyle}
  \frontchapterformat
}

\newcommand{\mainchapterformat}{
  \titleformat{\chapter}[display]
    {\normalfont\large\sffamily\bfseries}
    {\chaptertitlename\ \thechapter}
    {0mm}
    {\chapterformat}

  \titlespacing{\chapter}{0cm}{1cm}{3.8cm}
}

\let\mainmatterorig\mainmatter
\renewcommand{\mainmatter}{
  \cleardoublepage
  \mainmatterorig
  \onehalfspacing
  \pagestyle{mainstyle}
  \mainchapterformat
  \cleardoublepage
}

\newcommand{\backchapterformat}{
  \mainchapterformat
}

\let\backmatterorig\backmatter
\renewcommand{\backmatter}{
  % \backmatterorig
  \pagestyle{backstyle}
  \backchapterformat
  \cleardoublepage
}

% espaciado entre secciones, subseciones, etc.
% doc: \titlespacing*{ command }{ left }{ beforesep }{ aftersep }[ right ]
\titlespacing{\section}{0pt}{5mm}{0mm}
\titlespacing{\subsection}{0pt}{4mm}{-1mm}
\titlespacing{\subsubsection}{0pt}{4mm}{-1mm}


%% -- ESTILO DE PÁGINA, ENCABEZADOS Y PIES -------------------------------------
\newcommand{\UCLMhead}{
  \setlength{\unitlength}{1cm}
  \begin{picture}(0,0)
    \put(-1.3,-1.42){
      \includegraphics[height=3cm]{uclm_logomarca_1.pdf}}
  \end{picture}
}

\newcommand{\GITAhead}{
  \setlength{\unitlength}{1cm}
  \begin{picture}(0,0)
    \put(-4,-1.5){
      \includegraphics[height=1.6cm]{facsocytic.pdf}}
  \end{picture}
}

\newpagestyle{firstpage}[\small\sffamily]{
  \sethead{\UCLMhead{}} %
          {} %
          {\GITAhead{}}
}

\newpagestyle{mainstyle}[\small\sffamily]{
  \sethead[\thechapter.\ \textsc{\chaptertitle}][][]{}{}{\textsc{\sectiontitle}}
  \setfoot{}{\thepage{}}{}
}

\newpagestyle{backstyle}{
  \sethead{}{}{}
  \setfoot{}{\thepage{}}{}
}

\addtolength{\footskip}{8pt}


%% -- Otros paquetes
\usepackage{relsize}  % tamaños relativos para el texto


%% -- VARIABLES DEL PAQUETE ----------------------------------------------------
\usepackage{ifmtarg}

\newcommand{\@authortitle}{}
\renewcommand{\author}[2]{%
  \renewcommand{\@author}{#1}
  \renewcommand{\@authortitle}{#2}}
\newcommand{\theauthor}{\@author}

\newcommand{\@titleOther}{}
\newcommand{\titleOther}[1]{%
  \renewcommand{\@titleOther}{#1}}

\newcommand{\@putAuthor}{
  Autoría: \@author\par}

\newcommand{\@address}{}
\newcommand{\address}[1]{\renewcommand{\@address}{#1}}
\newcommand{\@city}{Talavera de la Reina}
\newcommand{\city}[1]{\renewcommand{\@city}{#1}}
\newcommand{\@country}{Spain}
\newcommand{\country}[1]{\renewcommand{\@country}{#1}}

\newcommand{\phone}[1]{\newcommand{\@phone}{#1}}
\newcommand{\printphone}{\@phone}

\newcommand{\email}[1]{\newcommand{\@email}{#1}}
\newcommand{\printemail}{\@email}

\newcommand{\@homepage}{}
\newcommand{\homepage}[1]{\renewcommand{\@homepage}{#1}}

\newcommand{\@intensification}{}
\newcommand{\intensification}[1]{%
  \renewcommand{\@intensification}{#1}}

\newcommand{\@advisor}{}
\newcommand{\@advisortitle}{}
\newcommand{\advisor}[2]{%
  \renewcommand{\@advisor}{#1}
  \renewcommand{\@advisortitle}{#2}}

\newcommand{\@advisorFirst}{}
\newcommand{\advisorFirst}[1]{%
  \renewcommand{\@advisorFirst}{#1}}
\newcommand{\@putAdvisorFirst}{Tutoría: \@advisorFirst\par}

\newcommand{\@advisorSecond}{}
\newcommand{\advisorSecond}[1]{%
  \renewcommand{\@advisorSecond}{#1}}
\newcommand{\@putAdvisorSecond}{Cotutoría: \@advisorSecond\par}


\newcommand{\@advisorDepartment}{}
\newcommand{\advisorDepartment}[1]{\renewcommand{\@advisorDepartment}{#1}}

\newcommand{\@docmonth}{}
\newcommand{\@docyear}{}
\newcommand{\docdate}[2]{%
  \renewcommand{\@docyear}{#1}
  \renewcommand{\@docmonth}{#2}}


\newcommand{\@license}{%
  \begin{minipage}{\textwidth}
    \begin{singlespace}
      Permission is granted to copy, distribute and/or modify this
      document under the terms of the GNU Free Documentation License,
      Version 1.3 or any later version published by the Free Software
      Foundation; with no Invariant Sections, no Front-Cover Texts,
      and no Back-Cover Texts.  A copy of the license is included in
      the section entitled \hyperlink{chap:GFDL}{"GNU Free
      Documentation License"}.

      \smallskip
      Se permite la copia, distribución y/o modificación de este
      documento bajo los términos de la Licencia de Documentación
      Libre GNU, versión 1.3 o cualquier versión posterior publicada
      por la \emph{Free Software Foundation}; sin secciones
      invariantes. Una copia de esta licencia esta incluida en el
      apéndice titulado \hyperlink{chap:GFDL}{«GNU Free Documentation
      License»}.

      \smallskip
      Muchos de los nombres usados por las compañías para diferenciar
      sus productos y servicios son reclamados como marcas
      registradas. Allí donde estos nombres aparezcan en este documento,
      y cuando la persona autora haya sido informada de esas marcas registradas,
      los nombres estarán escritos en mayúsculas o como nombres propios.
    \end{singlespace}
  \end{minipage}
}
\newcommand{\license}[1]{\renewcommand{\@license}{#1}}



%% -- PÁGINAS ESPECIALES

\newcommand{\cover}{%
  \begin{center}
    \thispagestyle{empty}
    \fontsize{60}{22}\selectfont
    \bfseries
    \setstretch{1.3}

    \vspace*{\stretch{4}}
    \includegraphics[width=14cm]{F_CCSSTI_UCLM.png}
    \vspace*{\stretch{4}}

    \sffamily
    UNIVERSIDAD DE CASTILLA-LA MANCHA \\

    \bfseries\Large  % Bold weight for the degree
    GRADO EN INGENIERÍA INFORMÁTICA

    \vspace*{\stretch{2}}

    \normalfont\Large\sffamily  % Normal weight for "Trabajo Fin de Grado"
    Trabajo Fin de Grado


    \vspace*{\stretch{4}}
    {\LARGE\bfseries \@title} \\
    \vspace*{\stretch{2}}
    {\large\itshape \@titleOther}

    \vspace*{\stretch{2}}
    {\large \@author}

    \vspace*{\stretch{4}}
  \end{center}

  \vfill
  \hfill
  {\large\sffamily \textbf{\@docmonth, \@docyear}}
  \vspace{\stretch{1}}
  \cleardoublepage
}


% - portadilla
% Sólo aparece el título de la obra a la misma altura, fuente y estilo
% que en la portada pero en un tamaño 2/3 el de ésta. Opcionalmente
% puede aparecer el autor.

\newcommand{\frontpage}{%
  \begin{center}
    \thispagestyle{empty}
    \fontsize{60}{22}\selectfont
    \bfseries
    \setstretch{1.3}

    \vspace*{\stretch{6}}
    \includegraphics[width=14cm]{F_CCSSTI_UCLM.png}
    \vspace*{\stretch{6}}

    \sffamily
    UNIVERSIDAD DE CASTILLA-LA MANCHA \\
    \@advisorDepartment

    \vspace*{\stretch{2}}

    \bfseries\Large  % Bold weight for the degree
    GRADO EN INGENIERÍA INFORMÁTICA \\
    {\normalsize \MakeUppercase{\@intensification}}

    \vspace*{\stretch{4}}

    \normalfont\Large\sffamily  % Normal weight for "Trabajo Fin de Grado"
    Trabajo Fin de Grado

    \vspace*{\stretch{4}}

    {\LARGE\bfseries \@title}
  \end{center}

  \vspace*{\stretch{4}}

  {\sffamily
    \@putAuthor
    \@putAdvisorFirst
    \@putAdvisorSecond
  }

  \vspace*{\stretch{4}}

  \vfill
  \hfill
  {\large\bfseries\sffamily \@docmonth, \@docyear}
  \cleardoublepage
}

\newcommand{\dedication}[1]{%
  \cleardoublepage
  \null\vspace{\stretch{1}}
  \begin{flushright}
    \textit{#1}
  \end{flushright}
  \vspace{\stretch{2}}\null
  \cleardoublepage
}

\usepackage{tikz}
\usetikzlibrary{calc}

\newcommand{\authorship}{%
  \cleardoublepage
  \chapter*{Declaración de autoría}
  Yo, \@author\unskip, declaro que soy la única persona autora del trabajo fin de grado titulado \textit{\@title}\unskip, que el citado trabajo no infringe las leyes vigentes sobre propiedad intelectual, y que todo el material no original contenido en dicho trabajo está apropiadamente atribuido a quienes corresponda.

  \begin{center}
    \vspace{2cm}
    \textbf{\@city, \today} \\

    \vspace{0.5cm}

    \begin{tikzpicture}
      \draw[draw=lightgray] (0,0) rectangle  + (8,4);
      \node at (0.7,3.6) {\color{lightgray}{Fdo.:}};
  \end{tikzpicture}
\end{center}
  \cleardoublepage
}


\newcommand{\copyrightpage}{%
  \newpage
  \begin{singlespace}
    \null \vfill \noindent
    \textbf{\sffamily\@author} \par
    \smallskip \noindent
    \@city\ -- \@country

    \vspace{-1cm}
    \begin{tabbing}
      \hspace*{1.7cm} \= \\
      \@ifmtarg{\@email}    {\emph{E-mail:}   \> \@email \\}{}
      \@ifmtarg{\@phone}    {\emph{Teléfono:} \> \@phone \\}{}
      \@ifmtarg{\@homepage} {\emph{Web site:} \> \url{\@homepage} \\}{}
    \end{tabbing}
    \vspace{-1cm}
    \noindent
    \copyright\ \number\@docyear\ \ \@author \par
    \smallskip \noindent
    \begin{minipage}{0.8\textwidth} \raggedright \footnotesize
      \@license
    \end{minipage}
  \end{singlespace}
  \cleardoublepage
}


\newcommand{\jury}{%
{\sffamily
  \vspace*{2cm}
  \noindent\underline{\textbf{{\Large TRIBUNAL:}}}
  \vspace{1.3cm}
  \par
  \textbf{{\large Presidencia:}} \par
  \vspace{.5cm}
  \textbf{{\large Vocal:}}      \par
  \vspace{.5cm}
  \textbf{{\large Secretaría:}} \par
  \vspace{2.5cm}
  \noindent\underline{\textbf{{\Large FECHA DE DEFENSA:}}} \par
  \vspace{2.2cm}
  \noindent\underline{\textbf{{\Large CALIFICACIÓN:}}} \par
  \vspace{3.6cm}
  \textbf{PRESIDENCIA \hfil\hspace{0.5cm} VOCAL \hfil\hspace{1.2cm} SECRETARÍA} \par
  \vspace{3.1cm}
  Fdo.: \hfil Fdo.: \hfil Fdo.: \par
}
}

\addto\captionsspanish{\renewcommand{\appendixname}{Anexo}}

\newcommand{\appendixtitle} {
  \cleardoublepage
  \thispagestyle{backstyle}
  \vspace*{5cm}%
  \begin{center}%
    \sffamily\scshape\Large\scalebox{3}{ANEXOS}%
  \end{center}%
}%

% http://tex.stackexchange.com/a/237251/27822
% \def\versiondate{\leavevmode\hbox{0.\the\year\twodigits\month\twodigits\day}}
\def\versiondate{0.20181017}
\def\twodigits#1{\ifnum#1<10 0\fi\the#1}

\newcommand{\attributionArco} {
  \cleardoublepage
%  \pagestyle{empty}
  \null\vfill
  \rule{0pt}{8cm}
  \begin{singlespacing}
  \begin{center}
    Este documento fue editado y tipografiado con \LaTeX{}\\
    empleando la clase \textbf{gita-tfg} que se puede encontrar en:\\
    \url{https://github.com/anarubioruiz/gita-tfg}

    La clase \textbf{gita-tfg} está basada en la clase \textbf{esi-tfg}:\\
    \url{https://github.com/UCLM-ESI/esi-tfg}

    \bigskip
    {\scriptsize [respeta esta atribución de autoría]}
  \end{center}
  \end{singlespacing}
  \cleardoublepage
}


%% -- símbolos
\usepackage{pifont}
\usepackage{tipa}


%% -- letras capitales
\usepackage{lettrine}
\newcommand{\drop}[2]{%
  \lettrine[lines=2,findent=2pt,nindent=3pt,loversize=0.1]% lhang=0.33
  {\textcolor[gray]{0.4}{#1}}{#2}%
  }


\AtBeginDocument{
  % separación entre filas en los cuadros
  \setlength{\extrarowheight}{1pt}
}


%% -- Algunos comandos útiles
\newcommand{\quoteauthor}[1]{\par\hfill#1\hspace{1em}\mbox{}}
\newcommand{\FIXME}[1]{\noindent\textcolor{red}{\textbf{FIXME:} #1}}
\newcommand{\FIXED}[1]{\noindent\textcolor{green}{\textbf{FIXED:} #1}}

%\makeatother
