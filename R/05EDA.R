#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
# Lecture : EDA(Explorary Data Analysis)
#           Ž���� ������ �м�
# Date : October 10th, 2018
# Author : Chanjun Kim
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#


# �����Ϳ� ������ ����(pattern) �Ǵ� Ư¡�� ã�Ƴ��� �۾�

install.packages("ggplot2")  # Visulization
install.packages("dplyr")    # Data Analysis and Handling
install.packages("RColorBrewer")     # ���� ��Ű��
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

# �۾�����
setwd("C:/R/Bigdata/")

#������ �о����
# ggplot2::diamonds

# ������ ����(������� ����)
# 1. ���� �ڷ� = ������ �ڷ� : ����(����) = character vector or factor, numeric vector
# 2. ���� �ڷ� : numeric vector


# diamonds
diamonds <- diamonds[ , 1:10]
diamonds
# ���� �ڷ� : cut, color, clarity
# ���� �ڷ� : carat, depth, table, price, x, y, z

# 1. �Ϻ���(Uni-variate) ���� �ڷ�   ----
# 1.1 ǥ = ��ǥ(Frequency table)    ----

# 1.1.1 Frequency : ��
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


# 1.1.2 Percent : �����
# prop.table(frequency) : ����(0 ~ 1)
# propotional table
# prop.table(frequency) * 100 : �����

table(diamonds$cut)
prop.table(table(diamonds$cut))*100
sort(prop.table(table(diamonds$cut))*100, decreasing = TRUE)[1:3]
# ������� �Ҽ��� �ڸ����� Ư������ ������ �� �ڸ��� ǥ����
# round( , digits = )  : �Ҽ��� ���° �ڸ����� �ݿø�
round(sort(prop.table(table(diamonds$cut))*100, decreasing = TRUE)[1:3] , digits = 1)

# ����1
# for �� �̿��ؼ� ������ ���� �ڷῡ ���� �� ������� ����Ͻÿ�

for(i in 2:4) {
  print(colnames(diamonds)[i])
  print(round(sort(prop.table(table(diamonds[ , i]))) * 100, digits = 1))
}


for(i in c("cut", "color", "clarity")) {
  print(colnames(diamonds)[i])
  print(round(sort(prop.table(table(diamonds[ , i]))) * 100, digits = 1))
}




# 1.2 �׷���    ----
# 1.2.1 ����׷��� : ���� / ����
# barplot(frequency or percent)
barplot(sort(table(diamonds$cut), decreasing = TRUE))

# ���� ���� : col = "colorName"
barplot(sort(table(diamonds$cut), decreasing = TRUE), col = "magenta4")

# ���� 2
# ���� ������ �� �ٸ��� �Ͻÿ�
barplot(sort(table(diamonds$cut), decreasing = TRUE), 
        col = c("magenta4", "red", "blue", "black", "pink"))

pal <- RColorBrewer::brewer.pal(n = 5, name = "BuGn")

barplot(sort(table(diamonds$cut), decreasing = TRUE), 
        col = rainbow(5))

# ��Ʈ�� ���� : main = "title"
barplot(sort(table(diamonds$cut), decreasing = TRUE), 
        col = "magenta4",
        main = "Cut of Diamonds")

# y�� ���� : ylab = "y axis's label"
# ylab : y label
barplot(sort(table(diamonds$cut), decreasing = TRUE), 
        col = "magenta4",
        main = "Cut of Diamonds",
        ylab = "Frequency")


# y���� ���� : ylim = "y axis's label"
# ylim : y limit
# ���� �׷����� ���� ȿ�� : 0���� �����ϴ� ���� ����.
barplot(sort(table(diamonds$cut), decreasing = TRUE), 
        col = "magenta4",
        main = "Cut of Diamonds",
        ylab = "Frequency",
        ylim = c(0, 25000),
        xlab = "degree of diamonds cut")


