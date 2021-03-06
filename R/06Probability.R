# 평균이 170, 표준편차 10인 정규 분포에서
# 1. 170 이하의 면적 = 확률은?
# pnorm(x, mean = , sd = )
pnorm(170, mean = 170, sd = 10)

pnorm(190, mean = 170, sd = 10)

1 - pnorm(190, mean = 170, sd = 10)
1 - pnorm(2, mean = 0, sd = 1)
1 - pnorm(173, mean = 170, sd = 10)   # 173 이상의 확률

# P(140 < X < 200)

pnorm(200, mean = 170, sd = 10) - pnorm(140, mean = 170, sd = 10)


# t 분포 pt
# chisq 분포(카이스퀘어) : pchisq
# beta 분포 : pbeta

# 모집단이 정규 분포를 따르면
# X ~ N(μ, σ**2)



# 가설검정
# 가설 : 모집단에 대한 입장
# 모집단 : 모수(Parameter)에 대한 입장 : 모평균에 대한 입장

# 귀무가설 : 기존의 입장
# 대립가설 : 새로운 입장

# 유의 확률 : 표본에서 관찰된 값이 귀무가설이 맞다는 가정 하에서 얼마나 일어날까를 알려주는 확률값
# 유의 확률이 크다는 것 = 흔한 사건 = 귀무가설 지지
# 유의 확률이 작다는 것 = 일어나기 힘든 사건 = 대립가설 지지
# 유의 확률 = 5% vs 2% : 2%면 대립






