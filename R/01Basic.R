3+4;
3**4;
3**4;
3**  
4;  
x <- rnorm(1000000, mean = 100, sd = 1);
x <- rnorm(1000000);
x;
hist(x);
hist(x, col = "red");
?hist
4+
  3;

# 1. 연산자(Operator) ----
# 1.1 산술연산자 ----
# +, -, *, /, **, ^, %%, %/%
3 + 4
3 - 4
3 * 4
3 / 4
3 ** 4
3 ^ 4
13 %% 4 # 나머지
13 %/% 4 # 몫

# 문제 1
# 루트 3을 위의 산술연산자를 이용해서 구하시오.
3 ** 0.5
3 ^ (1/2)
sqrt(3)

# 1.2 할당 연산자 ----
# <-, =
# <- : 일반적인 할당 연산자
# = : 함수 안의 argument를 설정할 때 사용하는 할당 연산자

# 1.3 비교 연산자 ----
# <, >, <= , >=, ==, !=, !

# 1.4 논리 연산자 ----
# &, |
# & : and, 여러 개의 조건이 동시에 마족될 때 TRUE
# | : or, 여러 개의 조건 중에 하나만 만족해도 TRUE
(3 > 4) & (5 > 4)
(3 > 4) | (5 > 4)

# 2. 데이터 유형 (Type of Data) ----
# 2.1 수치형(Numeric)
# 2.1.1 정수(integer)
x1 <- 10L
typeof(x1)
class(x1)

# 2.1.2 실수(double)
x2 <- 10.2
typeof(x2)
class(x2)

# 2.2 문자형(Character)
x3 <- 'Love is not feeling'
typeof(x3)
class(x3)

# 2.3 논리형(Logical)
x4 <- FALSE
x5 <- TRUE
typeof(x4)
typeof(x5)
class(x4)

# 3. 데이터 유형을 알아내기 ----
# 3.1 mode(data)

# 3.2 is.xxxx(data)
mode(x4)

# 3.2.1 is.numeric
is.numeric(x2)
is.integer(1)

# 3.2.2 is.character
is.character(x2)

# 3.2.3 is.logical
is.logical(x4)

# 4. 강제적으로 데이터 유형 변경하기(Parsing) ----
# 4.1 as.xxxx(data)
as.numeric(x4)
as.numeric(x5)
x7 <- "10"
x8 <- as.numeric(x7)
is.numeric(x7)
is.numeric(x8)

as.numeric(x3)

as.character(x1)
as.character(x4)

as.logical(x1)

# 데이터 유형의 우선순위
# character > numeric > logical
# 0 > FALSE , !0 > TRUE