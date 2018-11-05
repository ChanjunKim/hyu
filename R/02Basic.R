# R 설치
# 연산자
# 데이터 유형
# 데이터
# 외부 데이터 읽어오기
# 데이터 핸들링 = 데이터 전처리
# 기초 데이터 분석
# 가설검정
# 일표본 검정
# 독립 2표본 검정
# 대응 2표본 검정
# 분산 분석
# 상관 분석
# 회귀 분석

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
# Lecture : Data
#
# Date : October 5th, 2018
# Author : Chanjun Kim
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#

# 1. Vector ***********
# 2. Factor ***
# 3. Matrix
# 4. Array
# 5. Data.Frame *********
# 6. List ***
# 7. Tibble
# 8. Data.Table
# 9. TS : Time Series, 시계열

# 1. Vector ----
# 하나의 열(Column)로 구성되어 있음, 1차원 구조
# 하나의 데이터 유형만 갖음
# 데이터 분석의 기본 단위

# 1.1 Vector 만들기 ----
# 1.1.1 하나의 값(element) 으로 이루어진 Vector
v1 <- 10
v2 <- "Chanjun"
v3 <- TRUE

# 1.1.2 두개 이상의 값으로 이루어진 Vector
# 1.1.2.1 c(element1, element2, ......)
# c : combine, concatenate 의 약자
# numeric, character, logical vector 를 만들 수 있음
# element 들 간의 규칙이 없을 때

age <- c(26, 30, 32)
food <- c('Pasta', 'Steak', 'Sandwich')
marry <- c(TRUE, FALSE, TRUE)
age2 <- c(27, 34, 27)
age3 <- c(age, age2)
age3
age

c(10, 'Lee', FALSE)
c(10, FALSE)


# 1.1.2.2 :
# numeric vector에만 적용됨
# start:end
# 1씩 증가되거나 1씩 감소되는 값
# start < end : 1씩 증가
# start > end : 1씩 감소
# start = end : start or end
1 : 100
5:1

# 문제
# -2.3 : 1  > # -2.3 -1.3 -0.3 0.7
-2.3 : 1
# 문제
# 1:-2.3 > # 1 0 -1 -2
1:-2.3


# 1.1.2.3 seq(from = , to = , by = )
# seq : Sequence 약자
# : 의 확장
# numeric vector 에만 적용
# from : start
# to : end
# by : 증가 또는 감소의 폭
# from 에서 시작해서 to에 있는 숫자를 넘지 않을 때까지 by만큼 증가 또는 감소되는 vector
seq(from = 1, to = 5, by = 0.5)

# 문제 5부터 시작해서 1을 넘지 않을 때까지 0.5 씩 감소하는 벡터
seq(from = 5, to = 1, by = -0.5)


# 1.1.2.4 sequence(number)
# numeric vector 에만 적용됨
# 1 ~ number 사이의 정수로 이루어진 vector
# number 가 음수가 되면 error 발생
sequence(10)
sequence(3.7)
sequence(1)
sequence(-3)


# 문제4
# 1, 1, 2, 1, 2, 3, 1, 2, 3, 4, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 6 이루어진 vector

x1 <- 1
x2 <- 1:2
x3 <- 1:3
x4 <- 1:4
x5 <- 1:5
x6 <- 1:6
c(x1, x2, x3, x4, x5, x6)
sequence(1:6)

# 1.1.2.5 rep(vector, times = , each = ) 
# replicate 의 약자
# rep 함수 안에 지정된 vector 를 times 또는 each 방식으로 복사해서 vector를 만듦
# numeric, character, logical 벡터를 만들 수 있음
rep(1, times = 10)
rep(1, each = 10)
rep(1:2, times = 5)
rep(1:2, each = 5)

# 문제5 "A", "B", "C", "A", "B", "C", "A", "B", "C", "A", "B", "C"
char <- c('A', 'B', 'C')
rep(c('A', 'B', 'C'), times = 3)
rep(c('A', 'B', 'C'), each = 3)

rep(1:3, time = 5, each = 3)

# 문제6
# 1: 100개 2: 52개 3:13개로 이루어진 vector
c(rep(1, each = 100), rep(2, each = 52), rep(3, each = 13))
rep(1:3, times = c(100, 53, 13))
rep(1:3, each = c(100, 53, 13))


# 1.2 Vector의 Attribute(속성) ----
# 1.2.1 데이터의 갯수 : length(vector)
length(age3)

# 1.2.2 Element 이름 : names(vector)
income <- c(10000, 3500, 4000)
# NULL : object가 없다는 뜻
# object : data, graph
names(income) <- c("김준회", "이민수", "김경태")
names(income)
income
names(income) <- NULL


# 1.3 Vector 의 Index ----
# 첫번째 element를 1로 인식함

# 1.4 Vector 의 Slicing ----
# vector[index]
height <- c(170, 171, 178, 174, 180, 163, 181, 168, 168)
length(height)
height[1]
height[3]
height[1:3]

# 문제7 
# 1, 4, 5, 8 번째 값을 한번에 가져오세요
height[c(1,4,5,8)]


# 문제8
# 4 ~ 9번째 값 출력
height[4:9]

# 문제9
# 짝수번째
height[seq(from = 0, to = length(height), by = 2)]


# 1.5 Vector 의 연산 ----
v1 <- 1:3
v2 <- 4:6
v1 + v2   # Vectorization : 벡터화

v3 <- 1:6
v1 + v3  # Recycling Rule : 재사용 규칙




# 2. Factor ----
# 하나의 열로 구성되어 있음, 1차원 구조
# 집단으로 인식
# 범주형 자료 = 질적 자료 = 그룹 = 집단


