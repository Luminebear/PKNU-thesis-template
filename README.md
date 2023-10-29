# PKNU-thesis-template (Unofficial)
Automated thesis template for Pukyong National University in LaTeX format

(Stable version (not automated): [main branch](https://github.com/Luminebear/PKNU-thesis-template/))

## Version and History
- ver20231029
	- Updated abstract environment to contain Korean and English abstract simultaneously
	- Corrected some missing points in the template

- ver20221215
	- Initially created automated thesis template utilizing LaTeX class
	- Forked on two repositories from KAIST and POSTECH

## Directory structure
```bash
.
├── back_of_book
│   ├── back_eng.pdf
│   ├── back_eng.synctex.gz
│   ├── back_eng.tex
│   ├── back.pdf
│   ├── back.synctex.gz
│   └── back.tex
├── dat
│   ├── 01.introduction.tex
│   ├── 02.background.tex
│   ├── 03.dataandmethod.tex
│   ├── 04.result.tex
│   ├── 05.conclusionanddiscussion.tex
│   ├── 06.appendix.tex
│   └── notice.tex
├── figure
├── history
├── pknu-thesis.cls
├── README.md
├── thesis.bib
├── thesis.pdf
└── thesis.tex
```

# 국문 설명
## 서문
본 양식은 LaTeX을 사용하여 학위논문을 작성하려는 부경대학교 일반대학원 이공영역 연구자를 위해 제작되었습니다.
학교에서는 아래아 한글 또는 MS 워드에 맞춤화된 작성법을 제시하고 있는 반면 LaTeX 맞춤화 표준 양식이 따로 없어 템플릿을 만들게 되었습니다. 
템플릿 제작에 있어 'Version and History' 의 학생연구원분들께서 작업을 위해 본인들의 학위논문 제출로 사용한 파일을 활용하였고,
이것이 본 템플릿의 기초적인 틀을 잡는데 도움이 되었습니다.
가능한 표준화된 문서로 완성하기 위해 기존 제공받은 파일을 바탕으로, 
[부경대학교 일반대학원 누리집](https://graduate.pknu.ac.kr/main)의 공지사항의 '학위청구논문 작성법'을 참고하여 제작 하였습니다.
최대한 해당 매뉴얼에서 요구하는 양식에 맞게 꾸려지도록 작업 하였으며,
한국어와 영어 모두 지원하도록 만들었습니다.
기본적으로 예제파일에서 대부분 사용하는 패키지를 불러오도록 되어 있으나,
논문 작성에 있어 상황에 따라 적절히 다른 LaTeX의 유용한 패키지를 불러와서 자유롭게 사용하시면 됩니다. 
학위과정을 마치시는 사용자분께 진심으로 축하의 말씀을 드리며, 앞으로의 삶에서 꽃길만 걸을 수 있길 기원합니다.

현재 이 양식은 보다 양식의 손쉬운 사용을 위해, KAIST와 POSTECH에서 사용중인 LaTeX양식을 포크하여 부경대학교 상황에 맞게 수정중에 있습니다.
두 학교에서 사용하는 양식의 원본은 아래의 Repository에서 확인할 수 있습니다.
- [KAIST LaTeX Repository](https://github.com/0xdkay/kaist-thesis-template)
- [POSTECH LaTeX Repository](https://github.com/lonelywing/POSTECH_thesis_template_latex)

## 사용방법
### System requirements
- TeX Live (not tested on MikTeX) or Overleaf
- ko.TeX

### 공통
- 예제파일명: thesis.tex, 인쇄된 파일: thesis.pdf
- 참고문헌 파일: thesis.bib (BibLaTeX 활용)
- documentclass: pknu-thesis
	- PKNU-thesis는 네가지 옵션을 제공합니다. 상황에 맞추어 옵션을 지정해주세요.
		- doctor: 박사과정 | master: 석사과정
		- korean: 한글논문 | english: 영문논문
		- final: 최종판    | draft: 시험판
		- pdfdoc : 선택하지 않으면 북마크와 colorlink를 만들지 않습니다.
- 기본 용지포맷은 A4으로 설정되어 있으며, 인쇄시 4.6배판(190mm X 260mm) 이용하세요. (현재는 pknu-thesis.cls에서 직접수정해야함.)
- 겉표지, 속표지, 인준서, 목차는 pknu-thesis.cls에 정의되어 있습니다.
- 초록(논문요약)은 작성하는 언어에 따라 순서가 달리 배치되며, 내용작성은 언어 관계조이 영문, 국문 순으로 작성해야 합니다. (아래 자세히보기 참조)
- 이 양식에서 command 'document'를 아래와 같이 불러와야 합니다.
<details>
<summary>자세히 보기</summary>

```latex
\begin{document}
	\makecontents
	\begin{abstract}
        {
			%% 여기에 영문 초록 입력
		}
        {
			%% 여기에 국문 초록 입력
		}
    \end{abstract}

	\input{./dat/01.introduction}
	\input{./dat/02.background}
	\input{./dat/03.dataandmethod}
	\input{./dat/04.result}
	\input{./dat/05.conclusionanddiscussion}
	\input{./dat/06.appendix}
\end{document}
```
</details>

### 국문논문 작성시
- documentclass: 옵션으로 korean 설정해주세요.
- 논문 요약은 한국어, 영어순으로 배치됩니다.
- backcover는 back.tex을 이용하여 따로 인쇄하여 사용하세요.
  
### 영문논문 작성시
- command: 옵션으로 english 설정해주세요.
- 논문 요약은 영어, 한국어순으로 배치됩니다.
- backcover는 back_eng.tex을 이용하여 따로 인항하여 사용하세요.

## 양식 사용시 주의사항
- 이 양식은 학교에서 제공하는 매뉴얼대로 최대한 맞추고자 하였으나, 실제 규격과 다를 수 있습니다.
**이에 따르는 책임은 양식을 사용하시는 본인에게 있습니다.** 논문 제출전 검토하시길 바랍니다.



# in English
## Introduction
This template is designed for Pukyong Nationa항 University Graduate School researchers who want to write a thesis in LaTeX. 
In the university, they only suggest a regularized writing method / example document in HWP or MS WORD. 
I quite felt to make a standard and optimized format in LaTeX since most scientist use it for submitting their papers.
To create the template, I referred the existing files used by student researchers who were finished submitting their thesis and it was very helpful for standarization. (See 'Version and History' heading) 
Based on the provided file, I refered the 'Writing a disseration for a degree' on the notice in PKNU Graduate school website.
I tried to construct the template fit on their requirements as much as possible. 

This document supports both Korean and English writing. 
The example file calls popular LaTeX packages in general, you are free to add other useful pacakges for your dissertation. 
Lastly, I sincerely congratulate users who are completing their degree course, and I cross your fingers in future studies. Good Luck!

## Usage
- example main file name: thesis.tex, printed file: thesis.pdf
- biblography file name: thesis.bib (use BibLaTeX)
- documentclass: pknu-thesis
	- PKNU-thesis class provides four options.
		- doctor | master
		- korean | english 
		- final  | draft
		- pdfdoc : Generate bookmark and colorlink if enabled.
- A4 is prepared for a default document format, set 190mm X 260mm if you need for printing. (But in the guideline, you don't need to set the special size for writing a thesis on a computer.)
- The English abstract is printed first, followed by the Korean abstract.
Example:
<details>
<summary>See more</summary>

```latex
\begin{document}
	\makecontents
	\begin{abstract}
        {
			%% Type your English abstract here.
		}
        {
			%% Type your Korean abstract here.
		}
    \end{abstract}

	\input{./dat/01.introduction}
	\input{./dat/02.background}
	\input{./dat/03.dataandmethod}
	\input{./dat/04.result}
	\input{./dat/05.conclusionanddiscussion}
	\input{./dat/06.appendix}
\end{document}
```

</details>
- Use 'back_end.tex' if you need to print a backcover.

## Notice for using the template
This template was made for matching the manual provided by the school as closely as possible, but it may differ from the actual results. 
Please review your thesis before submitting. **No responsibility can be taken for the use of this thesis template.**
