\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hputhesis}[2026/11/13 HPU graduate thesis template]
\RequirePackage{iftex}
\RequireXeTeX
\XeTeXgenerateactualtext=1
\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=hpuopt,prefix=hpuopt@}
\DeclareStringOption[master]{degree}
\DeclareStringOption[academic]{degreetype}
\DeclareStringOption[portable]{fonts}
\DeclareBoolOption[false]{anonymous}
\DeclareDefaultOption{\ClassError{hputhesis}{Unknown option \CurrentOption}{See README.md.}}
\ProcessKeyvalOptions*
\RequirePackage{etoolbox}
\ifdefstring{\hpuopt@degree}{master}{\def\hpulevel{硕士}}{%
  \ifdefstring{\hpuopt@degree}{doctor}{\def\hpulevel{博士}}{%
    \ClassError{hputhesis}{Invalid degree}{Use master or doctor.}}}
\ifdefstring{\hpuopt@degreetype}{academic}{\let\hpudegreeheading\hpulevel}{%
  \ifdefstring{\hpuopt@degreetype}{profession}{\def\hpudegreeheading{\hpulevel 专业}}{%
    \ifdefstring{\hpuopt@degreetype}{equaleducation}{%
      \ifdefstring{\hpuopt@degree}{master}{\def\hpudegreeheading{同等学力申请硕士}}{%
        \ClassError{hputhesis}{Equal education is a master degree option}{Use degree=master.}}%
    }{\ClassError{hputhesis}{Invalid degreetype}{Use academic, profession or equaleducation.}}}}
\LoadClass[UTF8,a4paper,twoside,openright,zihao=-4,scheme=chinese,fontset=fandol]{ctexbook}
\RequirePackage{fontspec}
\newcommand\hpucoverfamily{\kaishu}
\newcommand\hpucovercollege{\CJKfamily{hpukai}\bfseries}
\ifdefstring{\hpuopt@fonts}{portable}{%
  \setCJKfamilyfont{hpukai}[AutoFakeBold=2]{FandolKai-Regular.otf}%
  \setmainfont{texgyretermes}[Extension=.otf,UprightFont=*-regular, BoldFont=*-bold, ItalicFont=*-italic, BoldItalicFont=*-bolditalic]%
}{%
  \ifdefstring{\hpuopt@fonts}{system}{%
    \setmainfont{Times New Roman}%
    \setCJKmainfont[AutoFakeBold=2,ItalicFont=KaiTi]{SimSun}%
    \setCJKfamilyfont{zhsong}[AutoFakeBold=2]{SimSun}%
    \setCJKfamilyfont{zhhei}[AutoFakeBold=2]{SimHei}%
    \setCJKfamilyfont{zhkai}{KaiTi}
    \setCJKfamilyfont{hpukai}[AutoFakeBold=2]{KaiTi}%
    \setCJKfamilyfont{hpulishu}{LiSu}%
    \renewcommand\hpucoverfamily{\CJKfamily{hpulishu}}%
  }{\ClassError{hputhesis}{Invalid fonts}{Use portable or system.}}}

\RequirePackage[top=30mm,bottom=25mm,inner=25mm,outer=25mm,
  bindingoffset=10mm,headheight=14bp,headsep=\dimexpr10mm-14bp\relax,
  footskip=7.5mm]{geometry}
\RequirePackage{fancyhdr,emptypage}
\RequirePackage{graphicx,pdfpages}
\RequirePackage{amsmath,amssymb}
\RequirePackage{array,booktabs,tabularx,longtable,multirow,makecell}
\RequirePackage{siunitx}
\RequirePackage{caption}
\RequirePackage[titles]{tocloft}
\RequirePackage[backend=biber,style=gb7714-2015,sorting=none]{biblatex}
\RequirePackage[unicode,hidelinks,hypertexnames=false]{hyperref}
\RequirePackage{zref-totpages}

