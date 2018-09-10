# ==============================================================================================
# 2. 损失金额模型
# ==============================================================================================
# -----------------------------------------------------------------------------------
# 2.1 逆高斯分布图
# -----------------------------------------------------------------------------------
x = seq(0, 4, 0.01)
f1 = sqrt(0.5/(2*pi*x^3))*exp(-0.5*(x-1)^2/(2*1^2*x))
f2 = sqrt(1/(2*pi*x^3))*exp(-1*(x-1)^2/(2*1^2*x))
f3 = sqrt(5/(2*pi*x^3))*exp(-5*(x-1)^2/(2*1^2*x))
f4 = sqrt(10/(2*pi*x^3))*exp(-10*(x-1)^2/(2*1^2*x))
matplot(x, cbind(f1, f2, f3, f4), type='l', lty=1:4, lwd=2)
legend(2, 1, c('IG(1, 0.5)', 'IG(1, 1)', 'IG(1, 5)', 'IG(1, 10)'), lty=1:4, col=1:4, lwd=c(3, 3, 3, 3))
# -----------------------------------------------------------------------------------
# 2.2 Tweedie 分布模拟
# -----------------------------------------------------------------------------------
lambda = 1                         # 泊松的参数
alpha = 10  ;   beta = 2      # 伽马分布的参数，beta为rate参数
n = 10000                            # 模拟次数
Y = NULL                              # tweedie模拟值
set.seed(11)
for ( i in 1:n) {
  N = rpois(1,  lambda)
  Y[i] = sum(rgamma(N, shape =  alpha,  rate = beta))
}
hist(Y,  breaks = 50,  col = 'grey',  main = 'Tweedie模拟')

# -----------------------------------------------------------------------------------
# 2.3 假设X服从参数为 (3,  4) 的伽马分布, 求g(X)的分布。
# -----------------------------------------------------------------------------------
# 伽马分布的密度函数
f = function(x)  dgamma(x,  3,  4)
### 尺度变换,   Y = 2X
f1 = function(x)  f(x/2)/2
### 幂变换,  Y = X ^ (1/2)
f2 = function(x)  f(x^2) * 2 * x
### 逆变换,  Y = 1/X
f3 = function(x)   f(1/x)/x^2
### 指数变换,  Y = exp(X)
f4 = function(x)   f(log(x))/x
### 对数变换,   Y = log(X)
f5 = function(x)    f(exp(x)) * exp(x)
x <- seq(0, 4, 0.01)
matplot(x, cbind(f1(x), f2(x), f3(x), f4(x), f5(x)), type='l', lty=1:4, lwd=2)
legend(3, 1.5, c('X', '2X', 'X^1/2', '1/X', 'ln(x)'), lty=1:4, col=1:4, lwd=c(3, 3, 3, 3))


# -----------------------------------------------------------------------------------
# 2.4 例： 两个对数正态分布的参数分别为(1, ????)和(????, ????), 如果按照30%和70%的比例把它们进行混合, 求混合分布的密度函数。
# -----------------------------------------------------------------------------------
p = 0.3
m1 = 1; s1 = 2
m2 = 3; s2 = 4
## 混合对数正态分布的密度函数
f = function(x)  p * dlnorm(x,  m1,  s1) + (1 - p) * dlnorm(x,  m2,  s2)
curve(f,  xlim = c(0,  1),  ylim = c(0,  2),   lwd = 2,  col = 2)
curve(dlnorm(x,  m1,  s1),  lty = 2,  add = TRUE)
curve(dlnorm(x,  m2,  s2),  lty = 3,  add = TRUE)
legend("topright",  c("mixed lnorm",  "lnorm(1, 10)",  "lnorm(2, 20)"),  lty = c(1,  2,  3),  col = c(2,  1,  1),  lwd = c(2,  1,  1))


# -----------------------------------------------------------------------------------
# 2.5 混合指数分布
# -----------------------------------------------------------------------------------
x = seq(0,  10,  0.01)
y1 = 1-pexp(x,  rate = 2)
y2 = 1-pexp(x,  rate = 3)
q = 0.7
y = q*y1 + (1 - q)* y2
matplot(x,  cbind(y1,  y2,  y),  lty=c(2,3,1),type = 'l',  col=c(1,2,4), xlim = c(0,  3), lwd=2, main = '生存函数')
legend('topright',  c('指数（rate = 2）', '指数（rate = 3）',  '混合指数（q = 0.7）'),  lty=c(2,3,1), col=c(1,2,4))


