% -*- TeX:UTF-8 -*-
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 							PKNU Graduate thesis LaTeX class
%
% @version      0.3
% @releasedate  Nov 30th, 2023
%
% @author       Kwon, Yong 권용
%               mailto:rainstar77@pukyong.ac.kr
%
% @requirements
%    current distribution of TeXLive
%      + ko.TeX
%
% @History
% Yong Kwon, updated the template in October 2023.
% Yong Kwon, started to reproduce as a template in December 2022.
% 
% The PKNU thesis class refers KAIST thesis template and POSTECH.
% KAIST: https://github.com/0xdkay/kaist-thesis-template
% POSTECH: https://github.com/lonelywing/POSTECH_thesis_template_latex
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{PKNU-thesis}[2023/11/30 v0.3 Unofficial PKNU Thesis document class]

%% 옵션 설정을 위한 boolean 변수선언
\newif\if@isDoctor
\newif\if@isKorean
\newif\if@isFinal
\newif\if@PDFdoc\@PDFdocfalse
\newif\if@dvips\@dvipsfalse

%% 새 옵션 모음 - doctor|master, korean|english, final|draft
\DeclareOption{doctor} {\@isDoctortrue}
\DeclareOption{master} {\@isDoctorfalse}
\DeclareOption{korean} {\@isKoreantrue}
\DeclareOption{english} {\@isKoreanfalse}
\DeclareOption{final}  {\@isFinaltrue}
\DeclareOption{draft}  {\@isFinalfalse}
\DeclareOption{pdfdoc} {\@PDFdoctrue}
\DeclareOption{dvips}  {\@dvipstrue}

%% leqno,fleqn,openbib 옵션은 그대로 report 클래스에 전달
\DeclareOption{leqno}  {\PassOptionsToClass{leqno}  {report}}
\DeclareOption{fleqn}  {\PassOptionsToClass{fleqn}  {report}}
\DeclareOption{openbib}{\PassOptionsToClass{openbib}{report}}

\ExecuteOptions{doctor,korean,final}         % doctor,korean,final이 기본값
\ProcessOptions

%% 11pt,a4paper,onecolumn,oneside 옵션으로 report 클래스 불러오기
\LoadClass[11pt,a4paper,onecolumn,oneside]{report}
%% 한국어지정시 kotex의 hangul옵션 불러오기
\if@isKorean\usepackage[hangul]{kotex}\fi

%%들여쓰기
\usepackage{indentfirst}
\setlength\parindent{2.0em}

\RequirePackage{ifthen}       % 추가 패키지 설정

%%%% Hangul-ucs preamble.......
\RequirePackage[nonfrench]{dhucs}
%\RequirePackage[default]{dhucs-interword}
\RequirePackage{ifpdf}
\ifpdf
\def\@drivername{pdftex}
\else
\def\@drivername{dvipdfmx}
\fi
\if@dvips
\def\@drivername{dvips}
\fi

%\ifpdf
%  \input glyphtounicode\pdfgentounicode=1
%\fi

\RequirePackage[\@drivername]{graphicx,xcolor}

\usepackage{color}
\definecolor{cyan}{cmyk}{1,0,0,0}
\definecolor{darkgreen}{rgb}{0,0.5,0}
\definecolor{orange}{rgb}{1,0.5,0}
\definecolor{magenta}{cmyk}{0,1,0,0}
\definecolor{darkyellow}{cmyk}{0,0,0.75,0}
\definecolor{darkred}{rgb}{0.4,0,0}
\definecolor{darkgreen}{rgb}{0,0.25,0}
\definecolor{darkblue}{rgb}{0,0,0.55}
\definecolor{darkcyan}{cmyk}{0.75,0,0,0}
\definecolor{darkmagenta}{cmyk}{0,0.75,0,0}
\definecolor{darkyellow}{cmyk}{0,0,0.75,0}

\if@PDFdoc
\RequirePackage[unicode,%
\@drivername=true,%
bookmarks=true,%
colorlinks=true,%
linkcolor=darkred,      %red
anchorcolor=black,      %black
citecolor=darkgreen,        %green
filecolor=darkmagenta,      %magenta
menucolor=darkred,      %red
urlcolor=darkcyan,          %cyan
]{hyperref}
\else
\RequirePackage[unicode,%
\@drivername=true,%
bookmarks=false,%
colorlinks=false,%
colorlinks=true,    %remove square
linkcolor=darkred,      %red
anchorcolor=black,      %black
citecolor=darkgreen,        %green
filecolor=darkmagenta,      %magenta
menucolor=darkred,      %red
urlcolor=darkcyan,          %cyan
]{hyperref}
\fi


%% for compatability to HLaTeX
\let\gt\sffamily
\DeclareTextFontCommand{\textgt}{\gt}
%%%% end of Hangul-ucs preamble

