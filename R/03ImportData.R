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
# ������ Ư�� ����
# data <- read.csv(file = "directory/filename.csv"
#                  header = TRUE)
company <- read.csv(file = "C:/R/Bigdata/company.csv",
                    header = TRUE)
company

# 3. .xls file  ----
# �⺻ ��ɿ��� �� ����
# �߰� ���=Package=Library ��ġ�ϰ� �ε��ϸ� ��
# "readxl" : �ص鸲 ���� package �� ��ǥ�� 

# 3.1 ��Ű�� ��ġ�ϱ�
# ��Ű�� ��ġ�� ���� ��ǻ�Ϳ��� �ѹ��� ����
# �� ��Ű���� ������Ʈ �Ǹ� �缳ġ
# install.packages("packagesName")
install.packages("readxl")


# 3.2 ��Ű�� �ε��ϱ�
# RStudio �� �����Ҷ����� �ʿ� �� ���ɾ� ����
# library(packageName)    > ū����ǥ ����
# Imputation : ��ü 
library(readxl)

# NA : Nat Available = Missing Value = ����ġ, ������
# data <- readxl::read_excel(path = "directory/fileName.xls",
#                            sheet = "sheetName" or sheetIdex,
#                            col_names = TRUE)
# ��Ű�� ���� function name �� ��ĥ�� �����Ƿ� package::function ������ ���� ���� ��������
reading <- readxl::read_excel(path = "C:/R/Bigdata/reading.xlsx",
                              sheet = 1,
                              col_names = TRUE)
reading


reading2 <- readxl::read_excel(path = "C:/R/Bigdata/reading.xlsx",
                              sheet = "data",
                              col_names = TRUE)
reading2


# �۾�����(Working Directory)
# 1. ���� ������ �۾����� �˾Ƴ��� : getwd()
getwd()
# 2. ���Ӱ� �۾����� �����ϱ� : setwd("directory")
setwd("C:/R/Bigdata/")

reading3 <- readxl::read_excel(path = "reading.xlsx",
                               sheet = "data",
                               col_names = TRUE)
reading3



# 4. DataBase





# ���ͳ��� �ȵǴ� ��� ��Ű�� ��ġ
# 1�ܰ� : ���ͳ��� �Ǵ� ��ǻ�ͷ� ��
# 2�ܰ� : USB�� ���� �ϵ忡 �ش� ��Ű�� �ٿ�ε�
# 3�ܰ� : ���Ȱ˻縦 ����� �Ŀ� �ش� ��ǻ�ͷ� ����
# 4�ܰ� : ��ġ
# 5�ܰ� : install.pakages("directory/fileName", repos = NULL)
# repos : ������ ��ġ, ������ �ּ�
install.packages("C:/R/Bigdata/antiword_1.1.zip", repos = NULL)
library(antiword)