# -----------------------------------------------------------------------------------
# 2.6 各种估计方法的比较
# -----------------------------------------------------------------------------------
# 模拟伽马分布的随机数
set.seed(123);  x = rgamma(50, 2)  
# 调用fitdistrplus程序包
library(fitdistrplus)  
# 用极大似然法估计参数
fit1 = fitdist(x,  'gamma',  method = 'mle')  
# 用矩估计法估计参数
fit2 = fitdist(x, 'gamma', method = 'mme')  
# 用分位数配比法估计参数
fit3 = fitdist(x, 'gamma', method = 'qme', probs = c(1/3, 2/3))  
#用最小距离法估计参数
fit4 = fitdist(x, 'gamma', method = 'mge', gof = 'CvM')  
#输出参数估计结果
fit1  
plot(fit1)

#  运用 optim/optimize 函数对分布的参数进行估计
lower = c(0, 100, 200, 500)    #损失下限
upper = c(100, 200, 500, Inf)  #损失上限
freq = c(15, 20, 10, 5)       #损失次数
# 指数分布的极大似然估计
f1 = function(a) {-sum(freq * log(pexp(upper, a) - pexp(lower, a)))}
optimize(f1,  c(1/10000, 1/100))   #初始值根据矩估计值选定

# -----------------------------------------------------------------------------------
# 2.7 案例分析
# ------------------------------------------------------------------------------------------------
# 调用程序包CASdatasets中的数据集freMTPLsev, 应用适当的模型拟合ClaimAmount的分布。
# 准备包
library(CASdatasets)
#准备数据
data(freMTPLsev)  
x <- freMTPLsev$ClaimAmount
summary(x)
quantile(x, 90:100/100)
x <- x[x<=100000]
hist(x, breaks = 100000, xlim = c(0, 10000))
#------------把索赔金额x分段---------------
c1 = 400; c2 = 1000; c3 = 1300; c4 = 5000
index1 <- which(x<=c1)
index2 <- which(x>c1 & x<=c2)
index3 <- which(x>c2 & x<=c3)
index4 <- which(x>c3 & x<=c4)
index5 <- which(x>c4)
#对数正态分布拟合
fit1 = fitdist(x[index1], 'lnorm')
fit2 = fitdist(x[index2], 'lnorm')
fit3 = fitdist(x[index3], 'lnorm')
fit4 = fitdist(x[index4], 'lnorm')
##右尾用帕累托分布拟合
dpareto = function(x, alpha, theta=c4) alpha*theta^alpha/x^(alpha+1) 
ppareto = function(x, alpha, theta=c4) 1-(theta/x)^alpha
fit5=fitdist(x[index5], 'pareto', start = 5)  #帕累托从c3以后有定义

hist(x[index5], freq = F)
curve(dpareto(x, fit5$estimate[1]), add = T)

#------------得到经验分布的估计参数-----------
m1 <- fit1$estimate[1]
s1 <- fit1$estimate[2]
m2 <- fit2$estimate[1]
s2 <- fit2$estimate[2]
m3 <- fit3$estimate[1]
s3 <- fit3$estimate[2]
m4 <- fit4$estimate[1]
s4 <- fit4$estimate[2]
m5 <- fit5$estimate[1]
s5 <- fit5$estimate[2]

#######使用分段拟合的权重
w1 = length(index1)/length(x)
w2 = length(index2)/length(x)
w3 = length(index3)/length(x)
w4 = length(index4)/length(x)
w5 = length(index5)/length(x)

f = function(x) {
  ifelse(x <= c1, w1*dlnorm(x, m1, s1)/(plnorm(c1, m1, s1)),
         ifelse(x > c1 & x <= c2, w2*dlnorm(x, m2, s2)/(plnorm(c2, m2, s2) - plnorm(c1, m2, s2)), 
                ifelse(x > c2 & x<= c3, w3*dlnorm(x, m3, s3)/(plnorm(c3, m3, s3) - plnorm(c2, m3, s3)),
                       ifelse(x > c3 & x<= c4, w4*dlnorm(x, m4, s4)/(plnorm(c4, m4, s4) - plnorm(c3, m4, s4)),
                              w5*dpareto(x, m5)))))
}  

hist(x, breaks=5000, xlim = c(0, 6000), prob=TRUE,  main = "",  xlab = "索赔额", col='grey')
curve(f, xlim=c(0, 6000), add=T,  col=2,  lwd=2)





