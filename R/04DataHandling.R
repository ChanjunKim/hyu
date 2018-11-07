#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
# Lecture : Data Handling = Data Pre-processing
#           Data Wrangling
# Date : October 8th, 2018
# Author : Chanjun Kim
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#


# ��Ű�� ��ġ, �ε�
# ggplot2(grammar graphic) : �ð�ȭ�� ��ǥ�� ��Ű��
# ���� ������ : ggplot2::diamonds
install.packages("ggplot2")
library(ggplot2)
# DT
install.packages("DT")
library(DT)


install.packages("dplyr")
library(dplyr)

install.packages("writexl")
library(writexl)

# �۾�����
setwd("C:/R/Bigdata/")


# ������ �о����
# ggplot2::diamonds

# 1. ������ ��ü ���� ----
# 1.1 data   ----
# �ֿܼ� ���
# �����Ͱ� ���� �� ���
diamonds


# 1.2 View(data)   ----
# editor window �� ���
# �����Ͱ� ���� �� ���
View(diamonds)


# 1.3 DT::datatable(data) ----
# web ���·� ���
DT::datatable(diamonds) 


# 2. �������� �Ϻ� ���� ----
# 2.1 head(data, n = 6) : default = 6   ----
# �ܺ� �����͸� �о���� �� Ȯ���ϱ� ���Ͽ�
# �ֿܼ� ���
head(diamonds)
head(diamonds, n = 10)

# 2.2 tail(data, n = 6)   ----
# �ֿܼ� ���
tail(diamonds)
tail(diamonds, n = 10)


# 2.3 View(head or tail(data, n = 6)) ----
View(head(diamonds))
View(tail(diamonds))


# 2.4 DT::datatable(head(data)) ----
DT::datatable(head(diamonds))
DT::datatable((diamonds))


# 3. �������� ����(Structure) ���� ----
# str(data)
str(diamonds)

# �ڵ�ǥ : data �̸� > ���� �̸� > ���� Ư�� > ���� ���� ���� �����س��� ��


# 4. �������� �Է¿��� üũ
# summary(data)
summary(diamonds)

id <- 1:5
address <- c("�����", "������", "��걸", "������", "����")
dwell <- c(26, 20, 3, 1, 3)

home <- data.frame(id, address, dwell, stringsAsFactors = FALSE)
home
str(home)
summary(home)
home$address <- as.factor(home$address)



# 5. Data.Frame �� �Ӽ�   ----
# 5.1 ���� ���� : nrow(data) ----
# ��� : vector
nrow(diamonds)

# 5.2 ���� ����(������ ����) : ncol(data)   ----
# ��� : vector
ncol(diamonds)

# 5.3 ���� �̸� : rownames(data)   ----
# ��� : vector
rownames(diamonds)

# 5.4 �� = ������ �̸� : colnames(data)   ----
colnames(diamonds)

# 5.5 ����(Dimension) : dim(data)   ----
dim(diamonds)
dim(diamonds)[1]
dim(diamonds)[2]
length(diamonds)


# 5.6 ������ �̸� : dimnames(data)    ----
# ��� : list
dimnames(diamonds)
dimnames(diamonds)[1]   
dimnames(diamonds)[[1]]
dimnames(diamonds)[2]   
dimnames(diamonds)[[2]]



# 6. Data's Slicing   ----
# data[rowIndex, colIndex]

# 6.1 �� = ����    ----
# data[ , colIndex]
# 6.1.1 �� = ������ ��ġ�� �� ��
diamonds[ , 1]
diamonds[ , 2]

# ���� 1
# 1, 9, 10 ��° ���� �� ���� ����������
diamonds[ , c(1, 9, 10)]

# ���� 2
# 4~8 ��°
diamonds[, 4:8]

# ���� 3
# Ȧ�� ��°
diamonds[ , seq(from = 1, to = ncol(diamonds), by = 2)]


# 6.1.2 ���� �̸��� �˶�
diamonds[ , "carat"]
diamonds[ , 'cut']

diamonds[ , c("x", "y", "z")]



