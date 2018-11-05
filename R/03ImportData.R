#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
# Lecture : Import Data in R
#
# Date : October 8th, 2018
# Author : Chanjun Kim
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#


# 1. .txt file   ----

# 1.1 seperator : one blank ----
# data <- read.table(file   = "directory/filename.txt",
#                    header = TRUE,
#                    sep    = " ")
blank <- read.table(file   = "C:/R/Bigdata/blank.txt",
                    header = TRUE,
                    sep    = " ")
View(blank)
blank

# 1.2 seperator : comma ----
comma <- read.table(file   = "C:/R/Bigdata/comma.txt",
                    header = TRUE,
                    sep    = ",")
View(comma)
comma
table(comma$food)


# 1.3 seperator : tab ----
tab <- read.table(file   = "C:/R/Bigdata/tab.txt",
                  header = TRUE,
                  sep    = "\t")
View(tab)
tab



# 2. .csv file ----
# Comma Seperated Value
# 엑셀의 특수 형태
# data <- read.csv(file = "directory/filename.csv"
#                  header = TRUE)
company <- read.csv(file = "C:/R/Bigdata/company.csv",
                    header = TRUE)
company

# 3. .xls file  ----
# 기본 기능에서 못 읽음
# 추가 기능=Package=Library 설치하고 로딩하면 됨
# "readxl" : 해들림 위컴 package 가 대표적 

# 3.1 패키지 설치하기
# 패키지 설치는 동일 컴퓨터에서 한번만 실행
# 단 패키지가 업데이트 되면 재설치
# install.packages("packagesName")
install.packages("readxl")


# 3.2 패키지 로딩하기
# RStudio 를 실행할때마다 필요 시 명령어 실행
# library(packageName)    > 큰따옴표 없음
# Imputation : 대체 
library(readxl)

# NA : Nat Available = Missing Value = 결측치, 결측값
# data <- readxl::read_excel(path = "directory/fileName.xls",
#                            sheet = "sheetName" or sheetIdex,
#                            col_names = TRUE)
# 패키지 안의 function name 이 겹칠수 있으므로 package::function 식으로 쓰는 것이 명시적임
reading <- readxl::read_excel(path = "C:/R/Bigdata/reading.xlsx",
                              sheet = 1,
                              col_names = TRUE)
reading


reading2 <- readxl::read_excel(path = "C:/R/Bigdata/reading.xlsx",
                              sheet = "data",
                              col_names = TRUE)
reading2


# 작업공간(Working Directory)
# 1. 현재 설정된 작업공간 알아내기 : getwd()
getwd()
# 2. 새롭게 작업공간 설정하기 : setwd("directory")
setwd("C:/R/Bigdata/")

reading3 <- readxl::read_excel(path = "reading.xlsx",
                               sheet = "data",
                               col_names = TRUE)
reading3



# 4. DataBase





# 인터넷이 안되는 경우 패키지 설치
# 1단계 : 인터넷이 되는 컴퓨터로 감
# 2단계 : USB나 외장 하드에 해당 패키지 다운로드
# 3단계 : 보안검사를 통과한 후에 해당 컴퓨터로 복사
# 4단계 : 설치
# 5단계 : install.pakages("directory/fileName", repos = NULL)
# repos : 서버의 위치, 서버의 주소
install.packages("C:/R/Bigdata/antiword_1.1.zip", repos = NULL)
library(antiword)