\AtBeginDocument{%                           % \begin{document}와 함께 실행
	\checkparameters                        % 문서 변수가 올바른지 점검
	\if@isFinal                             % final 옵션이 지정되어 있으면
	\makefrontcover \maketitle         % 앞표지, 속표지 생성
	\makeapproval                      % 제출승인서, 심사완료검인 생성
	\else \fi }
\AtEndDocument{}                             % \end{document}와 함께 실행

%% 편집용지 설정
% The page size and margins of this thesis template follows A4 size and format regulations during writing a thesis refering to the guideline of PKNU Graudate School. 
% Use 'showframe' command for viewing lines of margins.
% When you print your thesis written in this template, please change the page format to 190mm X 260mm
\usepackage[paperwidth=210mm,paperheight=297mm, 
top=52mm, bottom=35mm, left=38mm, right=38mm,
head=0mm, foot=15mm]{geometry}

%% 줄간격 설정
%\renewcommand{\baselinestretch}{1.3}
\linespread{1.3}

%% 본문이 영어로 되어있는지 한글로 되어있는지 설정
\newcommand{\@korean}{korean}
\newcommand{\@english}{english}
\newcommand{\@textlang}{}                    % 텍스트 기본언어 변수선언
\if@isKorean                                 % korean 옵션이 지정되어 있으면
\let\@textlang\@korean                  % 텍스트 기본언어는 한글
\else                                        % english 옵션이 지정되어 있으면
\let\@textlang\@english                 % 텍스트 기본언어는 영문
\fi

%%
%% 문서 정보 변수 정의
%%

