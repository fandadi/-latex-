\ProvidesClass{zzuThesis}[2017/05/04 v2.0, by Lu Song]
%�汾2.0
%�޸�����Ŀ�����Զ����е�����
%����������ע��
%ȥ��һЩ�ظ�������
%�޸���һЩ�����һЩСbug
%ȥ����ǰ��S��ţ��޸�ҳü
\newif\ifPreprint\Preprinttrue
\newif\ifBachelor\Bachelortrue
\newif\ifMakeindex\Makeindexfalse
\newif\ifPreview\Previewfalse
\newif\ifEverb\Everbfalse%���������������������Ĭ��ֵ��Ϊfalse��true

\DeclareOption{bachelor}{\Bachelortrue\Preprintfalse}
\DeclareOption{master}{\Bachelorfalse\Preprintfalse}
\DeclareOption{preprint}{\Preprinttrue}
\DeclareOption{makeindex}{\Makeindextrue}
\DeclareOption{preview}{\Previewtrue}
\DeclareOption{everb}{\Everbtrue}
\ProcessOptions%����Ԥѡ��Ĵ���

\let\CCTCJKfonts=1 %ѡ��ʹ��CJK�ֿ�
\LoadClass[12pt,oneside]{cctbook}[2004/10/14]
\RequirePackage{ifpdf}%���л�latex��pdflatex�������
\RequirePackage{graphicx}
\RequirePackage{amssymb}
\RequirePackage[noend]{algpseudocode}
\RequirePackage{algorithmicx,algorithm}
\RequirePackage{subfigure}

\ifMakeindex
  \RequirePackage{makeidx}
  \AtEndDocument{\printindex}
  \makeindex
\fi%ĩβ��������

\RequirePackage{amsthm}
\RequirePackage{amsmath}%��ѧ���

\ifEverb
  \RequirePackage{everb}[2006/04/22]
  \everbsetup{number=false, escape=12}%��Ҫ�кţ������ַ�����Ϊʮ��
  \newverbatim[prologue={\smallskip\fboxradius=3pt}]{verbatim}%�����³�¼����
\fi

\ifpdf
  \RequirePackage[CJKbookmarks,hyperindex]{hyperref}%���볬���Ӱ�
\else
  \ifPreview
    \RequirePackage[CJKbookmarks,hypertex,hyperindex]{hyperref}
  \else
    \RequirePackage[CJKbookmarks,dvipdfm,hyperindex]{hyperref}
  \fi
\fi

%------------------------ Page layout ----------------------------------
\RequirePackage{geometry}
\geometry{left=2.6cm,right=2.0cm,top=2.4cm,bottom=2.2cm,includeheadfoot} %����߾�
\linespread{1}%���õ����о�
\setlength{\parskip}{0.2\baselineskip}%���ö�����

%-------------------------- Cover page ----------------------------
\renewcommand\frontmatter{%ǰҳ��ʽ
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{myheadings}}%�ض���frontmatter��cleardoublepage���ż��ҳ����
  %\clearpage��������һҳ����������������ı���Ͳ�ͼ��openright���ĵ���ѡ��
