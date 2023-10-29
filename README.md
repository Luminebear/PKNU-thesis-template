# PKNU-thesis-template (Unofficial)
Thesis template of Pukyong National University in LaTeX format

(This template will be deprecated after an automated thesis template for PKNU is officially released.
If you look up the updates or download unstable template, see [here](https://github.com/Luminebear/PKNU-thesis-template/tree/new_automatic_format).)

## Version and History
- ver20221219

- Initially created, unknown
  - Hyun Jung Yoon in Biophysics Lab (supervisor. S. Wu)
- Applicated and provided, Fall 2018
  - Minjae Kim and Gyuho Bae in Statphys Lab (supervisor. S.K. Baek)
- Functionally enhanced, Fall 2021 
  - Jonghoon Kim in Statphys Lab (supervisor. S.K. Baek)
- Reproduced as a template, 12/15/2022
  - Yong Kwon in QCS Lab (supervisor. B.S. Choi)
  
## Directory structure
```bash
.
│  thesis.bib
│  thesis.pdf
│  thesis.synctex.gz
│  thesis.tex
│  thesis_ver20221215.pdf
│  thesis_ver20221215.svg
│
├─back_of_book
│      back.pdf
│      back.synctex.gz
│      back.tex
│      back_eng.pdf
│      back_eng.synctex.gz
│      back_eng.tex
│
├─dat
│      00.cover_eng.tex
│      00.cover_kor.tex
│      01.inside_cover_eng.tex
│      01.inside_cover_kor.tex
│      02.approval_statement_eng.tex
│      02.approval_statement_kor.tex
│      03.contents.tex
│      04.abstract.tex
│      05.introduction.tex
│      06.data&method.tex
│      07.result.tex
│      08.conclusion&discussion.tex
│      09.appendix.tex
│      10.reference.tex
│
├─figure
└─history
```

# 국문 설명
## 서문
본 양식은 LaTeX을 사용하여 학위논문을 작성하려는
부경대학교 일반대학원 이공영역 연구자를 위해 제작되었습니다.
학교에서는 아래아 한글 또는 MS 워드에 맞춤화된 작성법을 제시하고 있는 반면
LaTeX 맞춤화 표준 양식이 따로 없어 템플릿을 만들게 되었습니다. 
템플릿 제작에 있어 'Version and History' 의 학생연구원분들께서 작업을 위해 
본인들의 학위논문 제출로 사용한 파일을 활용하였고,
이것이 본 템플릿의 기초적인 틀을 잡는데 도움이 되었습니다.
가능한 표준화된 문서로 완성하기 위해 기존 제공받은 파일을 바탕으로, 
[부경대학교 일반대학원 누리집](https://graduate.pknu.ac.kr/main)의 공지사항의
'학위청구논문 작성법'을 참고하여 제작 하였습니다.
최대한 해당 매뉴얼에서 요구하는 양식에 맞게 꾸려지도록 작업 하였으며,
한국어와 영어 모두 지원하도록 만들었습니다.
기본적으로 예제파일에서 대부분 사용하는 패키지를 불러오도록 되어 있으나,
논문 작성에 있어 상황에 따라 적절히 다른 LaTeX의 유용한 패키지를 불러와서 
자유롭게 사용하시면 됩니다. 
학위과정을 마치시는 사용자분께 진심으로 축하의 말씀을 드리며, 
앞으로의 삶에서 꽃길만 걸을 수 있길 기원합니다.

## 사용방법
### System requirements
- TeX Live (not tested on MikTeX) or Overleaf
- ko.TeX

### 공통
- 예제파일명: thesis.tex, 인쇄된 파일: thesis.pdf
- 참고문헌 파일: thesis.bib (BibTeX 활용)
- documentclass: report, 12pt
- chapter, section, subsection 명령어 대신 hchapter, hsection, hsubsection을 사용하면 PDF에서 링크연결 됩니다.
- 기본 용지포맷은 A4으로 설정되어 있으며, 인쇄시 4.6배판(190mm X 260mm) 이용하세요.
- 이 양식은 학교에서 제공하는 매뉴얼대로 최대한 맞추고자 하였으나, 실제 규격과 다를 수 있습니다.
**이에 따르는 책임은 양식을 사용하시는 본인에게 있습니다.** 논문 제출전 검토하시길 바랍니다.

### 국문논문 작성시
- command: usepackage{kotex} 에서 **옵션으로 hangul 추가**해주세요.
- environment: document 에서 겉표지부터 초록까지 다음을 불러와야 합니다.
  - '00.cover_kor', '01.inside_cover_kor', '02.approval_statement_kor'
- 이 양식에서 command 'document'를 아래와 같이 불러와야 합니다.
<details>
<summary>자세히 보기</summary>

```latex
\begin{document}
	\input{./dat/00.cover_kor}
	\input{./dat/01.inside_cover_kor}
	\input{./dat/02.approval_statement_kor}
	\input{./dat/03.contents}
	\input{./dat/04.abstract}
	\input{./dat/05.introduction}
	\input{./dat/06.data&method}
	\input{./dat/07.result}
	\input{./dat/08.conclusion&discussion}
	\input{./dat/09.appendix}
	\input{./dat/10.reference}
\end{document}
```

</details>

- 논문 요약 순서가 따로 지정되어 있지 않으므로 04.abstract.tex 파일 수정해야 합니다.
- backcover는 back.tex을 이용하여 따로 인쇄하여 사용하세요.
  
### 영문논문 작성시
- command: usepackage{kotex} **만** 불러오세요.
- environment: document 에서 겉표지부터 초록까지 다음을 불러와야 합니다.
  - '00.cover_eng', '01.inside_cover_eng', '02.approval_statement_eng'
- 이 양식에서 command 'document'를 아래와 같이 불러와야 합니다.
<details>
<summary>자세히 보기</summary>

```latex
\begin{document}
	\input{./dat/00.cover_eng}
	\input{./dat/01.inside_cover_eng}
	\input{./dat/02.approval_statement_eng}
	\input{./dat/03.contents}
	\input{./dat/04.abstract}
	\input{./dat/05.introduction}
	\input{./dat/06.data&method}
	\input{./dat/07.result}
	\input{./dat/08.conclusion&discussion}
	\input{./dat/09.appendix}
	\input{./dat/10.reference}
\end{document}
```

</details>

- 논문 요약 순서가 따로 지정되어 있지 않으므로 04.abstract.tex 파일 수정해야 합니다.
- backcover는 back_eng.tex을 이용하여 따로 인쇄하여 사용하세요.



# in English
## Introduction
This template is designed for Pukyong National University Graduate School researchers who want to write a thesis in LaTeX. 
In the university, they only suggest a regularized writing method / example document in HWP or MS WORD. 
I quite felt to make a standard and optimized format in LaTeX since most scientist use it for submitting their papers.
To create the template, I referred the existing files used by student researchers 
who were finished submitting their thesis and it was very helpful for standarization. (See 'Version and History' heading) 
Based on the provided file, I refered the 'Writing a disseration for a degree' on the notice in PKNU Graduate school website.
I tried to construct the template fit on their requirements as much as possible. 

This document supports both Korean and English writing. 
The example file calls popular LaTeX packages in general, 
you are free to add other useful pacakges for your dissertation. 
Lastly, I sincerely congratulate users who are completing their degree course, 
and I cross your fingers in future studies. Good Luck!

## Usage
- example main file name: thesis.tex, printed file: thesis.pdf
- biblography file name: thesis.bib (use BibTeX)
- documentclass: report, 12pt
- You can use 'hchapter, hsection, hsubsection' commands for hyperlink in a document insead of 'chapter, section, subsection'.
- A4 is prepared for a default document format, set 190mm X 260mm if you need for printing. (But in the guideline, you don't need to set the special size for writing a thesis on a computer.)
- Call usepackage{kotex} for Korean abstract. Do not include option 'hangul' in square bracket '[]'
- You must import the files '00.cover_eng', '01.inside_cover_eng', '02.approval_statement_eng' in a document environment from a cover to abstract. 
Example:
<details>
<summary>See more</summary>

```latex
\begin{document}
	\input{./dat/00.cover_eng}
	\input{./dat/01.inside_cover_eng}
	\input{./dat/02.approval_statement_eng}
	\input{./dat/03.contents}
	\input{./dat/04.abstract}
	\input{./dat/05.introduction}
	\input{./dat/06.data&method}
	\input{./dat/07.result}
	\input{./dat/08.conclusion&discussion}
	\input{./dat/09.appendix}
	\input{./dat/10.reference}
\end{document}
```

</details>

- The English abstract is printed first, followed by the Korean abstract.
- Use 'back_end.tex' if you need to print a backcover.

This template was made for matching the manual provided by the school as closely as possible, but it may differ from the actual results. 
Please review your thesis before submitting. **No responsibility can be taken for the use of this thesis template.**
