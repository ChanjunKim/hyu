#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
# Lecture : Data Handling = Data Pre-processing
#           Data Wrangling
# Date : October 8th, 2018
# Author : Chanjun Kim
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#


# 패키지 설치, 로딩
# ggplot2(grammar graphic) : 시각화의 대표적 패키지
# 예제 데이터 : ggplot2::diamonds
install.packages("ggplot2")
library(ggplot2)
# DT
install.packages("DT")
library(DT)


install.packages("dplyr")
library(dplyr)

install.packages("writexl")
library(writexl)

# 작업공간
setwd("C:/R/Bigdata/")


# 데이터 읽어오기
# ggplot2::diamonds

# 1. 데이터 전체 보기 ----
# 1.1 data   ----
# 콘솔에 출력
# 데이터가 적을 때 사용
diamonds


# 1.2 View(data)   ----
# editor window 에 출력
# 데이터가 많을 때 사용
View(diamonds)


# 1.3 DT::datatable(data) ----
# web 형태로 출력
DT::datatable(diamonds) 


# 2. 데이터의 일부 보기 ----
# 2.1 head(data, n = 6) : default = 6   ----
# 외부 데이터를 읽어왔을 때 확인하기 위하여
# 콘솔에 출력
head(diamonds)
head(diamonds, n = 10)

# 2.2 tail(data, n = 6)   ----
# 콘솔에 출력
tail(diamonds)
tail(diamonds, n = 10)


# 2.3 View(head or tail(data, n = 6)) ----
View(head(diamonds))
View(tail(diamonds))


# 2.4 DT::datatable(head(data)) ----
DT::datatable(head(diamonds))
DT::datatable((diamonds))


# 3. 데이터의 구조(Structure) 보기 ----
# str(data)
str(diamonds)

# 코드표 : data 이름 > 변수 이름 > 변수 특성 > 변수 범위 등을 정리해놓은 것


# 4. 데이터의 입력오류 체크
# summary(data)
summary(diamonds)

id <- 1:5
address <- c("고양시", "강남구", "용산구", "강서구", "경주")
dwell <- c(26, 20, 3, 1, 3)

home <- data.frame(id, address, dwell, stringsAsFactors = FALSE)
home
str(home)
summary(home)
home$address <- as.factor(home$address)



# 5. Data.Frame 의 속성   ----
# 5.1 행의 갯수 : nrow(data) ----
# 결과 : vector
nrow(diamonds)

# 5.2 열의 갯수(변수의 갯수) : ncol(data)   ----
# 결과 : vector
ncol(diamonds)

# 5.3 행의 이름 : rownames(data)   ----
# 결과 : vector
rownames(diamonds)

# 5.4 열 = 변수의 이름 : colnames(data)   ----
colnames(diamonds)

# 5.5 차원(Dimension) : dim(data)   ----
dim(diamonds)
dim(diamonds)[1]
dim(diamonds)[2]
length(diamonds)


# 5.6 차원의 이름 : dimnames(data)    ----
# 결과 : list
dimnames(diamonds)
dimnames(diamonds)[1]   
dimnames(diamonds)[[1]]
dimnames(diamonds)[2]   
dimnames(diamonds)[[2]]



# 6. Data's Slicing   ----
# data[rowIndex, colIndex]

# 6.1 열 = 변수    ----
# data[ , colIndex]
# 6.1.1 열 = 변수의 위치를 알 때
diamonds[ , 1]
diamonds[ , 2]

# 문제 1
# 1, 9, 10 번째 열을 한 번에 가져오세요
diamonds[ , c(1, 9, 10)]

# 문제 2
# 4~8 번째
diamonds[, 4:8]

# 문제 3
# 홀수 번째
diamonds[ , seq(from = 1, to = ncol(diamonds), by = 2)]


# 6.1.2 열의 이름을 알때
diamonds[ , "carat"]
diamonds[ , 'cut']

diamonds[ , c("x", "y", "z")]



# 6.1.3 열 = 변수 이름에 규칙(패턴)이 있을 때 
# grep(pattern, textData, value = TRUE or FALSE)
# grep : general regular expression
# [0-9] : 모든 숫자
# [a-Z] : 모든 대소문자의 알파벳
# grep("^[x-z]$", colnames(diamonds), value = TRUE)
# t 또는 a를 포함하는 변수명?
# "[t|a]"
# t 또는 a로 시작하는 변수명?
# "^[t|a]"
# t 또는 a로 끝나는 병수명
# "[t|a]$"

colnames(diamonds)

# 6.1.3.1 변수명 중에서 t라는 글자를 포함하는 변수명은?
# carat, cut, clarity, depth, table
# 1, 2, 4, 5, 6
grep("t", colnames(diamonds), value = TRUE)    # 변수명
grep("t", colnames(diamonds), value = FALSE)    # 변수의 위치
diamonds[, grep("t", colnames(diamonds), value = TRUE)]
diamonds[, grep("t", colnames(diamonds), value = FALSE)]