\renewcommand\mainmatter{%�����ʽ
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}} 
\renewcommand\backmatter{%��ҳ��ʽ
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue} 
\let\@title\strut \let\@headtitle\strut
\renewcommand\title[2][]{\def\@title{#2}\def\@headtitle{#1}
  \ifx\@headtitle\@empty\def\@headtitle{\@title}\fi}
 \let\@author\strut		\def\author#1{\def\@author{#1}}
\let\@supervisor\@empty		\def\supervisor#1{\def\@supervisor{#1}}
\let\@professionaltitle\@empty		\def\professionaltitle#1{\def\@professionaltitle{#1}}
  \let\@studentnumber\strut		\def\studentnumber#1{\def\@studentnumber{#1}}
  \let\@major\strut		\def\major#1{\def\@major{#1}}
  \let\@department\strut		\def\department#1{\def\@department{#1}}
\let\@submissiondate\@empty	\def\submissiondate#1{\def\@submissiondate{#1}}
\let\@date\@empty	\def\date#1{\def\@date{#1}}
\def\maketitle{
   \frontmatter
  \bgroup%\bgroup is a synonym for {
  \def\entry##1##2##3{
    \multicolumn{##1}{l}{\underline{\hbox to ##2{\hfil##3\hfil}}}}
	\def\mlines##1{\vbox to\z@{\hsize 12cm \vss \baselineskip 1.5em \raggedright ##1}}
  \renewcommand\arraystretch{2}%�����ñ������Եø�����һ��
 % \renewcommand\tabcolsep{\z@}%��ʾ���м��׼�����һ���С
  \thispagestyle{myempty}%��ҳ��ʽ�ÿ�
  \vspace*{1.4cm}%use \vspace, latex can silently ignore the extra space.
  \begin{center}
    {\songti\zihao{1}\textbf{֣�ݴ�ѧ��ҵ��ƣ����ģ�}}\\[1.8cm]
  \end{center}
  \vspace*{2.0cm}
  \heiti\zihao{3}
  \begin{center}
  \begin{tabular}{llll}
  %  ��\hspace{\fill}Ŀ��&\entry{3}{9.6cm}{\@title}\\[0.5cm]
	��\hspace{\fill}Ŀ��&\entry{3}{9.6cm}{\mlines{\@title}} \\ [0.5cm]
    ָ����ʦ��&\entry{1}{3.6cm}{\@supervisor} &ְ�ƣ�&\entry{1}{3.6cm}{\@professionaltitle}\\
  \end{tabular}
  \end{center}
   \vspace*{4cm}
   \songti%\zihaoAny{15}
   \fontsize{16pt}{\baselineskip}\selectfont
  \begin{center}
  \begin{tabular}{llll}
    ѧ��������&\entry{1}{3.6cm}{\@author}&ѧ�ţ�&\entry{1}{3.6cm}{\@studentnumber}\\
    ר\hspace{\fill}ҵ��  &\entry{3}{9.6cm}{\@major}\\
    Ժ\hspace{\fill}(ϵ)��&\entry{3}{9.6cm}{\@department}\\
	���ʱ�䣺&\entry{3}{9.6cm}{\@submissiondate}\\ 
  \end{tabular}
  \end{center}
   \par\vskip4.0cm
  \begin{center}
  {\@date}
  \end{center}
   \egroup
}



%----------------------- Running heads ---------------------------------
\def\ps@myempty{%%No head or foot line.
  \let\@oddhead\@empty\let\@evenhead\@empty
  \let\@oddfoot\@empty\let\@evenfoot\@empty}
\def\ps@myplain{%%No head, centred or right page number in foot.
  \let\@oddhead\@empty\let\@evenhead\@empty
  \def\@oddfoot{\hfil\zihao{5}\thepage\ifBachelor\relax\else\hfil\fi}
  \let\@evenfoot=\@oddfoot}
  
\def\ps@myheadings{%%Centred head, centred page number in foot.
  \def\@oddhead{
  \vbox to\headheight{
    \hb@xt@\textwidth{\hfill\zihao{5}\rmfamily\leftmark\hfill}
      \vskip\tw@\p@\hbox{\vrule width\textwidth height.4\p@ depth\z@}} 
	  }	  
  \let\@evenhead=\@oddhead
  \def\@oddfoot{\zihao{5}\hfil\thepage\ifBachelor\relax\else\hfil\fi}
  \let\@evenfoot=\@oddfoot}
%����ҳüҳ��


%------------------------ Abstract & Keywords -------------------------
 \newenvironment{abstract}[1][]
  {\cleardoublepage\setcounter{page}{1}\pagestyle{myplain}%�½��ҿ�
   \chapter{ժ^^a1^^a1Ҫ}%���Ʊ���a1
   \def\English##1{{\clearpage
     \renewcommand\baselinestretch{1}
     \@openrightfalse\chapter*{##1}
     % \begin{center}
       % ##2\\
       % ##3
     % \end{center}
	 \bigskip\par}}} 
{\clearpage
      \tableofcontents
	   \mainmatter
   \aftergroup\backmatter}
   %�����ҪѸ�ٽ���backmatterģʽ��������Ż����
   
   
   
%------------------------ Chapters/sections -------------------------
 \setcounter{secnumdepth}{3}%�����Զ���ŵ����
 \setcounter{tocdepth}{1}%����Ŀ¼����ʾ����
 \renewcommand\chaptername{\arabic{chapter}}%�������±��
 \renewcommand\sectionname{\thechapter.\arabic{section}}
\renewcommand{\chaptermark}[1]{\@mkboth{\thechapter ~~#1}{}}
%���¶���ҳü��֮�±���
% \renewcommand\chapter{
% \par
% \vspace{3cm}
 % \phantomsection
 % \global\@topnum\z@
 % \@afterindentfalse
  % \secdef\@chapter\@schapter}%ÿһ�²�����һҳ��д��
\renewcommand\chapter
{\if@openright\cleardoublepage\else\clearpage\fi
\phantomsection%\phantomsection���hyperref�����Ӷ�λ��׼
\global\@topnum\z@
\@afterindenttrue
\secdef\@chapter\@schapter
}
% \def\chapterformat{\centering \heiti \zihao{3}}
\def\chapterformat{\bfseries \centering \fontsize{16pt}{\baselineskip}\selectfont}
%�˵�����zihao�����ƺ���������Ч
\def\sectionformat{\bfseries \zihao{4}}
\def\subsectionformat{\noindent~~\zihao{-4}\rmfamily}
\def\subsubsectionformat{\noindent~~\normalfont \zihao{-4} \rmfamily}



%----------------------- Theorems -----------------------------------
\newtheorem{theorem}{{����}}[chapter]%����������Ϊ���ģ������±��
\newtheorem{proposition}[theorem]{{����}}
\newtheorem{property}{{����}}
\newtheorem{lemma}[theorem]{{����}}%ͬtheorem�������±��
\newtheorem{corollary}[theorem]{{����}}
\newtheorem{definition}{{����}}[section]%������ýڱ��
\newtheorem{example}{{��}}[section]
\renewcommand\proofname{֤��}


%----------------------- Publications -------------------------------
\newenvironment{publications}[1]
  {\renewcommand\bibname{��������Ŀ¼}\begin{thebibliography}{#1}}
  {\end{thebibliography}}
  

%----------------------- Acknowledgement ----------------------------
\newcommand\acknowledgement{\backmatter\chapter{��^^a1^^a1л}}



%----------------------- Appendices ---------------------------------
 \renewcommand\appendixname{��¼\,\Alph{chapter}}

 
 
%----------------------- Caption ------------------------------------
\setlength\abovecaptionskip{7\p@}
\setlength\belowcaptionskip{7\p@}

\long\def\@makecaption#1#2{
  \vskip\abovecaptionskip
  \small
  \sbox\@tempboxa{#1~~#2}
  \ifdim \wd\@tempboxa >\hsize
    #1~~#2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}
  \fi
  \vskip\belowcaptionskip}
  
\renewcommand\labelenumi{(\theenumi)}
\renewcommand\labelenumii{(\theenumii)}
\renewcommand\labelenumiii{(\theenumiii)}
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}%�������÷�ʽΪ���Ͻ�
\def \@floatboxreset {
  \reset@font
  \small
  \renewcommand\arraystretch{1.2}
  \@setminipage
}
\renewcommand\@openbib@code{
  \small\zihao{-5}}
\raggedbottom
\endlinechar `\^^M
\endinput