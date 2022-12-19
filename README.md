# PKNU-thesis-template (Unofficial)
Thesis template of Pukyong National University in LaTeX format

## 버전및 문서역사
- ver20221219

- 최초 작성, 날짜 알 수 없음
  - 부경대학교 물리학과 생물물리학연구실 윤현정
- 포맷 적용 및 제공, 날짜 2018 가을학기
  - 부경대학교 물리학과 통계물리학연구실 김민재, 배규호
- 기능 및 환경 개선, 날짜 2021 가을학기
  - 부경대학교 물리학과 통계물리학연구실 김종훈
- Template 제작, 날짜 2022 12 15
  - 부경대학교 물리학과 양자계산과학연구실 권용

## 파일구조
```powershell
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
│      00.cover.aux
│      00.cover_eng.tex
│      00.cover_kor.tex
│      01.inside_cover.aux
│      01.inside_cover_eng.tex
│      01.inside_cover_kor.tex
│      02.approval_statement.aux
│      02.approval_statement_eng.tex
│      02.approval_statement_kor.tex
│      03.contents.aux
│      03.contents.tex
│      04.abstract.aux
│      04.abstract.tex
│      05.introduction.aux
│      05.introduction.tex
│      06.data&method.aux
│      06.data&method.tex
│      07.result.aux
│      07.result.tex
│      08.conclusion&discussion.aux
│      08.conclusion&discussion.tex
│      09.appendix.aux
│      09.appendix.tex
│      10.reference.aux
│      10.reference.tex
│
├─figure
└─history
```

## 서문
본 양식은 LaTeX을 사용하여 학위논문을 작성하려는
부경대학교 일반대학원 이공영역 연구자를 위해 제작되었습니다.
학교에서는 아래아 한글 또는 MS 워드에 맞춤화된 작성법을 제시하고 있는 반면
LaTeX 맞춤화 표준 양식이 따로 없어 템플릿을 만들게 되었습니다. 
해당양식은 위문단의 학생연구원분들께서 템플릿 작업을 위해 기초적인 틀을 만들어 주었습니다.
몇 단계 개선을 거쳐, 본 양식의 표준화를 위해 '학위청구논문 작성법'을 참고하여 제작하였습니다.
([부경대학교 일반대학원 누리집](https://graduate.pknu.ac.kr/main)의 공지사항 참조)
최대한 해당 매뉴얼에서 요구하는 양식에 맞게 꾸리도록 작업 하였으며,
한국어와 영어 모두 지원하도록 만들었습니다.
상황에 따라 적절히 다른 LaTeX의 유용한 패키지를 불러와서 자유롭게 사용하시면 됩니다. 
학위과정을 마치시는 사용자분께 진심으로 축하의 말씀을 드리며, 
앞으로의 삶에서 꽃길만 걸을 수 있길 기원합니다.

## 사용방법
### System requirements
- TeX Live (not tested on MikTeX) or Overleaf
- ko.TeX

### 공통
- 예제파일명: thesis.tex
- BibTeX: thesis.bib
- documentclass: report, 12pt
- chapter, section, subsection 명령어 대신 hchapter, hsection, hsubsection을 사용하면 PDF에서 링크연결 됩니다.
- 기본 용지포맷은 A4으로 설정되어 있으며, 인쇄시 4.6배판(190mm X 260mm) 이용하세요.
- 이 양식은 학교에서 제공하는 매뉴얼대로 최대한 맞추고자 하였으나, 실제 사이즈는 다를 수 있습니다.
이에 따르는 책임은 양식을 사용하시는 본인에게 있습니다. 논문 제출전 검토하시길 바랍니다.



### 국문논문 작성시
- command usepackage{kotex} 에서 옵션으로 hangul 추가해주세요.
- environment document 에서 겉표지부터 초록까지 다음을 불러와야 합니다.
  - '00.cover_kor', '01.inside_cover_kor', '02.approval_statement_kor'
- backcover는 back.tex을 이용하여 따로 인쇄하여 사용하세요.
  
### 영문논문 작성시
- command usepackage{kotex} 만 불러오세요.
- environment document 에서 겉표지부터 초록까지 다음을 불러와야 합니다.
  - '00.cover_eng', '01.inside_cover_eng', '02.approval_statement_eng'
- backcover는 back_eng.tex을 이용하여 따로 인쇄하여 사용하세요.