% 中文字号使用 bp，以对应 Word 中的字号和行距。
\newcommand\hpubodyfont{\normalfont\songti\fontsize{12bp}{22bp}\selectfont}
\AtBeginDocument{%
  \renewcommand\normalsize{%
    \@setfontsize\normalsize{12bp}{22bp}%
    \setlength\abovedisplayskip{10bp plus 2bp minus 3bp}%
    \setlength\belowdisplayskip{\abovedisplayskip}%
    \setlength\abovedisplayshortskip{3bp plus 2bp}%
    \setlength\belowdisplayshortskip{7bp plus 2bp minus 2bp}%
  }%
  \linespread{1}\normalsize
  \setlength\parindent{2\ccwd}%
  \setlength\parskip{0pt}%
}
\raggedbottom
\ctexset{
  chapter = {name={,},number=\arabic{chapter},aftername=\hspace{1\ccwd},
    format=\centering\heiti\bfseries\fontsize{16bp}{19bp}\selectfont,
    beforeskip=19bp,afterskip=19bp,afterindent=true,fixskip=true,pagestyle=hpubody},
  section = {format=\raggedright\heiti\bfseries\fontsize{15bp}{18bp}\selectfont,
    aftername=\hspace{1\ccwd},beforeskip=9bp,afterskip=9bp,afterindent=true},
  subsection = {format=\raggedright\heiti\bfseries\fontsize{14bp}{17bp}\selectfont,
    aftername=\hspace{1\ccwd},beforeskip=8.5bp,afterskip=8.5bp,afterindent=true},
}
\setcounter{secnumdepth}{2}
\setcounter{tocdepth}{2}
\renewcommand\chaptermark[1]{%
  \markboth{\if@mainmatter\thechapter\hspace{1em}\fi#1}{}}
\newcommand\hpu@pagefont{\normalfont\songti\zihao{5}}
\fancypagestyle{hpufront}{%
  \fancyhf{}%
  \fancyfoot[C]{\hpu@pagefont\thepage}%
  \renewcommand\headrulewidth{0pt}%
}
\fancypagestyle{hpubody}{%
  \fancyhf{}%
  \fancyhead[CO]{\hpu@pagefont\leftmark}%
  \fancyhead[CE]{\hpu@pagefont 河南理工大学\hpudegreeheading 学位论文}%
  \fancyfoot[C]{\hpu@pagefont\thepage}%
  \renewcommand\headrulewidth{0.4pt}%
}
\AtBeginDocument{\pagestyle{empty}}
\newcommand\hpufrontmatter{%
  \frontmatter
  \pagenumbering{Roman}%
  \pagestyle{hpufront}%
  \ctexset{chapter/pagestyle=hpufront}%
}
\newcommand\hpumainmatter{%
  \mainmatter
  \pagestyle{hpubody}%
  \ctexset{chapter/pagestyle=hpubody}%
}
\newcommand\hpubackmatter{\backmatter}
\NewDocumentCommand\hpufrontheading{m}{\chapter*{#1}}
\NewDocumentCommand\hpubackheading{m}{%
  \chapter*{#1}\markboth{#1}{}\addcontentsline{toc}{chapter}{#1}}
\pdfstringdefDisableCommands{\def\quad{ }}
\newcounter{hpuappendix}
\NewDocumentCommand\hpuappendix{m}{%
  \cleardoublepage
  \stepcounter{hpuappendix}%
  \edef\thechapter{\arabic{hpuappendix}}%
  \setcounter{figure}{0}\setcounter{table}{0}\setcounter{equation}{0}%
  \renewcommand\thefigure{A\thechapter-\arabic{figure}}%
  \renewcommand\thetable{A\thechapter-\arabic{table}}%
  \renewcommand\theequation{A\thechapter-\arabic{equation}}%
  \renewcommand\theHfigure{appendix.\thechapter.\arabic{figure}}%
  \renewcommand\theHtable{appendix.\thechapter.\arabic{table}}%
  \renewcommand\theHequation{appendix.\thechapter.\arabic{equation}}%
  \chapter*{附录\thechapter\protect\\#1}%
  \markboth{附录\thechapter\quad#1}{}%
  \addcontentsline{toc}{chapter}{附录\thechapter\quad#1}%
  \edef\@currentlabel{\arabic{hpuappendix}}
}
\renewcommand\contentsname{目\hspace{2\ccwd}录}
\renewcommand\listfigurename{插图目录}
\renewcommand\listtablename{表格目录}
\renewcommand\figurename{图}
\renewcommand\tablename{表}
\newcommand\hpu@tocfont{\normalfont\songti\fontsize{12bp}{18bp}\selectfont}
\newcommand\hpu@listfont{\normalfont\songti\fontsize{12bp}{20bp}\selectfont}
\renewcommand\cftchapfont{\hpu@tocfont\bfseries}
\renewcommand\cftchappagefont{\cftchapfont}
\renewcommand\cftsecfont{\hpu@tocfont}
\renewcommand\cftsecpagefont{\hpu@tocfont}
\renewcommand\cftsubsecfont{\hpu@tocfont}
\renewcommand\cftsubsecpagefont{\hpu@tocfont}
\renewcommand\cftchapleader{\cftdotfill{\cftdotsep}}
\setlength\cftbeforechapskip{9bp}
\cftsetindents{chapter}{0bp}{24bp}
\cftsetindents{section}{24bp}{32bp}
\cftsetindents{subsection}{48bp}{44bp}
\renewcommand\cftfigfont{\hpu@listfont}
\renewcommand\cftfigpagefont{\hpu@listfont}
\renewcommand\cfttabfont{\hpu@listfont}
\renewcommand\cfttabpagefont{\hpu@listfont}
\renewcommand\cftfigpresnum{图}
\renewcommand\cfttabpresnum{表}
\setlength\cftfignumwidth{45bp}
\setlength\cfttabnumwidth{45bp}

\renewcommand\thefigure{\thechapter-\arabic{figure}}
\renewcommand\thetable{\thechapter-\arabic{table}}
\counterwithin{equation}{chapter}
\renewcommand\theequation{\thechapter-\arabic{equation}}
\DeclareCaptionFont{hpucaption}{\songti\fontsize{10.5bp}{13bp}\selectfont}
\captionsetup{font={hpucaption,bf},labelsep=quad,justification=centering,indention=0pt}
\captionsetup[figure]{position=bottom,aboveskip=0bp,belowskip=6.5bp}
\captionsetup[table]{position=top,aboveskip=6.5bp,belowskip=0bp}
\appto\@floatboxreset{\centering\songti\zihao{-5}}
\renewcommand\bibfont{\normalfont\songti\fontsize{10.5bp}{22bp}\selectfont}
\setlength\bibitemsep{0pt}
\setlength\bibparsep{0pt}
\defbibheading{hpu}[参考文献]{\hpubackheading{#1}}
\defbibenvironment{hpu}
  {\list{}{\setlength\leftmargin{0pt}\setlength\itemsep{0pt}\setlength\parsep{0pt}}}
  {\endlist}
  {\item\relax
   \hangindent=\ifnumless{\thefield{labelnumber}}{10}{6mm}{%
     \ifnumless{\thefield{labelnumber}}{100}{7.4mm}{9mm}}\relax
   \hangafter=1\relax
   \makebox[\hangindent][l]{\printtext[labelnumberwidth]{\printfield{labelnumber}}}}
\newcommand\hpubibliography{\printbibliography[heading=hpu,env=hpu]}

% 封面、题名页和数据集共用元数据。
\ExplSyntaxOn
\prop_new:N \g__hpu_meta_prop
\NewDocumentCommand \hpusetup { m }
  { \keyval_parse:NNn \use_none:n \__hpu_meta_put:nn {#1} }
\cs_new_protected:Npn \__hpu_meta_put:nn #1#2
  { \prop_gput:Nnn \g__hpu_meta_prop {#1}{#2} }
\NewExpandableDocumentCommand \hpufield { m }
  { \prop_item:Nn \g__hpu_meta_prop {#1} }
\ExplSyntaxOff
\newcommand\hpuprivate[1]{\ifhpuopt@anonymous\else#1\fi}
\let\hpuifnamed\hpuprivate
\newcommand\hpureviewfield[1]{\ifhpuopt@anonymous 送审时隐去\else#1\fi}
\newcommand\hpusecondadvisor[1]{%
  \ifdefstring{\hpuopt@degreetype}{profession}{%
    \ifdefstring{\hpuopt@degree}{master}{#1}{}%
  }{}%
}
\newcommand\hpuinputfile[1]{\input{#1}}
\newcommand\makecover{%
  \hypersetup{pdftitle={\hpufield{title}},pdfauthor={\hpuprivate{\hpufield{author}}}}%
  \hpuinputfile{chapters/cover}%
  \cleardoublepage
  \ifhpuopt@anonymous
    \hpuinputfile{chapters/statements}%
  \else
    \IfFileExists{chapters/statements-signed.pdf}{%
      \includepdf[pages=1,pagecommand={\thispagestyle{empty}}]{chapters/statements-signed.pdf}%
    }{\hpuinputfile{chapters/statements}}%
  \fi
  \cleardoublepage
  \hpuinputfile{chapters/titlepage}%
  \clearpage
}
\newcommand\hpuzhkeywords{\par\textbf{关键词：}\hpufield{keywords}}
\newcommand\hpuenkeywords{\par\textbf{Keywords: }\hpufield{keywords-en}}
\endinput
