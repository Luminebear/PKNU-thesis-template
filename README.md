# PKNU-thesis-template (Unofficial)
Automated thesis template for Pukyong National University in LaTeX format

(Previous version (not automated): [v1](https://github.com/Luminebear/PKNU-thesis-template/tree/V1))

## Version and History
- ver2.1
	- Fixed word spacing and line spacing were different in English and PhD option.
	- Fixed an issue which inserting extra space before comma in an inner cover and abstract page in Engish option.
	- Updated more detailed explanation in pknu-thesis.cls.
	- Optimized the Korean input-related code in the source code of pknu-sis.cls.

- ver2.0
	- Official release version of automated thesis template
	- Added more detailed explanation for usage in thesis.tex.
	- Support a few Engineering departments.
	- Edited acknowledgment command concisely. Now you just choose options 1 or 2 which your acknowedgement is written in English or Korean.

- ver20231130
	- Added command `refsign` to fill a signature of referees in an approval statement
	- Optimized the layout of an approval statement in English.
	- Added the signature of Erwin Schrodinger's as an example one.

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
LaTeX 사용자를 위한 학위논문 템플릿은 기존 기틀을 마련해준 학생연구원분들께서 (V1 브랜치의 'Version and History' 참조) 본인의 학위논문 제출을 위해 만든 파일을 활용한 것을 시작으로 본 템플릿의 기초적인 틀을 잡는데 도움이 되었으며,
양식 수정의 간소화와 손쉬운 사용을 위해 만들어진 자동화 템플릿(V2)은 KAIST와 POSTECH에서 사용중인 LaTeX양식을 포크하여 부경대학교 상황에 맞추어 제작되고 있습니다.
두 학교에서 사용하는 양식의 원본은 아래의 Repository에서 확인할 수 있습니다.
- [KAIST LaTeX Repository](https://github.com/0xdkay/kaist-thesis-template)
- [POSTECH LaTeX Repository](https://github.com/lonelywing/POSTECH_thesis_template_latex)

이 양식은 가능한 표준화된 문서로 완성하기 위해, 
[부경대학교 일반대학원 누리집](https://graduate.pknu.ac.kr/main)의 공지사항의 '학위청구논문 작성법'을 참고하여 제작 하였습니다.
최대한 해당 매뉴얼에서 요구하는 양식에 맞게 꾸려지도록 작업이 되어있으며, 한국어와 영어 모두 지원하도록 만들었습니다.
기본적으로 예제파일에서 대부분 사용하는 패키지를 불러오도록 되어 있으나, 논문 작성에 있어 상황에 따라 적절히 다른 LaTeX의 유용한 패키지를 불러와서 자유롭게 사용하시면 됩니다. 
학위과정을 마치시는 사용자분께 진심으로 축하의 말씀을 드리며, 앞으로의 삶에서 꽃길만 걸을 수 있길 기원합니다.

## 사용방법
### 시스템 요구사항
- TeX Live (not tested on MikTeX) or Overleaf
- ko.TeX

### 공통
- 예제파일명: `thesis.tex`, 인쇄된 파일: `thesis.pdf`
- 참고문헌 파일: `thesis.bib` (BibLaTeX 활용)
- 본문 파일: `dat` 폴더
- 그림 파일: `figure` 폴더
- 인쇄논문 사이드 커버: `back_of_book` 폴더

### 작성순서
작성과 관련한 설명은 `thesis.tex`을 참조해주세요.
#### PREAMBLE
1. DOCUMENT CLASS
2. USEPACKAGE
3. TITLE OF THESIS 논문제목
4. AUTHOR 저자명
5. ADVISOR 지도교수
6. DEPARTMENT 학과명
7. STUDENT ID 학번
8. REFREE 심사위원
9. SIGNATURE OF REFREES 심사위원 서명
10. APPROVAL DATE 학위논문 승인일
11. REFREE DATE 심사위원 논문심사일
12. BIBLIOGRAPHY 참고문헌
#### BEGINNING OF THE DOCUMENT
1. Main Cover, Inner Cover, Approval of Statement 앞표지, 속표지, 학위논문 인준서
2. Table of Contents, List of Figures, List of Tables 목차, 그림목차, 표목차
3. ABSTRACT 논문요약
4. Main Body 본문
5. BIBLIOGRAPHY 참고문헌
6. ACKNOWLEDGEMENT 감사의 글

## 참고사항
### 공통
- 기본 용지포맷은 A4으로 설정되어 있으며, 인쇄시 4.6배판(190mm X 260mm) 이용하세요. (현재는 pknu-thesis.cls에서 직접수정해야함.)
- 인준서의 경우 기본적으로 사인(영문), 인감(국문)을 기입을 요구합니다.
- 초록(논문요약)은 작성하는 언어에 따라 순서가 달리 배치되며, 내용작성은 언어 관계없이 영문, 국문 순으로 작성해야 합니다.

### 국문논문 작성시
- documentclass: 옵션으로 korean 설정해주세요.
- 논문 요약은 한국어, 영어순으로 배치됩니다.
- backcover는 back.tex을 이용하여 따로 인쇄하여 사용하세요.
  
### 영문논문 작성시
- command: 옵션으로 english 설정해주세요.
- 논문 요약은 영어, 한국어순으로 배치됩니다.
- backcover는 back_eng.tex을 이용하여 따로 인쇄하여 사용하세요.

## 양식 사용시 주의사항
- 이 양식은 학교에서 제공하는 매뉴얼대로 최대한 맞추고자 하였으나, 실제 규격과 다를 수 있습니다.
**이에 따르는 책임은 양식을 사용하시는 본인에게 있습니다.** 논문 제출전 검토하시길 바랍니다.



# in English
## Introduction
This template is designed for Pukyong National University Graduate School researchers who want to write their thesis in LaTeX.
In the university, they only suggest a regularized writing method / example document in HWP or MS WORD. 
I quite felt to make a standard and optimized format in LaTeX since most scientist use it for submitting their papers.
To create the template, I referred the existing files used by student researchers who were finished submitting their thesis and it was very helpful for standarization. (See 'Version and History' heading in V1 branch)
The advanced version (V2), which supports automation for convinient usage and simplification, have produced and updated refereced by the template of KAIST and POSTECH.
The original template used by both universities can be found in the repositories below.
- [KAIST LaTeX Repository](https://github.com/0xdkay/kaist-thesis-template)
- [POSTECH LaTeX Repository](https://github.com/lonelywing/POSTECH_thesis_template_latex)

To make a complete and standardized document,
I refered the 'Writing a disseration for a degree' on the notice in PKNU Graduate school website.
I tried to construct the template fit on their requirements as much as possible, and this document supports both Korean and English writing. 
The example file calls popular LaTeX packages in general, you are free to add other useful pacakges for your dissertation. 
Lastly, I sincerely congratulate users who are completing their degree course, and I'll keep my fingers crossed in future studies. Good Luck!

## Usage
### System Requirements
- TeX Live (not tested on MikTeX) or Overleaf
- ko.TeX

### General
- example main file name: `thesis.tex`, printed file: `thesis.pdf`
- bibliography file name: `thesis.bib` (use BibLaTeX)
- files for main bodies: in `dat` folder
- files for figures: in `figure` folder
- side covers for printed thesis: in `back_of_book` folder

### Guide for Writing
See `thesis.tex` for more detailed information for each item.
#### PREAMBLE
1. DOCUMENT CLASS
2. USEPACKAGE
3. TITLE OF THESIS
4. AUTHOR
5. ADVISOR
6. DEPARTMENT
7. STUDENT ID
8. REFREE
9. SIGNATURE OF REFREES
10. APPROVAL DATE
11. REFREE DATE
12. BIBLIOGRAPHY
#### BEGINNING OF THE DOCUMENT
1. Main Cover, Inner Cover, Approval of Statement
2. Table of Contents, List of Figures, List of Tables
3. ABSTRACT
4. Main Body
5. BIBLIOGRAPHY
6. ACKNOWLEDGEMENT

### Note
- A4 is prepared for a default document format, set 190mm X 260mm if you need for printing. (But in the guideline, you don't need to set the special size for writing a thesis on a computer.)
- The approval statement basically requires to fill signatures (in English).
- The English abstract is printed first, followed by the Korean abstract.
- Use 'back_end.tex' if you need to print a backcover.

## Notice for using the template
This template was made for matching the manual provided by the school as closely as possible, but it may differ from the actual results. 
Please review your thesis before submitting. **No responsibility can be taken for the use of this thesis template.**
