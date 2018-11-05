#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
# Lecture : EDA(Explorary Data Analysis)
#           탐색적 데이터 분석
# Date : October 10th, 2018
# Author : Chanjun Kim
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#


# 데이터에 숨겨진 패턴(pattern) 또는 특징을 찾아내는 작업

install.packages("ggplot2")  # Visulization
install.packages("dplyr")    # Data Analysis and Handling
install.packages("RColorBrewer")     # 색깔 패키지
install.packages("stringr")      # String
install.packages("prettyR")      # Mode, Correlation Analysis
install.packages("e1071")      # Skewness, Kurtosis, SVM
install.packages("psych")      # Descriptive Statitics = Summary Statitics
install.packages("writexl")
library(ggplot2)
library(dplyr)
library(RColorBrewer)
library(stringr)
library(prettyR)
library(e1071)
library(psych)
library(writexl)

# 작업공간
setwd("C:/R/Bigdata/")

#데이터 읽어오기
# ggplot2::diamonds

# 데이터 종류(통계적인 관점)
# 1. 질적 자료 = 범주형 자료 : 글자(문자) = character vector or factor, numeric vector
# 2. 양적 자료 : numeric vector


# diamonds
diamonds <- diamonds[ , 1:10]
diamonds
# 질적 자료 : cut, color, clarity
# 양적 자료 : carat, depth, table, price, x, y, z

# 1. 일변량(Uni-variate) 질적 자료   ----
# 1.1 표 = 빈도표(Frequency table)    ----

# 1.1.1 Frequency : 빈도
# table(data$variable)
table(diamonds$cut)
sort(table(diamonds$cut), decreasing = TRUE)

# TOP 3
sort(table(diamonds$cut), decreasing = TRUE)[1:3]
head(sort(table(diamonds$cut), decreasing = TRUE), n = 3)

sort(table(diamonds$color), decreasing = TRUE)
sort(table(diamonds$clarity), decreasing = TRUE)

diamonds[ , 2]   # cut
diamonds[ , 3]   # color
diamonds[ , 4]   # clariry


for(i in 2:4) {
  print(sort(table(diamonds[ , i]), decreasing = TRUE))
}


# 1.1.2 Percent : 백분율
# prop.table(frequency) : 비율(0 ~ 1)
# propotional table
# prop.table(frequency) * 100 : 백분율

table(diamonds$cut)
prop.table(table(diamonds$cut))*100
sort(prop.table(table(diamonds$cut))*100, decreasing = TRUE)[1:3]
# 백분율의 소수점 자리수는 특별하지 않으면 한 자리를 표현함
# round( , digits = )  : 소수점 몇번째 자리에서 반올림
round(sort(prop.table(table(diamonds$cut))*100, decreasing = TRUE)[1:3] , digits = 1)

# 문제1
# for 을 이용해서 세개의 질적 자료에 대한 빈도 백분율을 출력하시오

for(i in 2:4) {
  print(colnames(diamonds)[i])
  print(round(sort(prop.table(table(diamonds[ , i]))) * 100, digits = 1))
}


for(i in c("cut", "color", "clarity")) {
  print(colnames(diamonds)[i])
  print(round(sort(prop.table(table(diamonds[ , i]))) * 100, digits = 1))
}




# 1.2 그래프    ----
# 1.2.1 막대그래프 : 세로 / 가로
# barplot(frequency or percent)
barplot(sort(table(diamonds$cut), decreasing = TRUE))

# 막대 색깔 : col = "colorName"
barplot(sort(table(diamonds$cut), decreasing = TRUE), col = "magenta4")

# 문제 2
# 막대 색깔을 다 다르게 하시오
barplot(sort(table(diamonds$cut), decreasing = TRUE), 
        col = c("magenta4", "red", "blue", "black", "pink"))

pal <- RColorBrewer::brewer.pal(n = 5, name = "BuGn")

barplot(sort(table(diamonds$cut), decreasing = TRUE), 
        col = rainbow(5))

# 차트의 제목 : main = "title"
barplot(sort(table(diamonds$cut), decreasing = TRUE), 
        col = "magenta4",
        main = "Cut of Diamonds")