# 6.1.3 �� = ���� �̸��� ��Ģ(����)�� ���� �� 
# grep(pattern, textData, value = TRUE or FALSE)
# grep : general regular expression
# [0-9] : ��� ����
# [a-Z] : ��� ��ҹ����� ���ĺ�
# grep("^[x-z]$", colnames(diamonds), value = TRUE)
# t �Ǵ� a�� �����ϴ� ������?
# "[t|a]"
# t �Ǵ� a�� �����ϴ� ������?
# "^[t|a]"
# t �Ǵ� a�� ������ ������
# "[t|a]$"

colnames(diamonds)

# 6.1.3.1 ������ �߿��� t��� ���ڸ� �����ϴ� ��������?
# carat, cut, clarity, depth, table
# 1, 2, 4, 5, 6
grep("t", colnames(diamonds), value = TRUE)    # ������
grep("t", colnames(diamonds), value = FALSE)    # ������ ��ġ
diamonds[, grep("t", colnames(diamonds), value = TRUE)]
diamonds[, grep("t", colnames(diamonds), value = FALSE)]


# 6.1.3.2 ������ �߿��� t��� ���ڷ� �����ϴ� ��������?
# table : 6
grep("^t", colnames(diamonds), value = TRUE)    # ������
grep("^t", colnames(diamonds), value = FALSE)    # ������ ��ġ
diamonds[, grep("^t", colnames(diamonds), value = TRUE)]
diamonds[, grep("^t", colnames(diamonds), value = FALSE)]


# 6.1.3.3 ������ �߿��� t��� ���ڷ� ������ ��������?
# carat, cut : 1, 2
grep("t$", colnames(diamonds), value = TRUE)    # ������
grep("t$", colnames(diamonds), value = FALSE)    # ������ ��ġ
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


# 6.2 ��  ----
# data[rowIndex, ]

# 6.2.1 ���� ��ġ�� �� ��
diamonds[1, ]
diamonds[c(1, 9, 10), ]
diamonds[4:8, ]
diamonds[seq(from = 1, to = nrow(diamonds), by = 100), ]


# 6.2.2 ������ �����ϴ� ���
# 6.2.2.1 cut�� "Ideal" �� ������
diamonds[diamonds$cut == "Ideal" , ]
# cut �� Ideal�� 53940 ���� recycle �� �� ����

# 6.2.2.2 price �� 18000  �̻��� ������
diamonds[diamonds$price >= 18000 , ]


# 6.2.2.3 cut == ideal & price >= 18000 �̻��� ������
diamonds[(diamonds$cut == "Ideal") & (diamonds$price >= 18000) , ]


# 6.2.2.4 cut == ideal | price >= 18000 �̻��� ������
diamonds[(diamonds$cut == "Ideal") | (diamonds$price >= 18000) , ]


# ���� 5
# CUT �� Ideal �̰ų� �Ǵ� Good
diamonds[diamonds$cut == "Ideal" | "Good", ]   # �ȵ�

diamonds[(diamonds$cut == "Ideal") | (diamonds$cut == "Good"), ]

diamonds[diamonds$cut == c("Ideal", "Good"), ]  # Recyling rule ������ ����!
diamonds[diamonds$cut %in% c("Ideal", "Good"), ]  # ���� �������� �ٰ����� ���� ����


# 6.2.3 dplyr::filter(data, ����)
dplyr::filter(diamonds, cut == "Ideal")
dplyr::filter(diamonds, price >= 18000)
dplyr::filter(diamonds, cut == "Ideal" & price >= 18000)
dplyr::filter(diamonds, cut == "Ideal" , price >= 18000)  # &�� ����
dplyr::filter(diamonds, cut == "Ideal" | price >= 18000)
dplyr::filter(diamonds, cut == "Ideal" & "Good")
dplyr::filter(diamonds, cut %in% c("Ideal", "Good"))


# 6.3 ��� �� ----
# data[rowIndex, colIndex]
# cut�� "Ideal" �̰� price �� 18000 �̻��� �������� 
# x y z �̶�� ������ ����������

diamonds[(diamonds$cut == "Ideal") & (diamonds$price >= 18000), c("x", "y", "z")]