% @command title 논문 제목
% @options [default: (none)]
% - korean: 한글제목 | english: 영문제목
\renewcommand{\title}[2][korean] {%
	\ifthenelse{\equal{#1}{korean}}%
	{\newcommand{\@titleKor}{#2}}{}%
	\ifthenelse{\equal{#1}{english}}%
	{\newcommand{\@titleEng}{#2}}{}%
}
\@onlypreamble{\title}

% @command author 저자 이름
% @param family_name, given_name 성, 이름을 구분해서 입력
% @options [default: (none)]
% - korean: 한글이름 | english: 영문이름
\renewcommand{\author}[3][korean] {%
	\ifthenelse{\equal{#1}{korean}}
	{\newcommand{\@authorKorFN}{#2}
		\newcommand{\@authorKorGN}{#3}
		\newcommand{\@authorKor}{#2\ #3}}{}%
	\ifthenelse{\equal{#1}{english}}
	{\newcommand{\@authorEngFN}{#2}
		\newcommand{\@authorEngGN}{#3}
		\newcommand{\@authorEng}{#3 #2}}{}%
		% \newcommand{\@authorEng}{#2, #3}}{}%
}

\@onlypreamble{\author}

% @command advisor 지도교수 이름 (복수가능)
% @options [default: major]
% - major: 주 지도교수  | coopr: 부 지도교수 (공동지도교수 경우)
\newcommand{\advisor}[4][major]{%
	\ifthenelse{\equal{#1}{major}} {%       % 주 지도교수이면
		\newcommand{\@advisorMajorKor}{#2} % 한글이름 저장
		\newcommand{\@advisorMajorEng}{#3} % 영문이름 저장
		% nosign을 명시하지 않으면 주 지도교수가 서명한 것으로 간주
		\ifthenelse{\equal{#4}{nosign}}{}{%
			\newcommand{\@advisorSigned}{\@advisorMajorEng}} }{}%
	\ifthenelse{\equal{#1}{major2}} {%       % 주 지도교수이면
		\newcommand{\@advisorMajorKorCont}{#2} % 한글이름 저장
		\newcommand{\@advisorMajorEngCont}{#3} % 영문이름 저장
		% nosign을 명시하지 않으면 주 지도교수가 서명한 것으로 간주
		\ifthenelse{\equal{#4}{nosign}}{}{%
			\newcommand{\@advisorSignedCont}{\@advisorMajorEngCont}} }{}%
	\ifthenelse{\equal{#1}{coopr}} {%       % 부 지도교수이면
		\newcommand{\@advisorCooprKor}{#2} % 한글이름 저장
		\newcommand{\@advisorCooprEng}{#3} % 영문이름 저장
		% signed를 명시해야 부 지도교수가 서명한 것으로 간주
		\ifthenelse{\equal{#4}{signed}}{%
			\newcommand{\@advisorSigned}{\@advisorCooprEng}}{} }{}%
	\ifthenelse{\equal{#1}{coopr2}} {%       % 부 지도교수이면
		\newcommand{\@advisorCooprKorCont}{#2} % 한글이름 저장
		\newcommand{\@advisorCooprEngCont}{#3} % 영문이름 저장
		% signed를 명시해야 부 지도교수가 서명한 것으로 간주
		\ifthenelse{\equal{#4}{signed}}{%
			\newcommand{\@advisorSignedCont}{\@advisorCooprEngCont}}{} }{}%            
}
\@onlypreamble{\advisor}

%% 제출승인서에 들어가는 교수님 정보 명령
\newcommand{\advisorinfo}[1]{\newcommand{\@advisorinfo}{#1}}

% @command department 
%
\newcommand{\@degreeCode}{}          % 학위 영문코드
\newcommand{\@degreeName}{}          % 학위명
\newcommand{\@degreeversion}{}       % 학과 표현 종류
\newcommand{\@parentDeptNameKor}{}      % 학과/전공 첫째줄
\newcommand{\@childDeptNameKor}{}       % 학과/전공 둘째줄
\newcommand{\@parentDeptNameEng}{}      % 학과/전공 첫째줄
\newcommand{\@childDeptNameEng}{}       % 학과/전공 둘째줄
\newcommand{\@affFullNameKor}{}      % 학과/전공 한글이름
\newcommand{\@affFullNameEng}{}      % 학과/전공 영문이름
\newcommand{\@parentAcademNameEng}{} % 학문 영문이름 첫째줄
\newcommand{\@childAcademNameEng}{} % 학문 영문이름 둘째줄
\newcommand{\@appFullAcademName}{}
\newcommand{\@degreeField}{}
\newcommand{\@degreePrefix}{\ifthenelse{\boolean{@isDoctor}}{D}{M}}
\newcommand{\department}[3] {%
%% Natural Sciences
	\ifthenelse{\equal{#1}{NS}}
	{\renewcommand{\@degreeCode}{\@degreePrefix #1}
		\renewcommand{\@childDeptNameKor}{간호학과}
		\renewcommand{\@childDeptNameEng}{Department of Nursing}
		\renewcommand{\@parentDeptNameKor}{}
		\renewcommand{\@parentDeptNameEng}{}
		\renewcommand{\@parentAcademNameEng}{}
		\renewcommand{\@childAcademNameEng}{Nursing}
		\renewcommand{\@degreeField}{#2}
		\renewcommand{\@degreeversion}{#3}}{}
	\ifthenelse{\equal{#1}{SC}}
	{\renewcommand{\@degreeCode}{\@degreePrefix #1}
		\renewcommand{\@childDeptNameKor}{과학컴퓨팅학과}
		\renewcommand{\@childDeptNameEng}{Department of Scientific Computing}
		\renewcommand{\@parentDeptNameKor}{}
		\renewcommand{\@parentDeptNameEng}{}
		\renewcommand{\@parentAcademNameEng}{}
		\renewcommand{\@childAcademNameEng}{Scientific Computing}
		\renewcommand{\@degreeField}{#2}
		\renewcommand{\@degreeversion}{#3}}{}
	\ifthenelse{\equal{#1}{PH}}
	{\renewcommand{\@degreeCode}{\@degreePrefix #1}
		\renewcommand{\@childDeptNameKor}{물리학과}
		\renewcommand{\@childDeptNameEng}{Department of Physics}
		\renewcommand{\@parentDeptNameKor}{}
		\renewcommand{\@parentDeptNameEng}{}
		\renewcommand{\@parentAcademNameEng}{}
		\renewcommand{\@childAcademNameEng}{Physics}
		\renewcommand{\@degreeField}{#2}
		\renewcommand{\@degreeversion}{#3}}{}
	\ifthenelse{\equal{#1}{AM}}
	{\renewcommand{\@degreeCode}{\@degreePrefix #1}
		\renewcommand{\@childDeptNameKor}{응용수학과}
		\renewcommand{\@childDeptNameEng}{Department of Applied Mathematics}
		\renewcommand{\@parentDeptNameKor}{}
		\renewcommand{\@parentDeptNameEng}{}
		\renewcommand{\@parentAcademNameEng}{}
		\renewcommand{\@childAcademNameEng}{Applied Mathematics}
		\renewcommand{\@degreeField}{#2}
		\renewcommand{\@degreeversion}{#3}}{}
	\ifthenelse{\equal{#1}{ST}}
	{\renewcommand{\@degreeCode}{\@degreePrefix #1}
		\renewcommand{\@childDeptNameKor}{통계학과}
		\renewcommand{\@childDeptNameEng}{Department of Statistics}
		\renewcommand{\@parentDeptNameKor}{}
		\renewcommand{\@parentDeptNameEng}{}
		\renewcommand{\@parentAcademNameEng}{}
		\renewcommand{\@childAcademNameEng}{Statistics}
		\renewcommand{\@degreeField}{#2}
		\renewcommand{\@degreeversion}{#3}}{}
	\ifthenelse{\equal{#1}{CH}}
	{\renewcommand{\@degreeCode}{\@degreePrefix #1}
		\renewcommand{\@childDeptNameKor}{화학과}
		\renewcommand{\@childDeptNameEng}{Department of Chemistry}
		\renewcommand{\@parentDeptNameKor}{}
		\renewcommand{\@parentDeptNameEng}{}
		\renewcommand{\@parentAcademNameEng}{}
		\renewcommand{\@childAcademNameEng}{Chemistry}
		\renewcommand{\@degreeField}{#2}
		\renewcommand{\@degreeversion}{#3}}{}
%% Engineering		
	\ifthenelse{\equal{#1}{IT}}
	{\renewcommand{\@degreeCode}{\@degreePrefix #1}
		\renewcommand{\@childDeptNameKor}{IT융합응용공학과}
		\renewcommand{\@childDeptNameEng}{Department of IT Convergence & Application Engineering}
		\renewcommand{\@parentDeptNameKor}{}
		\renewcommand{\@parentDeptNameEng}{}
		\renewcommand{\@parentAcademNameEng}{}
		\renewcommand{\@childAcademNameEng}{IT Convergence & Application Engineering}
		\renewcommand{\@degreeField}{#2}
		\renewcommand{\@degreeversion}{#3}}{}
	\ifthenelse{\equal{#1}{CM}}
	{\renewcommand{\@degreeCode}{\@degreePrefix #1}
		\renewcommand{\@childDeptNameKor}{컴퓨터공학과}
		\renewcommand{\@childDeptNameEng}{Department of Computer Engineering}
		\renewcommand{\@parentDeptNameKor}{}
		\renewcommand{\@parentDeptNameEng}{}
		\renewcommand{\@parentAcademNameEng}{}
		\renewcommand{\@childAcademNameEng}{Computer Engineering}
		\renewcommand{\@degreeField}{#2}
		\renewcommand{\@degreeversion}{#3}}{}
	\ifthenelse{\equal{#1}{MC}}
	{\renewcommand{\@degreeCode}{\@degreePrefix #1}
		\renewcommand{\@childDeptNameKor}{기계공학과}
		\renewcommand{\@childDeptNameEng}{Department of Mechanical Engineering}
		\renewcommand{\@parentDeptNameKor}{}
		\renewcommand{\@parentDeptNameEng}{}
		\renewcommand{\@parentAcademNameEng}{}
		\renewcommand{\@childAcademNameEng}{Mechanical Engineering}
		\renewcommand{\@degreeField}{#2}
		\renewcommand{\@degreeversion}{#3}}{}
	\ifthenelse{\equal{#1}{RA}}
	{\renewcommand{\@degreeCode}{\@degreePrefix #1}
		\renewcommand{\@childDeptNameKor}{냉동공조공학과}
		\renewcommand{\@childDeptNameEng}{Department of Refrigeration and Air-conditioning Engineering}
		\renewcommand{\@parentDeptNameKor}{}
		\renewcommand{\@parentDeptNameEng}{}
		\renewcommand{\@parentAcademNameEng}{}
		\renewcommand{\@childAcademNameEng}{Refrigeration and Air-conditioning Engineering}
		\renewcommand{\@degreeField}{#2}
		\renewcommand{\@degreeversion}{#3}}{}
	\ifthenelse{\equal{#1}{EC}}
	{\renewcommand{\@degreeCode}{\@degreePrefix #1}
		\renewcommand{\@childDeptNameKor}{전기공학과}
		\renewcommand{\@childDeptNameEng}{Department of Electrical Engineering}
		\renewcommand{\@parentDeptNameKor}{}
		\renewcommand{\@parentDeptNameEng}{}
		\renewcommand{\@parentAcademNameEng}{}
		\renewcommand{\@childAcademNameEng}{Electrical Engineering}
		\renewcommand{\@degreeField}{#2}
		\renewcommand{\@degreeversion}{#3}}{}
	\ifthenelse{\equal{#1}{ER}}
	{\renewcommand{\@degreeCode}{\@degreePrefix #1}
		\renewcommand{\@childDeptNameKor}{전자공학과}
		\renewcommand{\@childDeptNameEng}{Department of Electronic Engineering}
		\renewcommand{\@parentDeptNameKor}{}
		\renewcommand{\@parentDeptNameEng}{}
		\renewcommand{\@parentAcademNameEng}{}
		\renewcommand{\@childAcademNameEng}{Electronic Engineering}
		\renewcommand{\@degreeField}{#2}
		\renewcommand{\@degreeversion}{#3}}{}
	
	\renewcommand{\@affFullNameKor}{%               % 학과/전공 한글이름
		\ifthenelse{\equal{\@parentDeptNameKor}{}}
		{\@childDeptNameKor}{%
			\ifthenelse{\equal{\@degreeversion}{a}}{\@parentDeptNameKor}{}%
			\ifthenelse{\equal{\@degreeversion}{b}}{\@parentDeptNameKor \ (\@childDeptNameKor)}{}%
			\ifthenelse{\equal{\@degreeversion}{c}}{\@childDeptNameKor}{}}
	}
	\renewcommand{\@affFullNameEng}{%               % 학과/전공 영문이름
		\ifthenelse{\equal{\@parentDeptNameEng}{}}
		{\@childDeptNameEng}{%
			\ifthenelse{\equal{\@degreeversion}{a}}{\@parentDeptNameEng}{}%
			\ifthenelse{\equal{\@degreeversion}{b}}{\@parentDeptNameEng \ (\@childDeptNameEng)}{}%
			\ifthenelse{\equal{\@degreeversion}{c}}{\@childDeptNameEng}{}}
	}
	\renewcommand{\@appFullAcademName}{%               % 학문 승인서용 영문이름
		\ifthenelse{\equal{\@parentAcademNameEng}{}}
		{\@childAcademNameEng}{%
			\ifthenelse{\equal{\@degreeversion}{a}}{\@parentAcademNameEng}{}%
			\ifthenelse{\equal{\@degreeversion}{b}}{\@parentAcademNameEng \ (\@childAcademNameEng)}{}%
			\ifthenelse{\equal{\@degreeversion}{c}}{\@childAcademNameEng}{}}
	}

	\renewcommand{\@degreeName}{%                       % 학위 영문이름
		\ifthenelse{\boolean{@isDoctor}}
		{Doctor of Philosophy} {%                 % 박사는 모두 Ph.D.
			\ifthenelse{\equal{\@degreeField}{science}}
			{Master of Science}{}%               % 이학석사는 M.S.
			\ifthenelse{\equal{\@degreeField}{engineering}}
			{Master of Engineering}{}%           % 공학석사는 M.E.
			% {Master of Science}{}%           % 공학석사는 M.S.
			\ifthenelse{\equal{\@degreeField}{business}}
			{Master of Business Administration}{}% 경영학석사는 M.B.A.
		}
	}
}
\@onlypreamble{\department}

% @command studentid 학번
\newcommand{\studentid}[1]{\newcommand{\@studentID}{#1}}
\@onlypreamble{\studentid}

% @command referee 심사위원 (석사과정 3인, 박사과정 5인)
\newcommand{\referee}[2][1] {%
	\ifthenelse{\equal{#1}{1}}{\newcommand{\@refereeChief} {#2}} {}%
	\ifthenelse{\equal{#1}{2}}{\newcommand{\@refereeSecond}{#2}} {}%
	\ifthenelse{\equal{#1}{3}}{\newcommand{\@refereeThird} {#2}} {}%
	\ifthenelse{\equal{#1}{4}}{\newcommand{\@refereeFourth}{#2}} {}%
	\ifthenelse{\equal{#1}{5}}{\newcommand{\@refereeFifth} {#2}} {}%
}
\@onlypreamble{\referee}

% @command signature of referee
\newcommand{\refsign}[2][1]{%
	\ifthenelse{\equal{#1}{1}}{\newcommand{\@refereeChiefsign} {#2}} {}%
	\ifthenelse{\equal{#1}{2}}{\newcommand{\@refereeSecondsign}{#2}} {}%
	\ifthenelse{\equal{#1}{3}}{\newcommand{\@refereeThirdsign} {#2}} {}%
	\ifthenelse{\equal{#1}{4}}{\newcommand{\@refereeFourthsign}{#2}} {}%
	\ifthenelse{\equal{#1}{5}}{\newcommand{\@refereeFifthsign} {#2}} {}%
}
\@onlypreamble{\refsign}

% @command approvaldate 지도교수논문승인일
% @param year,month,day 연,월,일 순으로 입력
\newcommand{\approvaldate}[3] {%
	\newcommand{\@approvalYear}{#1}
	\newcommand{\@approvalMonth}{#2}
	\newcommand{\@approvalDay}{#3}
}
\@onlypreamble{\approvaldate}

%% 날짜 영문표기
\newcommand{\approvalMonthEng}{%
	\ifcase\@approvalMonth
	\or January% 1
	\or February% 2
	\or March% 3
	\or April% 4
	\or May% 5
	\or June% 6
	\or July% 7
	\or August% 8
	\or September% 9
	\or October% 10
	\or November% 11
	\or December% 12
	\fi
}

% @command refereedate 심사위원논문심사일
% @param year,month,day 연,월,일 순으로 입력
\newcommand{\refereedate}[3] {%
	\newcommand{\@refereeYear}{#1}
	\newcommand{\@refereeMonth}{#2}
	\newcommand{\@refereeDay}{#3}
}
\@onlypreamble{\refereedate}

%%
%% 필요한 정보 중에 누락된 것이 없는지 점검 --> 제작중. 아직 불완전. 그대로 놔둠
%%
\newcommand{\checkparameters}{%
	\@ifundefined{@titleKor}{%
		\ClassError{kaist}{The korean title is not found}{}}{}
	\@ifundefined{@titleEng}{%
		\ClassError{kaist}{The english title is not found}{}}{}
	\@ifundefined{@authorKor}{%
		\ClassError{kaist}{The korean name of the author is not found}{}}{}
	\@ifundefined{@authorEng}{%
		\ClassError{kaist}{The english name of the author is not found}{}}{}
	\@ifundefined{@advisorMajorKor}{%
		\ClassError{kaist}{The korean name of the major advisor is not found}{}}{}
	\@ifundefined{@advisorMajorEng}{%
		\ClassError{kaist}{The english name of the major advisor is not found}{}}{}
}

%%
%% 앞표지 Front Cover
%%
\newcommand{\makefrontcover}{%
	\renewcommand{\baselinestretch}{1.3}%
	\thispagestyle{empty} \noindent%
	\if@isKorean
		\begin{center}
			\if@isDoctor
				\fontsize{14pt}{14}\selectfont{이 학 박 사 학 위 논 문}	\\[1.5cm]
			\else
				\fontsize{14pt}{14}\selectfont{이 학 석 사 학 위 논 문}	\\[1.5cm]
			\fi
			\fontsize{22pt}{22}\selectfont{\textbf{\@titleKor}}	\\[7cm]
			\fontsize{12pt}{12}\selectfont{\@approvalYear 년 \@approvalMonth 월} \\[1cm]
			\fontsize{14pt}{14}\selectfont{부~~경~~대~~학~~교~~대~~학~~원}	\\[1cm]
			\fontsize{14pt}{14}\selectfont{\@affFullNameKor} \\[1cm]
			\fontsize{14pt}{14}\selectfont{\@authorKor}
		\end{center} \newpage
	\else
		\begin{center}
			\fontsize{14pt}{14}\selectfont{Thesis for the Degree of \@degreeName} \\[1.5cm]
			\fontsize{22pt}{22}\selectfont\textbf{\@titleEng}\\[7cm]
			\fontsize{14pt}{14}\selectfont{by\\[0.5cm]
			\@authorEng\\[0.5cm]
			\@affFullNameEng\\[0.5cm]
			The Graduate School\\[0.5cm]
			Pukyong National University\\[1cm]}
			\fontsize{12pt}{14}\selectfont{\approvalMonthEng, \@approvalYear}\\[1cm]
		\end{center} \newpage
	\fi
}

%%
%% 속표지 Inner Cover
%%
%% ! 공동 지도교수 지원하지 않음
\renewcommand{\maketitle}{%
	\renewcommand{\baselinestretch}{1.3}%
	\thispagestyle{empty} \noindent 
	\if@isKorean
		\begin{center}
			\if@isDoctor
				\fontsize{14pt}{14}\selectfont{이 학 박 사 학 위 논 문}	\\[1.5cm]
				\fontsize{22pt}{22}\selectfont{\textbf{\@titleKor}} \\[1.5cm]
				\fontsize{14pt}{14}\selectfont{지도교수 \@advisorMajorKor} \\[2cm]
				\fontsize{14pt}{14}\selectfont{이 논문을 이학박사 학위논문으로 제출함.} \\[2cm]
				\fontsize{14pt}{14}\selectfont{\@approvalYear년 \@approvalMonth월} \\[1cm]
				\fontsize{14pt}{14}\selectfont{부~~경~~대~~학~~교~~대~~학~~원} \\[1cm]
				\fontsize{14pt}{14}\selectfont{\@affFullNameKor} \\[1cm]
				\fontsize{14pt}{14}\selectfont{\@authorKor} \\[1cm]
			\else
				\fontsize{14pt}{14}\selectfont{이 학 석 사 학 위 논 문}	\\[1.5cm]
				\fontsize{22pt}{22}\selectfont{\textbf{\@titleKor}} \\[1.5cm]
				\fontsize{14pt}{14}\selectfont{지도교수 \@advisorMajorKor} \\[2cm]
				\fontsize{14pt}{14}\selectfont{이 논문을 이학석사 학위논문으로 제출함.} \\[2cm]
				\fontsize{14pt}{14}\selectfont{\@approvalYear년 \@approvalMonth월} \\[1cm]
				\fontsize{14pt}{14}\selectfont{부~~경~~대~~학~~교~~대~~학~~원} \\[1cm]
				\fontsize{14pt}{14}\selectfont{\@affFullNameKor} \\[1cm]
				\fontsize{14pt}{14}\selectfont{\@authorKor} \\[1cm]
			\fi
			\end{center} \newpage
	\else
		\begin{center}
			\fontsize{22pt}{22}\selectfont{\textbf{\@titleEng\\ \@titleKor}} \\[1.5cm]
			\fontsize{12pt}{12}\selectfont{Advisor: Prof. \@advisorMajorEng} \\[1.5cm]
			\fontsize{14pt}{14}\selectfont{by\\ \@authorEng} \\[4cm]
			\fontsize{12pt}{12}\selectfont{A thesis submitted in partial fulfillment of the requirements\\ for the degree of} \\[1cm]
			\fontsize{12pt}{12}\selectfont{\@degreeName} \\[1cm]
			\fontsize{12pt}{12}\selectfont{in \@affFullNameEng, The Graduate School,\\
			Pukyong National University}\\[1cm]
			\fontsize{12pt}{14}\selectfont{\approvalMonthEng,~\@approvalYear}\\[1cm]
		\end{center} \newpage
	\fi
} 

%%
%% 학위논문 심사완료 인준서 Approval Statement
%%
%% 논문위원수에 따른 설정 만들어야 함.
\newcommand{\makeapproval}{%% 학위논문 심사완료 검인서
	\renewcommand{\baselinestretch}{1.3}
	\thispagestyle{empty} \noindent
	\if@isKorean
		\begin{center}
			\if@isDoctor
				\fontsize{22pt}{22}\selectfont{\@authorKor 의 이학박사 학위논문을 인준함.} \\[1.5cm]
			\else
				\fontsize{22pt}{22}\selectfont{\@authorKor 의 이학석사 학위논문을 인준함.} \\[1.5cm]
			\fi
			\fontsize{12pt}{12}\selectfont{\@approvalYear년 \@approvalMonth월 \@approvalDay일} \\[9cm]
			\if@isDoctor
				\begin{tabular}{lllllll}
						\fontsize{16pt}{16}\selectfont 위~~원~~장 &  & \fontsize{16pt}{16}\selectfont 이학박사 &  & \fontsize{16pt}{16}\selectfont \@refereeChief &  & \fontsize{16pt}{16}\selectfont (인) \\[1em]
						\fontsize{16pt}{16}\selectfont 위~~~~~~~원  &  & \fontsize{16pt}{16}\selectfont 이학박사 &  & \fontsize{16pt}{16}\selectfont \@refereeSecond &  & \fontsize{16pt}{16}\selectfont (인) \\[1em]
						\fontsize{16pt}{16}\selectfont 위~~~~~~~원 &  & \fontsize{16pt}{16}\selectfont 이학박사 &  & \fontsize{16pt}{16}\selectfont \@refereeThird &  & \fontsize{16pt}{16}\selectfont (인) \\[1em]
						\fontsize{16pt}{16}\selectfont 위~~~~~~~원  &  & \fontsize{16pt}{16}\selectfont 이학박사 &  & \fontsize{16pt}{16}\selectfont \@refereeFourth &  & \fontsize{16pt}{16}\selectfont (인) \\[1em]
						\fontsize{16pt}{16}\selectfont 위~~~~~~~원  &  & \fontsize{16pt}{16}\selectfont 이학박사 &  & \fontsize{16pt}{16}\selectfont \@refereeFifth &  & \fontsize{16pt}{16}\selectfont (인)
				\end{tabular}
			\else
				\begin{tabular}{lllllll}
						\fontsize{16pt}{16}\selectfont 위~~원~~장 &  & \fontsize{16pt}{16}\selectfont 이학박사 &  & \fontsize{16pt}{16}\selectfont \@refereeChief &  & \fontsize{16pt}{16}\selectfont (인) \\[1em]
						\fontsize{16pt}{16}\selectfont 위~~~~~~~원  &  & \fontsize{16pt}{16}\selectfont 이학박사 &  & \fontsize{16pt}{16}\selectfont \@refereeSecond &  & \fontsize{16pt}{16}\selectfont (인) \\[1em]
						\fontsize{16pt}{16}\selectfont 위~~~~~~~원  &  & \fontsize{16pt}{16}\selectfont 이학박사 &  & \fontsize{16pt}{16}\selectfont \@refereeThird &  & \fontsize{16pt}{16}\selectfont (인)
				\end{tabular}
			\fi
		\end{center} \newpage
	\else
		\begin{center}
			\fontsize{14pt}{14}\selectfont{\@titleEng} \\[3cm]
			\fontsize{12pt}{12}\selectfont{A dissertation\\ by\\ \@authorEng} \\[1.5cm]
		\end{center}
		\if@isDoctor
			\fontsize{10pt}{10}\selectfont{Approved by:\\[2cm]
			\begin{tabular}{ll}
				\includegraphics[width=0.35\textwidth]{\@refereeChiefsign} & \\[-0.5cm]
				\rule{6cm}{0.5pt} & \\[-0.1cm]
				(Chairman)~~~~\@refereeChief & \\[1.5cm]
				\includegraphics[width=0.35\textwidth]{\@refereeSecondsign} &
				\includegraphics[width=0.35\textwidth]{\@refereeThirdsign} \\[-0.5cm]
				\rule{6cm}{0.5pt}\hspace{1cm} &
				\rule{6cm}{0.5pt}\hspace{1cm} \\[-0.1cm]
				(Member)~~~~\@refereeSecond &
                (Member)~~~~\@refereeThird \\[1.5cm]
                \includegraphics[width=0.35\textwidth]{\@refereeFourthsign} &
                \includegraphics[width=0.35\textwidth]{\@refereeFifthsign} \\[-0.5cm]
                \rule{6cm}{0.5pt}\hspace{1cm} &
                \rule{6cm}{0.5pt}\hspace{1cm} \\[-0.1cm]
                (Member)~~~~\@refereeFourth &
                (Member)~~~~\@refereeFifth \\[1.5cm]
			\end{tabular}
			}
		\else
			\begin{center}
				\fontsize{10pt}{10}\selectfont{Approved by:\\[1.5cm]
				\begin{tabular}{c}
					\includegraphics[width=0.4\textwidth]{\@refereeChiefsign} \\[-0.5cm]
					\rule{8cm}{0.5pt}\\[-0.0cm]
					(Chairman)~~~~\@refereeChief\\[1.5cm]
					\includegraphics[width=0.4\textwidth]{\@refereeSecondsign} \\[-0.5cm]
					\rule{8cm}{0.5pt}\\[-0.0cm]
					(Member)~~~~\@refereeSecond\\[1.5cm]
					\includegraphics[width=0.4\textwidth]{\@refereeThirdsign} \\[-0.5cm]
					\rule{8cm}{0.5pt}\\[-0.0cm]
					(Member)~~~~\@refereeThird\\[1.5cm]
				\end{tabular}}
			\end{center}
		\fi
		\begin{center}
			\fontsize{12pt}{12}\selectfont{\approvalMonthEng~\@approvalDay, \@approvalYear}
		\end{center} \newpage
	\fi
}

%% 
%% 목차 Table of contents
%%
\newcommand{\makecontents}{		% TOC, LOT, LOF 생성
	\pagenumbering{roman}		% 로마자 페이지 시작
	\newcounter{prepage}
	\setcounter{prepage}{10}        % 마지막 페이지 번호를 저장
	\if@isKorean
		\renewcommand{\contentsname}{목~차}
		\renewcommand{\listfigurename}{그림~목차}
		\renewcommand{\listtablename}{표~목차}
	\fi
	\tableofcontents\newpage
	{\phantomsection
	\listoffigures
	\if@isKorean
	\addcontentsline{toc}{chapter}{그림목차}
	\else
	\addcontentsline{toc}{chapter}{List of Figures}
	\fi
	}\newpage
	{\phantomsection
	\listoftables
	\if@isKorean
	\addcontentsline{toc}{chapter}{표목차}
	\else
	\addcontentsline{toc}{chapter}{List of Tables}
	\fi
	}
	\newpage
}



%%
%% 초록 Abstract
%%
\renewenvironment{abstract}[2]{
	\phantomsection
	\if@isKorean
		\addcontentsline{toc}{chapter}{논문요약}
		\abstractkor
		#2
		\newpage
		\abstracteng
		#1
	\else
		\addcontentsline{toc}{chapter}{Abstract}
		\abstracteng
		#1
		\newpage
		\abstractkor
		#2
	\fi
}

\newcommand{\abstracteng}{
	\stepcounter{prepage}
	\begin{center}
		\fontsize{10pt}{10}\selectfont \@titleEng \\[1cm]
		\fontsize{10pt}{10}\selectfont{\@authorEng \\[1cm]
		\@affFullNameEng, The Graduate School,\\[0.1cm]
		Pukyong National University\\[1cm]}
		\fontsize{12pt}{12}\selectfont{\textbf{Abstract}}\\
	\end{center}
	\fontsize{10pt}{10}\selectfont
}
\newcommand{\abstractkor}{
	\stepcounter{prepage}
	\begin{center}
		\fontsize{10pt}{10}\selectfont{\@titleKor \\[1cm]
		\@authorKor \\[1cm] 부~~경~~대~~학~~교~~~~~대~~학~~원~~~~~\@affFullNameKor\\[1cm]
		\textbf{요~~~~약}}
	\end{center}
	\fontsize{8pt}{12}\selectfont
}



%%
%% 핵심 낱말 생성
%%
\newenvironment{Korkeyword}{\vspace*{3mm}
	\noindent \underline{\textbf{핵 심 낱 말}}}{}



%%
%% Keyword 생성
%%
\newenvironment{Engkeyword}{\vspace*{3mm}  
	\noindent\underline{\textbf{Keywords}}}
{\let\linebreak\@tempbreak          % \linebreak 명령 되돌리기
}



%%
%% Acknowledgement 사사 생성
%%i

\newcommand{\acknowledgement}[1][default]{%     % 사사
	\newcommand{\@acklang}{#1}
	\ifthenelse{\equal{\@acklang}{1}}
	{\chapter*{사 사} \if@PDFdoc\phantomsection\fi\addcontentsline{toc}{chapter}{사 사}}{}                 % 본문과 사사가 둘 다 한글일 때
	\ifthenelse{\equal{\@acklang}{2}}
	{\chapter*{영 문 사 사} \if@PDFdoc\phantomsection\fi\addcontentsline{toc}{chapter}{영 문 사 사}}{}         % 본문은 한글인데 사사가 영어일 때
	\ifthenelse{\equal{\@acklang}{3}}
	{\chapter*{Acknowledgement} \if@PDFdoc\phantomsection\fi\addcontentsline{toc}{chapter}{Acknowledgments}}{}        % 본문과 사사가 둘 다 영어일 때 
	\ifthenelse{\equal{\@acklang}{4}}
	{\chapter*{Acknowledgements in Korean} \if@PDFdoc\phantomsection\fi\addcontentsline{toc}{chapter}{Acknowledgments in Korean}}{}\noindent}         % 본문은 영어인데 사사가 한글일 때 

%%
%% 참고문헌 Bibliography
%%