# y축 제목 : ylab = "y axis's label"
# ylab : y label
barplot(sort(table(diamonds$cut), decreasing = TRUE), 
        col = "magenta4",
        main = "Cut of Diamonds",
        ylab = "Frequency")


# y축의 눈금 : ylim = "y axis's label"
# ylim : y limit
# 막대 그래프의 절단 효과 : 0부터 시작하는 것이 좋음.
barplot(sort(table(diamonds$cut), decreasing = TRUE), 
        col = "magenta4",
        main = "Cut of Diamonds",
        ylab = "Frequency",
        ylim = c(0, 25000),
        xlab = "degree of diamonds cut")


# 가로 막대 그래프 : horiz = TRUE
# horiz = horizontal
barplot(sort(table(diamonds$cut), decreasing = FALSE), 
        col = "magenta4",
        main = "Cut of Diamonds",
        ylab = "Frequency",
        xlim = c(0, 25000),
        horiz = TRUE)


# x축 제목 : xlab = "y axis's label"
barplot(sort(table(diamonds$cut), decreasing = TRUE), 
        col = "magenta4",
        main = "Cut of Diamonds",
        ylab = "Frequency",
        xlab = "degree of diamonds cut")


# paste(charater1, character2, ..., sep = )
paste("Love", "is", "Choice")
paste("Love", "is", "Choice", sep = "-")
paste("V", 1:10, sep = "")
# Recyling rule 적용 1:10 벡터에 V가 recycle 됨

# 문제 3
# for을 이용해 세개의 질적 자료에 대한 각각의 막대그래프를 작성해보세요

for(i in c("cut", "clarity", "color")) {
  barplot(sort(table(diamonds[ , i]), decreasing = TRUE), 
          col = "magenta4",
          main = paste(i, " of Diamonds"),
          ylab = "Frequency",
          xlab = "degree of diamonds")
}

for(i in 2:4) {
  barplot(sort(table(diamonds[ , i]), decreasing = TRUE), 
          col = "magenta4",
          main = paste(colnames(diamonds)[i], " of Diamonds"),
          ylab = "Frequency",
          xlab = "degree of diamonds")
}

tolower("Love is Truth") # 소문자 변경
toupper("Love is Choice") # 대문자 변경

# stringr    ----
stringr::str_to_title("Love is choice")



# 1.2.2 원그래프
# pie(frequency or percent)
pie(sort(table(diamonds$cut), decreasing = TRUE),
    col = pal)

# 반지름 크기 : radius = 0.8
pie(sort(table(diamonds$cut), decreasing = TRUE),
    col = pal,
    radius = 1.5)

# 시계 방향 : clockwise = TRUE
pie(sort(table(diamonds$cut), decreasing = TRUE),
    col = pal,
    radius = 1.5,
    clockwise = TRUE)

# 첫째 조각의 시작 각도 : init.angle = 
# 시계 반대 방향 : 0, 시계 방향 : 90  : 북쪽이 90도
pie(sort(table(diamonds$cut), decreasing = TRUE),
    col = pal,
    radius = 1.5,
    clockwise = TRUE)


# 문제 4
# 질적 자료 세 개에 대한 각각의 막대/원그래프를 작성하시오

for(i in 2:4) {
  barplot(sort(table(diamonds[ , i]), decreasing = TRUE), 
          col = "magenta4",
          main = paste(colnames(diamonds)[i], " of Diamonds"),
          ylab = "Frequency",
          xlab = "degree of diamonds")
  
  pie(sort(table(diamonds[ , i]), decreasing = TRUE),
      col = pal,
      radius = 1.0,
      clockwise = TRUE,
      main = paste(colnames(diamonds)[i], " of Diamonds"))
}


# 그래픽 화면 분할하기
# par(mfrow = c(nrow, ncol)) : 행부터 채워짐
# par(mfcol = c(nrow, ncol)) : 열부터 채워짐

# mf : multi frame 의 약자

par(mfrow = c(3, 2))

