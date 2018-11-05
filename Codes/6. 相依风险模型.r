# ==============================================
# 基本 Copula 函数的程序代码
# ==============================================

library(rgl)
u1 <- seq(0, 1, length = 100)
u2 <- seq(0, 1, length = 100)
f <- function(u1, u2) u1 * u2  #独立copula
CI <- outer(u1, u2, f)
persp3d(u1, u2, CI, col = "blue")
CU <- array(NA, dim = c(100, 100))
for (i in 1:100) {
  for (j in 1:100) CU[i, j] = min(u1[i], u2[j])
}  # 同单调copula，上界
persp3d(u1, u2, CU, col = "red")
CL <- array(NA, dim = c(100, 100))
for (i in 1:100) {
  for (j in 1:100) CL[i, j] = max(u1[i] + u2[j] - 1, 0)
  }  # 反单调copula，下界
persp3d(u1, u2, CL, col = "yellow")

# ==============================================
# Spearman’s rho 与 Kendall’s tau的关系
# ==============================================
# tao >= 0
k = seq(0, 1, 0.01)  #tao的取值
s1 = (3 * k - 1)/2   #rho的下界
s2 = (1 + 2 * k - k^2)/2  #rho的上界
plot(k, s1, type = "l", xlab = "tau", ylab = "rho", las = 1)
lines(k, s2, col = 2, lty = 2)
legend("bottomright", c("rho的下限", "rho的上限"), col = c(1, 2), lty = c(1, 2))

# tao < 0
k = seq(-1, 0, 0.01)
s1 = (k^2 + 2 * k - 1)/2
s2 = (1 + 3 * k)/2
plot(k, s1, type = 'l', ylim = c(-1, 1), xlab = 'tau', ylab = 'rho', las = 1)
lines(k, s2, col = 2, lty = 2)
legend('topleft', c('rho的下限', 'rho的上限'), col = c(1, 2), lty = c(1, 2))


# ==============================================
# 练习
# ==============================================
options(digits = 2)
# 参数设置
shape = 2
scale = 500
meanlog = 5
sdlog = 1
alpha = 10
# 模拟X的观察值
set.seed(111)
n = 10  #模拟10个观察值
u1 = runif(n, 0, 1)
x1 = qgamma(u1, shape = shape, scale = scale)
# u2的条件分布函数的逆函数
f2 = function(q, alpha, u) {
  -1/alpha * log(1 - (1 - exp(-alpha))/(1 + (1/q - 1) * exp(-alpha * u)))
  }
# 模拟分位数水平q
q = runif(n, 0, 1)
# 模拟u2和X2
u2 = f2(q, alpha, u1)
x2 = qlnorm(u2, meanlog = meanlog, sdlog = sdlog)
# （x1,x2）的模拟值
cbind(x1, x2)
# frank copula的密度函数
pdffrank = function(alpha, u1, u2) {
  alpha * exp(-alpha * (u1 + u2) * (1 - exp(-alpha)))/(exp(-alpha * (u1 + 
                                                                       u2) - exp(-alpha * u1) - exp(-alpha * u2) + exp(-alpha)))^2
  }
# 绘制(x1,x2)的密度函数
pdf = function(x1, x2) {
  f1 = function(x1) dgamma(x1, shape = shape, scale = scale)
  F1 = function(x1) pgamma(x1, shape = shape, scale = scale)
  f2 = function(x2) dlnorm(x2, meanlog = meanlog, sdlog = sdlog)
  F2 = function(x2) plnorm(x2, meanlog = meanlog, sdlog = sdlog)
  return(f1(x1) * f2(x2) * pdffrank(alpha, F1(x1), F2(x2)))
  }
# 立体图
x1 = seq(0, 5000, 50)
x2 = seq(0, 2000, 50)
D = outer(x1, x2, pdf)
library(rgl); persp3d(x1,x2,D,col=2) #三维动画
persp(x1, x2, D, col = "lightblue", theta = 20, phi = 40, expand = 0.5)
# image图
x1 = seq(0, 4000, 10)
x2 = seq(0, 2000, 10)
D = outer(x1, x2, pdf)
image(x1, x2, D)



# 用随机模拟的方法计算再保险的纯保费
set.seed(111)
sim = 1000  #模拟sim次
n = 5000  #每次模拟n个样本
prem = NULL
for (i in 1:sim) {    # 模拟u1和X1
  u1 = runif(n, 0, 1)
  x1 = qgamma(u1, shape = shape, scale = scale)
  # u2的条件分布函数的逆函数
  f2 = function(q, alpha, u) {
    -1/alpha * log(1 - (1 - exp(-alpha))/(1 + (1/q - 1) * exp(-alpha * u)))
  }
  # 模拟分位数水平q
  q = runif(n, 0, 1)
  # 模拟u2和X2
  u2 = f2(q, alpha, u1)
  x2 = qlnorm(u2, meanlog = meanlog, sdlog = sdlog)
  # 再保险的纯保费
  dt = data.frame(x1, x2)
  dt1 = subset(dt, x1 > 100 & x2 > 100)
  prem[i] = sum(dt1$x1 + dt1$x2 - 200)/n
}

# 输出纯保费的模拟值
summary(prem)

# ==============================================
# 模拟多元分布中隐含的Copula
# ==============================================
library(copula)
shape1 = 10
scale1 = 30
shape2 = 20
scale2 = 40
mycop = normalCopula(0.6)  #定义正态copula
mycop
## Normal copula family 
## Dimension:  2 
## Parameters:
##   rho.1  =  0.6
rCopula(10, mycop)  #模拟10组观察值
f1 = function(x1) dgamma(x1, shape = shape1, scale = scale1)
F1 = function(x1) pgamma(x1, shape = shape1, scale = scale1)
f2 = function(x2) dgamma(x2, shape = shape2, scale = scale2)
F2 = function(x2) pgamma(x2, shape = shape2, scale = scale2)
x1 = seq(0, 1000, 10)
x2 = seq(0, 2000, 10)
D = array(NA, dim = c(length(x1), length(x2)))
for (i in 1:length(x1)) {
  for (j in 1:length(x2)) D[i, j] = f1(x1[i]) * f2(x2[j]) * dCopula(c(F1(x1[i]), 
                                                                      F2(x2[j])), mycop)
  }
persp(x1, x2, D, col = 2)

# ==============================================
# 阿基米德Copula的模拟：
# ==============================================
options(digits=2)
library(copula)
mycop = frankCopula(8)  #定义copula
mycop
## Frank copula family; Archimedean copula 
## Dimension:  2 
## Parameters:
##   param  =  8
u = rCopula(10, mycop)  #模拟copula的随机数
plot(u)                 #随机数的散点图
dCopula(u, mycop)  #copula的密度函数值
pCopula(u, mycop)  #copula的分布函数值
persp(mycop, dCopula, col ='lightblue')  #密度函数
persp(mycop, pCopula, col='lightblue')  #分布函数
contour(mycop, pCopula)     #等高线