# 6.1.3.2 변수명 중에서 t라는 글자로 시작하는 변수명은?
# table : 6
grep("^t", colnames(diamonds), value = TRUE)    # 변수명
grep("^t", colnames(diamonds), value = FALSE)    # 변수의 위치
diamonds[, grep("^t", colnames(diamonds), value = TRUE)]
diamonds[, grep("^t", colnames(diamonds), value = FALSE)]


# 6.1.3.3 변수명 중에서 t라는 글자로 끝나는 변수명은?
# carat, cut : 1, 2
grep("t$", colnames(diamonds), value = TRUE)    # 변수명
grep("t$", colnames(diamonds), value = FALSE)    # 변수의 위치
diamonds[, grep("t$", colnames(diamonds), value = TRUE)]
diamonds[, grep("t$", colnames(diamonds), value = FALSE)]


# 6.1.4 dplyr::select(data, variable1, variable2, ....)
dplyr::select(diamonds, cut)
dplyr::select(diamonds, cut, color)
dplyr::select(diamonds, price:z)
colnames(diamonds)
dplyr::select(diamonds, -(price:z))
dplyr::select(diamonds, starts_with("t"))
dplyr::select(diamonds, ends_with("t"))
dplyr::select(diamonds, contains("t"))


# 6.2 행  ----
# data[rowIndex, ]

# 6.2.1 행의 위치를 알 때
diamonds[1, ]
diamonds[c(1, 9, 10), ]
diamonds[4:8, ]
diamonds[seq(from = 1, to = nrow(diamonds), by = 100), ]


# 6.2.2 조건을 만족하는 경우
# 6.2.2.1 cut이 "Ideal" 인 데이터
diamonds[diamonds$cut == "Ideal" , ]
# cut 에 Ideal에 53940 개의 recycle 후 비교 연산

# 6.2.2.2 price 가 18000  이상인 데이터
diamonds[diamonds$price >= 18000 , ]


# 6.2.2.3 cut == ideal & price >= 18000 이상인 데이터
diamonds[(diamonds$cut == "Ideal") & (diamonds$price >= 18000) , ]


# 6.2.2.4 cut == ideal | price >= 18000 이상인 데이터
diamonds[(diamonds$cut == "Ideal") | (diamonds$price >= 18000) , ]


# 문제 5
# CUT 이 Ideal 이거나 또는 Good
diamonds[diamonds$cut == "Ideal" | "Good", ]   # 안됨

diamonds[(diamonds$cut == "Ideal") | (diamonds$cut == "Good"), ]

diamonds[diamonds$cut == c("Ideal", "Good"), ]  # Recyling rule 때문에 주의!
diamonds[diamonds$cut %in% c("Ideal", "Good"), ]  # 집합 개념으로 다가가서 정상 실행


# 6.2.3 dplyr::filter(data, 조건)
dplyr::filter(diamonds, cut == "Ideal")
dplyr::filter(diamonds, price >= 18000)
dplyr::filter(diamonds, cut == "Ideal" & price >= 18000)
dplyr::filter(diamonds, cut == "Ideal" , price >= 18000)  # &와 같음
dplyr::filter(diamonds, cut == "Ideal" | price >= 18000)
dplyr::filter(diamonds, cut == "Ideal" & "Good")
dplyr::filter(diamonds, cut %in% c("Ideal", "Good"))


# 6.3 행과 열 ----
# data[rowIndex, colIndex]
# cut이 "Ideal" 이고 price 가 18000 이상인 데이터의 
# x y z 이라는 변수를 가져오세요

diamonds[(diamonds$cut == "Ideal") & (diamonds$price >= 18000), c("x", "y", "z")]


# 6.3.2 dplyr::filter, dplyr::select()
# column 에 조건을 줘야하기 때문에 filter를 먼저 줘야함
diamonds2 <- dplyr::filter(diamonds, cut=="Ideal", price >= 18000)
diamonds3 <- dplyr::select(diamonds2, x:z)
diamonds3


# %>% : pipe operator, chain 
diamonds %>% 
  dplyr::filter(cut == "Ideal", price >= 18000) %>% 
  dplyr::select(x:z) %>% 
  head()



# 7. 새로운 변수(열) 만들기 ----
# data$newVariable <- 작업

# 7.1 연산    ----
diamonds$xyz.mean <- (diamonds$x + diamonds$y + diamonds$z) / 3
View(diamonds)
diamonds$xyz.mean2 <- rowMeans(diamonds[ , c("x", "y", "z")])
# rowSums(), colMeans(), colSums()