# 6.3.2 dplyr::filter, dplyr::select()
# column �� ������ ����ϱ� ������ filter�� ���� �����
diamonds2 <- dplyr::filter(diamonds, cut=="Ideal", price >= 18000)
diamonds3 <- dplyr::select(diamonds2, x:z)
diamonds3


# %>% : pipe operator, chain 
diamonds %>% 
  dplyr::filter(cut == "Ideal", price >= 18000) %>% 
  dplyr::select(x:z) %>% 
  head()



# 7. ���ο� ����(��) ����� ----
# data$newVariable <- �۾�

# 7.1 ����    ----
diamonds$xyz.mean <- (diamonds$x + diamonds$y + diamonds$z) / 3
View(diamonds)
diamonds$xyz.mean2 <- rowMeans(diamonds[ , c("x", "y", "z")])
# rowSums(), colMeans(), colSums()



# 7.2 ��ȯ(Transformation)   ----

# 7.2.1 log ��ȯ
diamonds$price.log10 <- log10(diamonds$price)


# 7.2.2 root ��ȯ
diamonds$price.root <- sqrt(diamonds$price)


# 7.2.3 1/y ��ȯ(���� ��ȯ)
diamonds$price.inverse <- 1/(diamonds$price)

# Box - Cox transformatioin

 

# 7.3 ������ ����    ----
# price �� ���� ����:���(���� ~ ���� : ��ް� : ������ ��) ���� grouping �ϴ� �۾�

# 7.3.1 cut()
# data$newVariable <- cut(data$variable, 
#                         breaks = ������ ����,
#                         right = TRUE or FALSE) # right = TRUE �̸� right <= & left > ������ ��(�ʰ� ����)



diamonds$price.group <- cut(diamonds$price,
                            breaks = seq(from = 0 , to = 20000, by = 5000),
                            right = FALSE)
# cut() �Լ��� ����ϸ� ���ο� ������ ������ factor �� ��
levels(diamonds$price.group)
levels(diamonds$price.group) <- c("5000�̸�",
                                  "5000~10000",
                                  "10000~15000",
                                  "15000�̻�")
table(diamonds$price.group)

# ����8
# carat -> carat.group
# 0 ~ 1.5: 1.5 ~ 3.0 : 3.0 ~ 4.5 : 4.5 ~ 6.0

diamonds$carat.group <-  cut(diamonds$carat,
                             breaks = seq(from = 0 , to = 6, by = 1.5),
                             right  = FALSE)

levels(diamonds$carat.group) <- c("1.5 �̸�",
                                  "1.5 ~ 3.0",
                                  "3.0 ~ 4.5",
                                  "4.5 �̻�")

View(diamonds)


# 7.3.2 ifelse()
# ifelse(����, Value of Truth, Value of False)

# 7.3.2.1 ������ ����
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



# 7.3.2.2 �پ��� ���ָ� ����� ��
# cut -> cut.group
# Fair : Non-Ideal
# Good : Non-Ideal
# Very Good : Non-Ideal
# Premium : Non-Ideal
# Ideal : Ideal

diamonds$cut.group <- ifelse(diamonds$cut == "Ideal", "Ideal", "Non-Ideal")


# 7.4 dplyr::matate(data, newVariable = ����, ��ȯ ��)
diamonds <- diamonds %>% 
  dplyr::mutate(carat.log = log10(carat))
View(diamonds)

diamonds <- diamonds %>%
  dplyr::mutate(xyz.sum = x + y + z)



# 8. ���� �����ϱ� ----

# 8.1 Slicing ----
# diamonds  <-  diamonds[ , c("carat", "cut", "color")]

# 8.2 data$variable <-  NULL
diamonds$price.group2 <-  NULL
diamonds$price.group3 <-  NULL


# 9. �ܺε����ͷ� �����ϱ� ----

# 9.1 .txt file ���� ----
# write.table(data,
#             file = "directory/fileName.txt",
#             sep = " " or "\t" or "," ,
#             row.names = FALSE)     # ���� �̸��� �������� ����

write.table(diamonds,
            file = "diamonds_1010.txt",
            sep = ",",
            row.names = FALSE)



