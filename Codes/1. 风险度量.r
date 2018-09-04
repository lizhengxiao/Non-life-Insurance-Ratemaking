# ==============================================================================================
# 1. 风险度量
# ==============================================================================================
# 例：损失的均值为100，标准差为223.607
# 用正态分布，帕累托分布和 Weibull 分布计算在 90%，99% 和 99.9% 水平的 VaR
library(actuar)
q <- c(0.90,0.99,0.999)
varNorm <- qnorm(q, mean = 100, 223.607) # 正态分布
varPar <- actuar::qpareto(q, scale = 120, shape = 2.2) # 帕累托分布
varWei <- qweibull(q, shape = 0.5, scale = 50)  # Weibull分布

result <- data.frame(q, varNorm, varPar,varWei)
result

# ==============================================================================================
# 扭曲函数 (对参数为2的指数分布进行扭曲,扭曲函数为g(t)=t^0.5)
# ==============================================================================================
x = seq(0.01,10,0.001)
a = 2
f1 = 1/a*exp(-x/a)
f2 = 1/(2*a)*exp(-x/(2*a))
plot(x, f1, pch ='', ylab = '密度函数', main = '对参数为2的指数分布进行扭曲,扭曲函数为g(t)=t^0.5')
lines(x, f1, col = 1)
lines(x, f2, col = 2)
text(3.5, 0.4, expression(指数分布的密度函数: f(x)==frac(1,theta)*e^(-x/theta)),col=1)
text(6.5, 0.15, expression(扭曲后的密度函数: tilde(f)(x)==frac(1,2*theta)*e^(-x/(2*theta))),col=2)

s1 = exp(-x/a)
s2 = s1^0.5
plot(x, s1, pch = '', ylab = '生存函数', main = '对参数为2的指数分布进行扭曲,扭曲函数为g(t)=t^0.5')
lines(x, s1, col = 1)
lines(x, s2, col = 2)
text(2.5, 0.2,expression(指数分布的生存函数: S(x)==e^{x/theta}),col=1)
text(6, 0.6,expression(扭曲后的生存函数: g(S(x))==e^{x/(2*theta)}),col=2)

# ==============================================================================================
# 课堂练习
# ==============================================================================================
set.seed(111)
loss = c(rlnorm(100, 0, 1), rep(2, 40))
p = 1:length(loss)/length(loss)
plot(sort(loss), p, type = "s")
VaR = quantile(loss, 0.99)
VaR
TVaR = mean(loss[loss > VaR])
TVaR

# ==============================================================================================
# 课堂练习
# 假设损失服从指数分布，均值为10。当 r = 50时，计算PH风险度量值。
# ==============================================================================================
##方法一
s1 = function(x)  (1 - pexp(x, rate = 1/10))^(1/50)
integrate(s1,  0,  Inf)$value

##方法二
s2 = function(x)   exp(-x/10/50)
integrate(s2,  0,  Inf)$value


# ==============================================================================================
# 课堂练习
# 假设损失服从伽马分布，形状参数为 shape = 2，尺度参数为 scale = 1000，绘制 PH 变换的风险度量值
# 和 Wang 变换的风险度量值随着风险厌恶系数变化的曲线
# ==============================================================================================
# 定义gamma分布的生存函数
S <- function(x) 1 - pgamma(x, shape = 2, scale = 1000)
# PH 变换
r <- seq(1, 10, by = 0.1)
PH <- NULL
for(i in 1: length(r)){
  S_PH <- function(x) S(x)^(1/r[i])
  PH[i] <- integrate(S_PH, 0, Inf)$value
}
# Wang 变换
Wang <- NULL
alpha <- seq(0.5, 0.99, by = 0.01)
k <- qnorm(alpha)
for(i in 1: length(alpha)){
  S_Wang <- function(x) pnorm(qnorm(S(x)) + k[i])
  Wang[i] <- integrate(S_Wang, 0, Inf)$value
}
# 绘图
par(mfrow = c(1, 2))
plot(r, PH, type = 'l')
plot(alpha, Wang, type = 'l')

# ==============================================================================================
# 课堂练习
# 用形状参数为 shape = 2，尺度参数为 scale = 1000 生成 500 个随机数，并基于随机数绘制两个风险度量值的趋势
# ==============================================================================================
# 生成随机数
set.seed(123)
x <- rgamma(n = 500, shape = 2, scale = 1000)
PH <- Wang <- NULL
# 伽马分布的生存函数(经验生存函数)
S  <- seq(1, 1/length(x), -1/length(x))
# PH 变换
r <- seq(1, 10, by = 0.1)
for(i in 1: length(r)){
  PH[i] <- sum(diff(sort(c(0, x)))*S^(1/r[i]))
}
# Wang 变换
alpha <- seq(0.5, 0.99, by = 0.01)
k <- qnorm(alpha)
for(i in 1: length(alpha)){
  Wang[i] <- sum(diff(sort(c(0, x)))*pnorm(qnorm(S) + k[i]))
}
# 绘图
par(mfrow = c(1, 2))
plot(r, PH, type = 'l')
plot(alpha, Wang, type = 'l')

# ==============================================================================================
# 指数保费原理
# ==============================================================================================
shape = 2; scale = 500
GAM = function(a) -shape*log(1-scale*a)/a
curve(GAM(x),xlim = c(0,1/501), xlab='指数原理的风险厌恶系数',ylab='指数保费原理下的风险保费',col=2,lwd=2)
text(0.0007,4000,'X服从伽马分布(shape=2,scale=500)')
text(0.0007,5000,expression(H(alpha)==frac(1,alpha)*log(E(exp(alpha*X)))))


# ==============================================================================================
# Esscher principle (保费原理)
# ==============================================================================================
par(mfrow = c(1, 1))
h = 0.002; shape = 2; scale = 100
f = function(x) dgamma(x, shape = shape, scale = scale)
f2 = function(x) dgamma(x, shape = shape, scale = scale)*exp(h*x)
M = integrate(f,0,Inf)$value
g = function(x)  dgamma(x, shape = shape, scale = scale)*exp(h*x)/M
curve(f(x), xlim = c(0,1000), ylim = c(0,0.008))
curve(g(x), xlim = c(0,1000), col = 2, lty = 2, lwd = 2, add = T)
text(500,0.006,'虚线为Esscher变换后的密度函数,h=0.002,
     实线表示原分布的密度函数，为伽马(shape=2,scale=100)')