# 7.2 변환(Transformation)   ----

# 7.2.1 log 변환
diamonds$price.log10 <- log10(diamonds$price)


# 7.2.2 root 변환
diamonds$price.root <- sqrt(diamonds$price)


# 7.2.3 1/y 변환(역수 변환)
diamonds$price.inverse <- 1/(diamonds$price)

# Box - Cox transformatioin

 

# 7.3 구간의 정보    ----
# price 를 일정 구간:등간격(하한 ~ 상한 : 계급값 : 구간의 폭) 별로 grouping 하는 작업

# 7.3.1 cut()
# data$newVariable <- cut(data$variable, 
#                         breaks = 구간의 정보,
#                         right = TRUE or FALSE) # right = TRUE 이면 right <= & left > 조건이 됨(초과 이하)



diamonds$price.group <- cut(diamonds$price,
                            breaks = seq(from = 0 , to = 20000, by = 5000),
                            right = FALSE)
# cut() 함수를 사용하면 새로운 변수는 무조건 factor 가 됨
levels(diamonds$price.group)
levels(diamonds$price.group) <- c("5000미만",
                                  "5000~10000",
                                  "10000~15000",
                                  "15000이상")
table(diamonds$price.group)

# 문제8
# carat -> carat.group
# 0 ~ 1.5: 1.5 ~ 3.0 : 3.0 ~ 4.5 : 4.5 ~ 6.0

diamonds$carat.group <-  cut(diamonds$carat,
                             breaks = seq(from = 0 , to = 6, by = 1.5),
                             right  = FALSE)

levels(diamonds$carat.group) <- c("1.5 미만",
                                  "1.5 ~ 3.0",
                                  "3.0 ~ 4.5",
                                  "4.5 이상")

View(diamonds)


# 7.3.2 ifelse()
# ifelse(조건, Value of Truth, Value of False)

# 7.3.2.1 구간의 정보
# price <-  price.group2
# 0 ~ 5000 : Cheap
# 5000 ~ 20000 : Non - Cheap
diamonds$price.group2 <- ifelse(diamonds$price < 5000, "Cheap", "Non-Cheap")
View(diamonds)

# price <-  price.group3
# 0 ~ 5000 : Cheap
# 5000 ~ 15000 : Medium
# 15000 ~ 20000 : Expensive
diamonds$price.group3 <- ifelse(diamonds$price < 5000, 
                                "Cheap", 
                                ifelse(diamonds$price < 15000, "Medium", "Expensive"))
View(diamonds)



# 7.3.2.2 다양한 범주를 축소할 때
# cut -> cut.group
# Fair : Non-Ideal
# Good : Non-Ideal
# Very Good : Non-Ideal
# Premium : Non-Ideal
# Ideal : Ideal

diamonds$cut.group <- ifelse(diamonds$cut == "Ideal", "Ideal", "Non-Ideal")


# 7.4 dplyr::matate(data, newVariable = 연산, 변환 등)
diamonds <- diamonds %>% 
  dplyr::mutate(carat.log = log10(carat))
View(diamonds)

diamonds <- diamonds %>%
  dplyr::mutate(xyz.sum = x + y + z)



# 8. 변수 삭제하기 ----

# 8.1 Slicing ----
# diamonds  <-  diamonds[ , c("carat", "cut", "color")]

# 8.2 data$variable <-  NULL
diamonds$price.group2 <-  NULL
diamonds$price.group3 <-  NULL


# 9. 외부데이터로 저장하기 ----

# 9.1 .txt file 저장 ----
# write.table(data,
#             file = "directory/fileName.txt",
#             sep = " " or "\t" or "," ,
#             row.names = FALSE)     # 행의 이름을 저장하지 않음

write.table(diamonds,
            file = "diamonds_1010.txt",
            sep = ",",
            row.names = FALSE)



# 9.2 .csv file 저장 ----
# write.csv(data, 
#           file = "directory/filename.csv",
#           row.names = FALSE)

write.csv(diamonds,
          file      = "diamonds_1010.csv", 
          row.names = FALSE)


# 9.3 .xls(excel) file 저장 ----
# writexl::write_xls or wirte_xlsx(data,
#                                  path = "directory/filename.xlsx")
writexl::write_xlsx(diamonds,
                    path = "diamonds_1010.xlsx")



# 10. RData 로 저장하기 ----
# save(data,
#      file = "directory/filename.RData")

save(diamonds, file = "diamonds_1010.RData")


# 11. R data 불러오기 ----
# load(file = "directory/filename.RData")
load(file = "diamonds_1010.RData")



# 12. 데이터의 목록 보기   ----
# 사용자가 만든 데이터
# ls()
# list segment
# ls() 의 결과는 character vector
ls()


# 13. 데이터 삭제하기    ----