for(i in 2:4) {
  barplot(sort(table(diamonds[ , i]), decreasing = TRUE), 
          col = "magenta4",
          main = paste(colnames(diamonds)[i], " of Diamonds"),
          ylab = "Frequency",
          xlab = "degree of diamonds")
  
  pie(sort(table(diamonds[ , i]), decreasing = TRUE),
      col = pal,
      radius = 1.0,
      clockwise = TRUE,
      main = paste(colnames(diamonds)[i], " of Diamonds"))
}

# 그래픽 화면 초기화
# par(mfrow = c(1,1))
par(mfrow = c(1,1))
# 그래프를 pdf 파일로 저장하기
# pdf(file = "directory/filename.pdf") : 저장시작
# 그래프 작업
# dev.off() : 저장 끝 > graphic device off

pdf(file = "output1.pdf")


for(i in 2:4) {
  barplot(sort(table(diamonds[ , i]), decreasing = TRUE), 
          col = "magenta4",
          main = paste(colnames(diamonds)[i], " of Diamonds"),
          ylab = "Frequency",
          xlab = "degree of diamonds")
  
  pie(sort(table(diamonds[ , i]), decreasing = TRUE),
      col = pal,
      radius = 1.0,
      clockwise = TRUE,
      main = paste(colnames(diamonds)[i], " of Diamonds"))
}

dev.off()


# pdf 한페이지에 여러개의 그래프 저장하기

pdf(file = "output2.pdf")

par(mfrow = c(3, 2))

for(i in 2:4) {
  barplot(sort(table(diamonds[ , i]), decreasing = TRUE), 
          col = "magenta4",
          main = paste(colnames(diamonds)[i], " of Diamonds"),
          ylab = "Frequency",
          xlab = "degree of diamonds")
  
  pie(sort(table(diamonds[ , i]), decreasing = TRUE),
      col = pal,
      radius = 1.0,
      clockwise = TRUE,
      main = paste(colnames(diamonds)[i], " of Diamonds"))
}

dev.off()

par(mfrow = c(1,1))


# ggplot2 패키지를 이용해서 그래프를 작성하기
# ggplot2::ggplot(data = , mapping = aes())

# ggplot2::ggplot(data = , mapping = aes(x = variable))  : 막대 그래프
# geom_bar()

ggplot2::ggplot(data = diamonds, mapping = aes(x = cut, fill = cut)) +
  geom_bar()

ggplot2::ggplot(data = diamonds, mapping = aes(x = cut, fill = cut)) +
  geom_bar() + 
  theme_classic()

ggplot2::ggplot(data = diamonds, mapping = aes(x = cut, fill = cut)) +
  geom_bar() + 
  theme_classic() +
  facet_wrap(~color)

ggplot2::ggplot(data = diamonds, mapping = aes(x = cut, fill = cut)) +
  geom_bar() + 
  theme_classic() +
  facet_wrap(~color + clarity)

ggplot2::ggplot(data = diamonds, mapping = aes(x = cut, fill = cut)) +
  geom_bar() +
  theme_get() +
  labs(title = "Cut of Diamonds",
       x = "Cut",
       y = "Frequency")



# 2. 일변량 양적 자료의 분석     ----
# 구간을 나눌 때
# 최소값, 최대값
# 범위 : 최대값 - 최소값
# 구간의 개수 고민 : Sturge's Formular ( 1 + 3.3 log10(n))
# 구간의 폭 = 계급의 폭 = 범위 / 구간의 개수
# 첫번째 구간 : 최소값, 마지막 구간 : 최대값
min(diamonds$price)
max(diamonds$price)
price.range <-  max(diamonds$price) - min(diamonds$price)
interval.count <- 1 + 3.3 * log10(length(diamonds$price))

interval.width <- price.range / 17

diamonds$price.group <- cut(diamonds$price,
                            breaks = seq(from = 0, to = 19000, by = 1000),
                            right = TRUE)
# 2.1 표 = 빈도표    ----

# 2.1.1 구간의 빈도
table(diamonds$price.group)
sort(table(diamonds$price.group) , decreasing = TRUE)

