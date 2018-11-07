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

# 1. ������(Operator) ----
# 1.1 ��������� ----
# +, -, *, /, **, ^, %%, %/%
3 + 4
3 - 4
3 * 4
3 / 4
3 ** 4
3 ^ 4
13 %% 4 # ������
13 %/% 4 # ��

# ���� 1
# ��Ʈ 3�� ���� ��������ڸ� �̿��ؼ� ���Ͻÿ�.
3 ** 0.5
3 ^ (1/2)
sqrt(3)

# 1.2 �Ҵ� ������ ----
# <-, =
# <- : �Ϲ����� �Ҵ� ������
# = : �Լ� ���� argument�� ������ �� ����ϴ� �Ҵ� ������

# 1.3 �� ������ ----
# <, >, <= , >=, ==, !=, !

# 1.4 ���� ������ ----
# &, |
# & : and, ���� ���� ������ ���ÿ� ������ �� TRUE
# | : or, ���� ���� ���� �߿� �ϳ��� �����ص� TRUE
(3 > 4) & (5 > 4)
(3 > 4) | (5 > 4)

# 2. ������ ���� (Type of Data) ----
# 2.1 ��ġ��(Numeric)
# 2.1.1 ����(integer)
x1 <- 10L
typeof(x1)
class(x1)

# 2.1.2 �Ǽ�(double)
x2 <- 10.2
typeof(x2)
class(x2)

# 2.2 ������(Character)
x3 <- 'Love is not feeling'
typeof(x3)
class(x3)

# 2.3 ������(Logical)
x4 <- FALSE
x5 <- TRUE
typeof(x4)
typeof(x5)
class(x4)

# 3. ������ ������ �˾Ƴ��� ----
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

# 4. ���������� ������ ���� �����ϱ�(Parsing) ----
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

# ������ ������ �켱����
# character > numeric > logical
# 0 > FALSE , !0 > TRUE