# ���� ���� �׷��� : horiz = TRUE
# horiz = horizontal
barplot(sort(table(diamonds$cut), decreasing = FALSE), 
        col = "magenta4",
        main = "Cut of Diamonds",
        ylab = "Frequency",
        xlim = c(0, 25000),
        horiz = TRUE)


# x�� ���� : xlab = "y axis's label"
barplot(sort(table(diamonds$cut), decreasing = TRUE), 
        col = "magenta4",
        main = "Cut of Diamonds",
        ylab = "Frequency",
        xlab = "degree of diamonds cut")


# paste(charater1, character2, ..., sep = )
paste("Love", "is", "Choice")
paste("Love", "is", "Choice", sep = "-")
paste("V", 1:10, sep = "")
# Recyling rule ���� 1:10 ���Ϳ� V�� recycle ��

# ���� 3
# for�� �̿��� ������ ���� �ڷῡ ���� ������ ����׷����� �ۼ��غ�����

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

tolower("Love is Truth") # �ҹ��� ����
toupper("Love is Choice") # �빮�� ����

# stringr    ----
stringr::str_to_title("Love is choice")



# 1.2.2 ���׷���
# pie(frequency or percent)
pie(sort(table(diamonds$cut), decreasing = TRUE),
    col = pal)

# ������ ũ�� : radius = 0.8
pie(sort(table(diamonds$cut), decreasing = TRUE),
    col = pal,
    radius = 1.5)

# �ð� ���� : clockwise = TRUE
pie(sort(table(diamonds$cut), decreasing = TRUE),
    col = pal,
    radius = 1.5,
    clockwise = TRUE)

# ù° ������ ���� ���� : init.angle = 
# �ð� �ݴ� ���� : 0, �ð� ���� : 90  : ������ 90��
pie(sort(table(diamonds$cut), decreasing = TRUE),
    col = pal,
    radius = 1.5,
    clockwise = TRUE)


# ���� 4
# ���� �ڷ� �� ���� ���� ������ ����/���׷����� �ۼ��Ͻÿ�

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


# �׷��� ȭ�� �����ϱ�
# par(mfrow = c(nrow, ncol)) : ����� ä����
# par(mfcol = c(nrow, ncol)) : ������ ä����

# mf : multi frame �� ����

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

# �׷��� ȭ�� �ʱ�ȭ
# par(mfrow = c(1,1))
par(mfrow = c(1,1))
# �׷����� pdf ���Ϸ� �����ϱ�
# pdf(file = "directory/filename.pdf") : �������
# �׷��� �۾�
# dev.off() : ���� �� > graphic device off

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


# pdf ���������� �������� �׷��� �����ϱ�

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


# ggplot2 ��Ű���� �̿��ؼ� �׷����� �ۼ��ϱ�
# ggplot2::ggplot(data = , mapping = aes())

# ggplot2::ggplot(data = , mapping = aes(x = variable))  : ���� �׷���
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



# 2. �Ϻ��� ���� �ڷ��� �м�     ----
# ������ ���� ��
# �ּҰ�, �ִ밪
# ���� : �ִ밪 - �ּҰ�
# ������ ���� ���� : Sturge's Formular ( 1 + 3.3 log10(n))
# ������ �� = ����� �� = ���� / ������ ����
# ù��° ���� : �ּҰ�, ������ ���� : �ִ밪
min(diamonds$price)
max(diamonds$price)
price.range <-  max(diamonds$price) - min(diamonds$price)
interval.count <- 1 + 3.3 * log10(length(diamonds$price))

interval.width <- price.range / 17

diamonds$price.group <- cut(diamonds$price,
                            breaks = seq(from = 0, to = 19000, by = 1000),
                            right = TRUE)
# 2.1 ǥ = ��ǥ    ----

# 2.1.1 ������ ��
table(diamonds$price.group)
sort(table(diamonds$price.group) , decreasing = TRUE)