# 2.2.2 구간의 백분율
prop.table(table(diamonds$price.group)) * 100
sort(prop.table(table(diamonds$price.group))*100, decreasing = TRUE)
round(sort(prop.table(table(diamonds$price.group))*100, decreasing = TRUE), digit = 1)


# 2.2 그래프     ----

# 2.2.1 히스토그램(Histogram)
# hist(data$variable, breaks = )
hist(diamonds$price)
hist(diamonds$price,
     xlim = c(0, 20000))
# 히스토그램은 Sturge's Formular로 나눠짐ㄷ
?hist
hist.result <- hist(diamonds$price)
hist.result
str(hist.result)

# List 의 Slicing
# list[idx]
# list[[idx]]
# list$index

hist(diamonds$price, 
     breaks = seq(from = 0, to = 20000, by = 1))

hist(diamonds$price, 
     breaks = 20)
# 여기서 breaks 는 구간 개수


# 2.2.2 상자그림(Box Plot)
# boxplot(data$variable, range = 1.5)
boxplot(diamonds$price, range = 1)

# IQR = Q3 - Q1
# Inter Quartile Range
# Range * IQR 만큼 그림
# Range : 0.5 마다 1sigma 씩 늘어남

# 집단별 상자그림
# boxplot(data$variable ~ data$variable)
# boxplot(양적자료 ~ 질적 자료)
boxplot(diamonds$price ~ diamonds$cut)


# ggplot2 패키지를 이용한 히스토그램/상자그림
# 히스토스램
ggplot2::ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_histogram()

ggplot2::ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_histogram(binwidth = 2000)

ggplot2::ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_histogram(binwidth = 2000) +
  facet_wrap(~cut)


# 상자그림
ggplot2::ggplot(data = diamonds, mapping = aes(x = cut, y = price)) +
  geom_boxplot()



# 2.3 기술통계량 = 요약통계량    ----
# 2.3.1 중심 = 대표값
# i. Average(Mean)
# mean(data$variable, na.rm = TRUE)
meal.fee <- c(7200, 8000, 7000, NA)
mean(meal.fee)
mean(meal.fee, na.rm = TRUE)
mean(diamonds$price)


# ii. 절사평균(Trimmed Mean)
# 5% 절사 평균- 양쪽 끝의 5% 값을 빼고 90%의 값으로 평균을 냄 = 이상치 제거
# mean(data$variable, trim = 0.05, na.rm = TRUE)
mean(diamonds$price, trim = 0.05)
mean(diamonds$price, trim = 0.1)


# iii. 중위수(Median)
# median(data$variable, na.rm = TRUE)
median(diamonds$price)


# iv. 최빈수 = 최빈값(Mode)
# 최빈수는 복수의 값일 가능성이 있음.
# which.max(table(data$variable))
# prettyR::Mode(data$variable)
lunch.fee <- c(5000, 3500, 5000, 5000, 3300, 5000)
table(lunch.fee)
which.max(table(lunch.fee))
which.max(c(100, 200, 300, 4000))

which.max(table(diamonds$price))
prettyR::Mode(diamonds$price)

# Robustness(강건성) : 어떤 값에 대하여 영향을 덜 받는 성질
# Average, Trimmed Mean, Median 등을 이상치에 대해 고려하여 사용


# 2.3.2 퍼짐 = 산포
# 관심있는 집단의 다름이 얼마나 존재할까를 수치화한 값
# 이 값이 크면 : 많이 다르다
# 이 값이 작으면 : 비슷하다

# i. 범위(Range) : 최대값 - 최소값
# diff(range(data$variable))
range(diamonds$price)
diff(range(diamonds$price))

# diff(data$variable) : 뒤에서 앞의 값을 뺌, 시계열 데이터 처리에 유용

# ii. 사분위범위(IQR : Inter Quartile Range)
# IQR(data#variable)
IQR(diamonds$price)

# iii. 표본의 분산(Variance) 
# 모집단과 표본 집단의 공식 유의!
# Degree of Freedom(df:자유도)
# var(data$variable, na.rm = TRUE)
var(diamonds$price)

# iv. 표본의 표준편차(SD : Standard Deviation)
# sd(data$variance, na.rm = TRUE)
sd(diamonds$price)