# 13.1 선택한 데이터 삭제하기    ----
# rm(data1, data2, ....)
# rm : remove
rm(traffic, tab, survey)
ls()


# 13.2 모든 데이터 삭제하기    ----
# rm(list = ls())
rm(list = ls())
ls()





















# 14. 데이터의 정렬    ----

# 14.1 벡터의 정렬    ----
# sort(vector, decreasing = FALSE or TRUE)  : default = FALSE, 오름차순
feet <- c(265, 285, 240, 270, 265)
feet
sort(feet)
sort(feet, decreasing = TRUE)
# 같은 값일 경우 먼저 입력된 값이 먼저 들어감



# 14.2 Data.Frame 의 정렬 ----
# order(data$variable, decreasing = FALSE or TRUE)   : default = FALSE, 오름차순
# data[order(data$variable, decreasing = FALSE or TRUE) , ]  으로 표현
order(feet)
# 본래의 인덱스로 나열이 됨
feet[order(feet)]
feet[order(feet, decreasing = TRUE)]

# cut : 오름차순
diamonds[order(diamonds$cut, decreasing = FALSE), ]

# cut : 내림차순
diamonds[order(diamonds$cut, decreasing = TRUE), ]

# cut : 오름차순, price : 오름차순
diamonds[order(diamonds$cut, diamonds$price, decreasing = FALSE) , ]

# cut : 내림차순, price : 내림차순
diamonds[order(diamonds$cut, diamonds$price, decreasing = TRUE) , ]

# cut : 오름차순, price : 내림차순
# diamonds[order(diamonds$cut, order(diamonds$price, decreasing = FALSE), decreasing = TRUE) , ]
diamonds[order(diamonds$cut, -diamonds$price, decreasing = FALSE) , ]

# cut : 내림차순, price : 오름차순
diamonds[order(diamonds$cut, -diamonds$price, decreasing = TRUE) , ]
# data.set 이 numeric 일 때만 - 가 작동

# cut : 내림차순, color : 오름차순
# R 의 기본 기능에서는 불가능
# dplyr::arrange(data, variable, desc(variable))       : default 는 오름차순

dplyr::arrange(diamonds, cut, desc(color))

diamonds %>% 
  dplyr::arrange(cut, desc(color))


# 문제
# xyz.mean 변수 지정, 이 값을 기준으로 내림차순 정렬한 후 상위 5개만 보이도록
rm(diamonds$xyz.mean, diamonds$xyz.mean2)
diamonds %>%
  dplyr::mutate(xyz.mean = (x + y + z)/3 ) %>% 
  dplyr::arrange(desc(xyz.mean)) %>% 
  head(n = 5)



# 15. 데이터 합치기    ----

# 15.1 rbind(data1, data2, ....)    ----
# 데이터를 위/아래로 합침
# 데이터의 변수명, 변수의 위치가 동일해야 함(ex. 2016, 2017 데이터를 합침)
DF1 <- data.frame(id = 1:3,
                  age = c(10,20,30),
                  gender = c("F", "F", "M"))
DF2 <- data.frame(id = 4:7,
                  age = c(40, 50, 60, 70),
                  gender = c("M", "F", "M", "F"))
rbind(DF1, DF2)


# 15.2 cbind(data1, data2, ....)    -----
# 데이터를 왼쪽/오른쪽으로 합침
# 동일한 행이어야함
DF4 <- data.frame(id = c("Kim", "Lee", "KimK"),
                  age = c(27, 26, 27),
                  bt = c("O", "B", "O"))
DF5 <- data.frame(address = c("BC", "SH", "GN"),
                  company = c("IM", "SAMSUNG", "SAMSUNG"))
cbind(DF4, DF5)



# 15.3 merge(data1, data2, by = )    ----

DF7 <- data.frame(id     = c(1,2,4,5),
                  age    = c(20, 30, 40, 50),
                  gender = c(1,1,2,2))

DF8 <- data.frame(id = c(1,4,7,8,9),
                  money = c(1000, 4000, 7000, 8000, 9000),
                  food = c("Beer", "Notebook", "AUDI", "Beer", "Heli"))

DF7; DF8

# 15.3.1 inner join
# merge(data1, data2, by = "primaryKeyName)
merge(DF7, DF8, by = "id")


# 15.3.2 outer join : Full join
# merge(data1, data2, by = "primaryKey", all = TRUE)
merge(DF7, DF8, by = "id", all = TRUE)

# 15.3.3 outer join : left join
# merge(data1, data2, by = "primaryKey", all = TRUE)
merge(DF7, DF8, by = "id", all.x = TRUE)

# 15.3.4 outer join : Full join
# merge(data1, data2, by = "primaryKey", all = TRUE)
merge(DF7, DF8, by = "id", all.y = TRUE)