# 2.1 Factor 만들기 ----
# factor(vector, labels = , levels = , ordered = )
bt <- c("B", "AB", "B", "A", "O", "O", "AB")
bt
# data variable function package 의 이름 짓기
# 단어 + 단어 이름을 지을 때는 단어1.단어2

bt.factor1 <- factor(bt)
bt.factor1
typeof(bt.factor1)
bt.factor2 <- factor(bt, labels = c("A형", "AB형", "B형", "O형"))
bt.factor2
bt.factor3 <- factor(bt, levels = c("A", "B", "AB", "O"))
bt.factor3
bt.factor4 <- factor(bt, 
                     levels = c("A", "B", "AB", "O"),
                     labels = c("A형", "B형", "AB형", "0형")) 
bt.factor4
bt.factor5 <- factor(bt, 
                     levels = c("A", "B", "AB", "O"),     # 집단의 순서
                     labels = c("A형", "B형", "AB형", "0형"),   # 집단을 표시
                     ordered = TRUE) # 순서형 자료로 만들어줌
bt.factor5
# ordered = false : default > 명목형 자료

# 자료
# 질적자료 = 범주형 자료(명목형 자료(factor), 순서형 자료(factor, ordered=true))
# 양적자료 = 


# 2.2 Factor의 속성
# 집단의 이름과 개수 : levels(factor)
levels(bt.factor5)
length(levels(bt.factor5))

# factor의 집단의 이름은 글자로 보이지만
# 실직적으로는 숫자로 인식하고 있음
# 숫자가 문자보다 메모리 차지를 덜함

mode(bt.factor5)



# 3. Matrix   ----
# 행과 열로 구성되어 있음, 2차원 구조
# 하나의 데이터 유형만 갖음
# Vector의 확장
v1 <- 1:3
v2 <- 4:6
v3 <- 1:6

# 3.1 Matrix 만들기 ----

# 3.1.1 rbind(vector1, vector2, .....)
M1 <- rbind(v1, v2)
M1 <- rbind(v1, v2, v3)    # 3x6(three by six) Matrix
M1

# 3.1.2 cbind(vector1, vector2, .....)
cbind(v1, v2)
M2 <- cbind(v1, v2, v3) # 6x3 Matrix
M2

# 3.1.3 matrix(vector, nrow = , ncol =, by row = TRUE)
matrix(1:4, nrow =2, ncol =2)
matrix(1:4, nrow =2, ncol =2, byrow = TRUE)


# 3.2 Matrix 의 Slicing
# matrix[rowIndex, colIndex]
A <- matrix(1:9, nrow = 3, ncol = 3)
A
A[3, ] #vector
A[3, , drop = FALSE] # Matrix
A[c(1,3) , ]
A[ , 3]
A[ , 3, drop = FALSE]
A[c(1,3), c(1,3)]
A[3,3]

# 3.3 Matrix 의 연산
# 3.3.1 덧셈과 뺄셈
A <- matrix(1:4, nrow = 2, ncol = 2)
B <- matrix(5:6, nrow = 2, ncol = 2)
A; B;
A + B
A - B


# 3.3.2 행렬의 곱셈 : %*%
A * B
A %*% B

# 3.3.3 역행렬(Inverse Matrix) 곱해서 I(단위행렬)이 되는 행렬
# 역행렬 성질 행 = 열, 1(ad-bc) != 0
solve(A)
A <- matrix(c(1, 1, -1, 1), nrow = 2, ncol =2)
A
B <- matrix(c(3,1), nrow = 2, ncol = 1)
B

solve(A) %*% B


# 3.3.4 전치 행렬(Transpose Matrix) 
# 행과 열을 바꿈
# t(matrix)
A
t(A)



# 4. Array ----
# 다차원 구조
# 하나의 데이터 유형만 가짐
# vector, matrix 의 확ㅈ

# 4.1 Array 만들기 ----
# array(vector, dim = )
array(1:4, dim = 10)     # array & vector 의 성질을 두개다 가짐
array(1:9, dim = c(3,3))    # array & matrix 의 성질을 두개다 가짐
arr = array(1:18, dim = c(3, 3, 2))

# 4.2 Array의 속성 ----
# dim(array) : 차원
dim(arr)


# 5. Data.Frame ----
# 행과 열로 구성되어 있음, 2차원 구조
# 여러 개의 데이터 유형을 가질 수 있음
# 단, 하나의 열에는 하나의 데이터 유형만 가짐
# R에서 기본적으로 데이터라고 하면, data.frame 이다.
# Recycling rule 이 적용되지 않음


# 5.1 data.frame 만들기  ----
# data.frame(vector) or data.frame(matrix)
id <- 1:3
hobby <- c("watcing movies", "bycle", "exercise")
movie <- c(1, 0.5, 10)
traffic <- c(100, 100, 40)
survey <- data.frame(id, hobby, movie, traffic)
survey
View(survey)



# 6. List ----
# 가장 유연한 형태의 데이터
# element 로 vector, factor, matrix, array, data.frame, list 를 가질수 있음

# result[1] != result[[1]]  >> 
# result[1] 은 list의 header를 포함(list), result[[1]]은 header 미포함(vector 등) > 
# 결과 다를수 있음

# 6.1 List 만들기 ----
# list(vector, factor, matrix, array, data.frame, list)
gender.factor <- factor(c("M", "M", "F", "M", "M"))
result <- list(hobby, gender.factor, survey)
result

result[1]   # 결과 : List
result[[1]]   # 결과 : vector
result[3]
result[[3]][1, ,drop = FALSE]

result[2]
result[[2]]

result[3]
result[[3]]