# v. 중위수 절대 편차(MAD : Median Absolute Deviation)
# mad(data$variable)
mad(diamonds$price)


# 2.3.3 분포의 모양
# i. 왜도(Skewness : 기울림) = 대칭여부를 알려주는 값
# 0에 가까울 수록 대칭, 양수 : 초기값에 몰려있음(돈), 음수 : 후반값
# e1071::skewness(data$variable)
e1071::skewness(diamonds$price)

# ii. 첨도(Kurtosis) = 중심이 얼마나 뾰족한가를 알려주는 값
#                    = 중심에 얼마나 몰려있는가를 알려주는 값
# 숫자가 클수록 중심이 높아짐, 0에 가까울수록 정규 분포에 가까움
# e1071::kurtosis(data$variable)
e1071::kurtosis(diamonds$price)

# 2.3.4 기타
# i. 최소값 : min(data$variable)
# ii. 최대값 : max(data$variable)


# 2.3.5 기술통계량을 구하는데 유용한 함수
# i. summary()
summary(diamonds$price)
# 이 결과 중, 평균을 빼면 Five Numbers Summary
# 다섯 수치 요약, 다섯 숫자 요약
summary(dplyr::select(diamonds, -(cut:clarity)))


# ii. by(data$variable, data$variable, functionName)
#     by(양적자료, 질적자료, 함수명)
# 집단별로 양적자료를 처리함
by(diamonds$price, diamonds$cut, mean)
by(diamonds$price, diamonds$cut, mean, trim = 0.05)
by(diamonds$price, diamonds$cut, sd)
by(diamonds$price, diamonds$cut, summary)
by(diamonds$price, diamonds$cut, hist)

par(mfrow = c(3, 2))
by(diamonds$price, diamonds$cut, hist, col = "blue")


# iii. psych::describe(), describeBy()
# psych::describe(data$variable)
# psych::describe(data)
psych::describe(diamonds$price)   # 10% 절사평균
psych::describe(diamonds$price, trim = 0.05)
psych::describe(dplyr::select(diamonds, carat, depth:z))

# psych::describeBy(data$variable, data$variable)
# psych::describeBy(양적자료, 질적자료)
# psych::describeBy(data, data$variable)
psych::describeBy(diamonds$price, diamonds$cut)
psych::describeBy(dplyr::select(diamonds, carat, depth:z))

price.by.cut.describe <- psych::describeBy(diamonds$price, diamonds$cut)
str(price.by.cut.describe)
str(price.by.cut.describe)[[1]]


# 엑셀에 저장하기
writexl::write_xlsx(str(price.by.cut.describe)[[1]], path = "output2.xlsx")



# iv. dplyr::summarise(data, variableName = functionName)
dplyr::summarise(diamonds,
                 n = n(),
                 Mean = mean(price),
                 SD = sd(price))

# 집단별 : dplyr::group_by(variable)
diamonds %>%
  dplyr::group_by(cut) %>% 
  dplyr::summarise(n = n(),
                   Mean = mean(price),
                   SD = sd(price)) %>% 
  dplyr::arrange(desc(Mean)) %>% 
  ggplot2::ggplot(mapping = aes(x = cut, y = Mean)) +
  geom_bar(stat = "identity")


# 문제
# cut = "Good" or Very Good
# carat >= 2 diamonds.xyz.sum and 
# xyz.sum divided by cut 에 대한 히스토그램을 그리시오

diamonds %>% 
  dplyr::filter(cut %in% c("Good", "Very Good"), carat >= 2) %>% 
  dplyr::mutate(xyz.sum = (x + y + z)) %>%
  ggplot2::ggplot(mapping = aes(x = xyz.sum)) +
  geom_histogram() +
  facet_wrap(~cut)

  

# %>% 
#   xyz.mean <- mean(x, y, z)


# 모집단 Populatino
# 표본 Sample
# 표본의 일부를 가지고 모집단을 추론(Inference)
# 추론 : 1. 추정, 2. 가설검정
# 점추정 Point estimation
# 구간 추정