# 2.2.2 ������ �����
prop.table(table(diamonds$price.group)) * 100
sort(prop.table(table(diamonds$price.group))*100, decreasing = TRUE)
round(sort(prop.table(table(diamonds$price.group))*100, decreasing = TRUE), digit = 1)


# 2.2 �׷���     ----

# 2.2.1 ������׷�(Histogram)
# hist(data$variable, breaks = )
hist(diamonds$price)
hist(diamonds$price,
     xlim = c(0, 20000))
# ������׷��� Sturge's Formular�� ��������
?hist
hist.result <- hist(diamonds$price)
hist.result
str(hist.result)

# List �� Slicing
# list[idx]
# list[[idx]]
# list$index

hist(diamonds$price, 
     breaks = seq(from = 0, to = 20000, by = 1))

hist(diamonds$price, 
     breaks = 20)
# ���⼭ breaks �� ���� ����


# 2.2.2 ���ڱ׸�(Box Plot)
# boxplot(data$variable, range = 1.5)
boxplot(diamonds$price, range = 1)

# IQR = Q3 - Q1
# Inter Quartile Range
# Range * IQR ��ŭ �׸�
# Range : 0.5 ���� 1sigma �� �þ

# ���ܺ� ���ڱ׸�
# boxplot(data$variable ~ data$variable)
# boxplot(�����ڷ� ~ ���� �ڷ�)
boxplot(diamonds$price ~ diamonds$cut)


# ggplot2 ��Ű���� �̿��� ������׷�/���ڱ׸�
# �����佺��
ggplot2::ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_histogram()

ggplot2::ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_histogram(binwidth = 2000)

ggplot2::ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_histogram(binwidth = 2000) +
  facet_wrap(~cut)


# ���ڱ׸�
ggplot2::ggplot(data = diamonds, mapping = aes(x = cut, y = price)) +
  geom_boxplot()



# 2.3 �����跮 = �����跮    ----
# 2.3.1 �߽� = ��ǥ��
# i. Average(Mean)
# mean(data$variable, na.rm = TRUE)
meal.fee <- c(7200, 8000, 7000, NA)
mean(meal.fee)
mean(meal.fee, na.rm = TRUE)
mean(diamonds$price)


# ii. �������(Trimmed Mean)
# 5% ���� ���- ���� ���� 5% ���� ���� 90%�� ������ ����� �� = �̻�ġ ����
# mean(data$variable, trim = 0.05, na.rm = TRUE)
mean(diamonds$price, trim = 0.05)
mean(diamonds$price, trim = 0.1)


# iii. ������(Median)
# median(data$variable, na.rm = TRUE)
median(diamonds$price)


# iv. �ֺ�� = �ֺ�(Mode)
# �ֺ���� ������ ���� ���ɼ��� ����.
# which.max(table(data$variable))
# prettyR::Mode(data$variable)
lunch.fee <- c(5000, 3500, 5000, 5000, 3300, 5000)
table(lunch.fee)
which.max(table(lunch.fee))
which.max(c(100, 200, 300, 4000))

which.max(table(diamonds$price))
prettyR::Mode(diamonds$price)

# Robustness(���Ǽ�) : � ���� ���Ͽ� ������ �� �޴� ����
# Average, Trimmed Mean, Median ���� �̻�ġ�� ���� �����Ͽ� ���


# 2.3.2 ���� = ����
# �����ִ� ������ �ٸ��� �󸶳� �����ұ ��ġȭ�� ��
# �� ���� ũ�� : ���� �ٸ���
# �� ���� ������ : ����ϴ�

# i. ����(Range) : �ִ밪 - �ּҰ�
# diff(range(data$variable))
range(diamonds$price)
diff(range(diamonds$price))

# diff(data$variable) : �ڿ��� ���� ���� ��, �ð迭 ������ ó���� ����

# ii. ���������(IQR : Inter Quartile Range)
# IQR(data#variable)
IQR(diamonds$price)

