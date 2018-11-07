# R ��ġ
# ������
# ������ ����
# ������
# �ܺ� ������ �о����
# ������ �ڵ鸵 = ������ ��ó��
# ���� ������ �м�
# ��������
# ��ǥ�� ����
# ���� 2ǥ�� ����
# ���� 2ǥ�� ����
# �л� �м�
# ��� �м�
# ȸ�� �м�

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
# 9. TS : Time Series, �ð迭

# 1. Vector ----
# �ϳ��� ��(Column)�� �����Ǿ� ����, 1���� ����
# �ϳ��� ������ ������ ����
# ������ �м��� �⺻ ����

# 1.1 Vector ����� ----
# 1.1.1 �ϳ��� ��(element) ���� �̷���� Vector
v1 <- 10
v2 <- "Chanjun"
v3 <- TRUE

# 1.1.2 �ΰ� �̻��� ������ �̷���� Vector
# 1.1.2.1 c(element1, element2, ......)
# c : combine, concatenate �� ����
# numeric, character, logical vector �� ���� �� ����
# element �� ���� ��Ģ�� ���� ��

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
# numeric vector���� �����
# start:end
# 1�� �����ǰų� 1�� ���ҵǴ� ��
# start < end : 1�� ����
# start > end : 1�� ����
# start = end : start or end
1 : 100
5:1

# ����
# -2.3 : 1  > # -2.3 -1.3 -0.3 0.7
-2.3 : 1
# ����
# 1:-2.3 > # 1 0 -1 -2
1:-2.3


# 1.1.2.3 seq(from = , to = , by = )
# seq : Sequence ����
# : �� Ȯ��
# numeric vector ���� ����
# from : start
# to : end
# by : ���� �Ǵ� ������ ��
# from ���� �����ؼ� to�� �ִ� ���ڸ� ���� ���� ������ by��ŭ ���� �Ǵ� ���ҵǴ� vector
seq(from = 1, to = 5, by = 0.5)

# ���� 5���� �����ؼ� 1�� ���� ���� ������ 0.5 �� �����ϴ� ����
seq(from = 5, to = 1, by = -0.5)


# 1.1.2.4 sequence(number)
# numeric vector ���� �����
# 1 ~ number ������ ������ �̷���� vector
# number �� ������ �Ǹ� error �߻�
sequence(10)
sequence(3.7)
sequence(1)
sequence(-3)


# ����4
# 1, 1, 2, 1, 2, 3, 1, 2, 3, 4, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 6 �̷���� vector

x1 <- 1
x2 <- 1:2
x3 <- 1:3
x4 <- 1:4
x5 <- 1:5
x6 <- 1:6
c(x1, x2, x3, x4, x5, x6)
sequence(1:6)

# 1.1.2.5 rep(vector, times = , each = ) 
# replicate �� ����
# rep �Լ� �ȿ� ������ vector �� times �Ǵ� each ������� �����ؼ� vector�� ����
# numeric, character, logical ���͸� ���� �� ����
rep(1, times = 10)
rep(1, each = 10)
rep(1:2, times = 5)
rep(1:2, each = 5)

# ����5 "A", "B", "C", "A", "B", "C", "A", "B", "C", "A", "B", "C"
char <- c('A', 'B', 'C')
rep(c('A', 'B', 'C'), times = 3)
rep(c('A', 'B', 'C'), each = 3)

rep(1:3, time = 5, each = 3)

# ����6
# 1: 100�� 2: 52�� 3:13���� �̷���� vector
c(rep(1, each = 100), rep(2, each = 52), rep(3, each = 13))
rep(1:3, times = c(100, 53, 13))
rep(1:3, each = c(100, 53, 13))


# 1.2 Vector�� Attribute(�Ӽ�) ----
# 1.2.1 �������� ���� : length(vector)
length(age3)

# 1.2.2 Element �̸� : names(vector)
income <- c(10000, 3500, 4000)
# NULL : object�� ���ٴ� ��
# object : data, graph
names(income) <- c("����ȸ", "�̹μ�", "�����")
names(income)
income
names(income) <- NULL


# 1.3 Vector �� Index ----
# ù��° element�� 1�� �ν���

# 1.4 Vector �� Slicing ----
# vector[index]
height <- c(170, 171, 178, 174, 180, 163, 181, 168, 168)
length(height)
height[1]
height[3]
height[1:3]

# ����7 
# 1, 4, 5, 8 ��° ���� �ѹ��� ����������
height[c(1,4,5,8)]


# ����8
# 4 ~ 9��° �� ���
height[4:9]

# ����9
# ¦����°
height[seq(from = 0, to = length(height), by = 2)]


# 1.5 Vector �� ���� ----
v1 <- 1:3
v2 <- 4:6
v1 + v2   # Vectorization : ����ȭ

v3 <- 1:6
v1 + v3  # Recycling Rule : ���� ��Ģ




# 2. Factor ----
# �ϳ��� ���� �����Ǿ� ����, 1���� ����
# �������� �ν�
# ������ �ڷ� = ���� �ڷ� = �׷� = ����


# 2.1 Factor ����� ----
# factor(vector, labels = , levels = , ordered = )
bt <- c("B", "AB", "B", "A", "O", "O", "AB")
bt
# data variable function package �� �̸� ����
# �ܾ� + �ܾ� �̸��� ���� ���� �ܾ�1.�ܾ�2

bt.factor1 <- factor(bt)
bt.factor1
typeof(bt.factor1)
bt.factor2 <- factor(bt, labels = c("A��", "AB��", "B��", "O��"))
bt.factor2
bt.factor3 <- factor(bt, levels = c("A", "B", "AB", "O"))
bt.factor3
bt.factor4 <- factor(bt, 
                     levels = c("A", "B", "AB", "O"),
                     labels = c("A��", "B��", "AB��", "0��")) 
bt.factor4
bt.factor5 <- factor(bt, 
                     levels = c("A", "B", "AB", "O"),     # ������ ����
                     labels = c("A��", "B��", "AB��", "0��"),   # ������ ǥ��
                     ordered = TRUE) # ������ �ڷ�� �������
bt.factor5
# ordered = false : default > ������ �ڷ�

# �ڷ�
# �����ڷ� = ������ �ڷ�(������ �ڷ�(factor), ������ �ڷ�(factor, ordered=true))
# �����ڷ� = 


# 2.2 Factor�� �Ӽ�
# ������ �̸��� ���� : levels(factor)
levels(bt.factor5)
length(levels(bt.factor5))

# factor�� ������ �̸��� ���ڷ� ��������
# ���������δ� ���ڷ� �ν��ϰ� ����
# ���ڰ� ���ں��� �޸� ������ ����

mode(bt.factor5)



# 3. Matrix   ----
# ��� ���� �����Ǿ� ����, 2���� ����
# �ϳ��� ������ ������ ����
# Vector�� Ȯ��
v1 <- 1:3
v2 <- 4:6
v3 <- 1:6

# 3.1 Matrix ����� ----

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


# 3.2 Matrix �� Slicing
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

# 3.3 Matrix �� ����
# 3.3.1 ������ ����
A <- matrix(1:4, nrow = 2, ncol = 2)
B <- matrix(5:6, nrow = 2, ncol = 2)
A; B;
A + B
A - B


# 3.3.2 ����� ���� : %*%
A * B
A %*% B

# 3.3.3 �����(Inverse Matrix) ���ؼ� I(�������)�� �Ǵ� ���
# ����� ���� �� = ��, 1(ad-bc) != 0
solve(A)
A <- matrix(c(1, 1, -1, 1), nrow = 2, ncol =2)
A
B <- matrix(c(3,1), nrow = 2, ncol = 1)
B

solve(A) %*% B


# 3.3.4 ��ġ ���(Transpose Matrix) 
# ��� ���� �ٲ�
# t(matrix)
A
t(A)



# 4. Array ----
# ������ ����
# �ϳ��� ������ ������ ����
# vector, matrix �� Ȯ��

# 4.1 Array ����� ----
# array(vector, dim = )
array(1:4, dim = 10)     # array & vector �� ������ �ΰ��� ����
array(1:9, dim = c(3,3))    # array & matrix �� ������ �ΰ��� ����
arr = array(1:18, dim = c(3, 3, 2))

# 4.2 Array�� �Ӽ� ----
# dim(array) : ����
dim(arr)


# 5. Data.Frame ----
# ��� ���� �����Ǿ� ����, 2���� ����
# ���� ���� ������ ������ ���� �� ����
# ��, �ϳ��� ������ �ϳ��� ������ ������ ����
# R���� �⺻������ �����Ͷ�� �ϸ�, data.frame �̴�.
# Recycling rule �� ������� ����


# 5.1 data.frame �����  ----
# data.frame(vector) or data.frame(matrix)
id <- 1:3
hobby <- c("watcing movies", "bycle", "exercise")
movie <- c(1, 0.5, 10)
traffic <- c(100, 100, 40)
survey <- data.frame(id, hobby, movie, traffic)
survey
View(survey)



# 6. List ----
# ���� ������ ������ ������
# element �� vector, factor, matrix, array, data.frame, list �� ������ ����

# result[1] != result[[1]]  >> 
# result[1] �� list�� header�� ����(list), result[[1]]�� header ������(vector ��) > 
# ��� �ٸ��� ����

# 6.1 List ����� ----
# list(vector, factor, matrix, array, data.frame, list)
gender.factor <- factor(c("M", "M", "F", "M", "M"))
result <- list(hobby, gender.factor, survey)
result

result[1]   # ��� : List
result[[1]]   # ��� : vector
result[3]
result[[3]][1, ,drop = FALSE]

result[2]
result[[2]]

result[3]
result[[3]]