# 9.2 .csv file ���� ----
# write.csv(data, 
#           file = "directory/filename.csv",
#           row.names = FALSE)

write.csv(diamonds,
          file      = "diamonds_1010.csv", 
          row.names = FALSE)


# 9.3 .xls(excel) file ���� ----
# writexl::write_xls or wirte_xlsx(data,
#                                  path = "directory/filename.xlsx")
writexl::write_xlsx(diamonds,
                    path = "diamonds_1010.xlsx")



# 10. RData �� �����ϱ� ----
# save(data,
#      file = "directory/filename.RData")

save(diamonds, file = "diamonds_1010.RData")


# 11. R data �ҷ����� ----
# load(file = "directory/filename.RData")
load(file = "diamonds_1010.RData")



# 12. �������� ��� ����   ----
# ����ڰ� ���� ������
# ls()
# list segment
# ls() �� ����� character vector
ls()


# 13. ������ �����ϱ�    ----

# 13.1 ������ ������ �����ϱ�    ----
# rm(data1, data2, ....)
# rm : remove
rm(traffic, tab, survey)
ls()


# 13.2 ��� ������ �����ϱ�    ----
# rm(list = ls())
rm(list = ls())
ls()





















# 14. �������� ����    ----

# 14.1 ������ ����    ----
# sort(vector, decreasing = FALSE or TRUE)  : default = FALSE, ��������
feet <- c(265, 285, 240, 270, 265)
feet
sort(feet)
sort(feet, decreasing = TRUE)
# ���� ���� ��� ���� �Էµ� ���� ���� ��



# 14.2 Data.Frame �� ���� ----
# order(data$variable, decreasing = FALSE or TRUE)   : default = FALSE, ��������
# data[order(data$variable, decreasing = FALSE or TRUE) , ]  ���� ǥ��
order(feet)
# ������ �ε����� ������ ��
feet[order(feet)]
feet[order(feet, decreasing = TRUE)]

# cut : ��������
diamonds[order(diamonds$cut, decreasing = FALSE), ]

# cut : ��������
diamonds[order(diamonds$cut, decreasing = TRUE), ]

# cut : ��������, price : ��������
diamonds[order(diamonds$cut, diamonds$price, decreasing = FALSE) , ]

# cut : ��������, price : ��������
diamonds[order(diamonds$cut, diamonds$price, decreasing = TRUE) , ]

# cut : ��������, price : ��������
# diamonds[order(diamonds$cut, order(diamonds$price, decreasing = FALSE), decreasing = TRUE) , ]
diamonds[order(diamonds$cut, -diamonds$price, decreasing = FALSE) , ]

# cut : ��������, price : ��������
diamonds[order(diamonds$cut, -diamonds$price, decreasing = TRUE) , ]
# data.set �� numeric �� ���� - �� �۵�

# cut : ��������, color : ��������
# R �� �⺻ ��ɿ����� �Ұ���
# dplyr::arrange(data, variable, desc(variable))       : default �� ��������

dplyr::arrange(diamonds, cut, desc(color))

diamonds %>% 
  dplyr::arrange(cut, desc(color))


# ����
# xyz.mean ���� ����, �� ���� �������� �������� ������ �� ���� 5���� ���̵���
rm(diamonds$xyz.mean, diamonds$xyz.mean2)
diamonds %>%
  dplyr::mutate(xyz.mean = (x + y + z)/3 ) %>% 
  dplyr::arrange(desc(xyz.mean)) %>% 
  head(n = 5)



# 15. ������ ��ġ��    ----

# 15.1 rbind(data1, data2, ....)    ----
# �����͸� ��/�Ʒ��� ��ħ
# �������� ������, ������ ��ġ�� �����ؾ� ��(ex. 2016, 2017 �����͸� ��ħ)
DF1 <- data.frame(id = 1:3,
                  age = c(10,20,30),
                  gender = c("F", "F", "M"))
DF2 <- data.frame(id = 4:7,
                  age = c(40, 50, 60, 70),
                  gender = c("M", "F", "M", "F"))
rbind(DF1, DF2)


# 15.2 cbind(data1, data2, ....)    -----
# �����͸� ����/���������� ��ħ
# ������ ���̾����
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