# iii. ǥ���� �л�(Variance) 
# �����ܰ� ǥ�� ������ ���� ����!
# Degree of Freedom(df:������)
# var(data$variable, na.rm = TRUE)
var(diamonds$price)

# iv. ǥ���� ǥ������(SD : Standard Deviation)
# sd(data$variance, na.rm = TRUE)
sd(diamonds$price)


# v. ������ ���� ����(MAD : Median Absolute Deviation)
# mad(data$variable)
mad(diamonds$price)


# 2.3.3 ������ ���
# i. �ֵ�(Skewness : ��︲) = ��Ī���θ� �˷��ִ� ��
# 0�� ����� ���� ��Ī, ��� : �ʱⰪ�� ��������(��), ���� : �Ĺݰ�
# e1071::skewness(data$variable)
e1071::skewness(diamonds$price)

# ii. ÷��(Kurtosis) = �߽��� �󸶳� �����Ѱ��� �˷��ִ� ��
#                    = �߽ɿ� �󸶳� �����ִ°��� �˷��ִ� ��
# ���ڰ� Ŭ���� �߽��� ������, 0�� �������� ���� ������ �����
# e1071::kurtosis(data$variable)
e1071::kurtosis(diamonds$price)

# 2.3.4 ��Ÿ
# i. �ּҰ� : min(data$variable)
# ii. �ִ밪 : max(data$variable)


# 2.3.5 �����跮�� ���ϴµ� ������ �Լ�
# i. summary()
summary(diamonds$price)
# �� ��� ��, ����� ���� Five Numbers Summary
# �ټ� ��ġ ���, �ټ� ���� ���
summary(dplyr::select(diamonds, -(cut:clarity)))


# ii. by(data$variable, data$variable, functionName)
#     by(�����ڷ�, �����ڷ�, �Լ���)
# ���ܺ��� �����ڷḦ ó����
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
psych::describe(diamonds$price)   # 10% �������
psych::describe(diamonds$price, trim = 0.05)
psych::describe(dplyr::select(diamonds, carat, depth:z))

# psych::describeBy(data$variable, data$variable)
# psych::describeBy(�����ڷ�, �����ڷ�)
# psych::describeBy(data, data$variable)
psych::describeBy(diamonds$price, diamonds$cut)
psych::describeBy(dplyr::select(diamonds, carat, depth:z))

price.by.cut.describe <- psych::describeBy(diamonds$price, diamonds$cut)
str(price.by.cut.describe)
str(price.by.cut.describe)[[1]]


# ������ �����ϱ�
writexl::write_xlsx(str(price.by.cut.describe)[[1]], path = "output2.xlsx")



# iv. dplyr::summarise(data, variableName = functionName)
dplyr::summarise(diamonds,
                 n = n(),
                 Mean = mean(price),
                 SD = sd(price))

# ���ܺ� : dplyr::group_by(variable)
diamonds %>%
  dplyr::group_by(cut) %>% 
  dplyr::summarise(n = n(),
                   Mean = mean(price),
                   SD = sd(price)) %>% 
  dplyr::arrange(desc(Mean)) %>% 
  ggplot2::ggplot(mapping = aes(x = cut, y = Mean)) +
  geom_bar(stat = "identity")


# ����
# cut = "Good" or Very Good
# carat >= 2 diamonds.xyz.sum and 
# xyz.sum divided by cut �� ���� ������׷��� �׸��ÿ�

diamonds %>% 
  dplyr::filter(cut %in% c("Good", "Very Good"), carat >= 2) %>% 
  dplyr::mutate(xyz.sum = (x + y + z)) %>%
  ggplot2::ggplot(mapping = aes(x = xyz.sum)) +
  geom_histogram() +
  facet_wrap(~cut)

  

# %>% 
#   xyz.mean <- mean(x, y, z)


# ������ Populatino
# ǥ�� Sample
# ǥ���� �Ϻθ� ������ �������� �߷�(Inference)
# �߷� : 1. ����, 2. ��������
# ������ Point estimation
# ���� ����
