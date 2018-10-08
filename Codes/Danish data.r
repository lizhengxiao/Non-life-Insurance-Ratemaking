# ===========================================
# Danish data
# ===========================================
# ====================================================
# 0. 描述性分析
# ====================================================
  library(SMPracticals)
  library(gamlss)
  library(data.table)
  library(actuar)
  data(danish)
  dt <- data.table(danish)
  plot(danish,type="h")
  hist(dt$danish)
  summary(danish)
  y <- as.numeric(dt$danish)
  
# =========================================================
# 1. log normal distribution
# ==========================================================  
  LLlognormal <-  function(pars, y){
    mu <- (pars[1])
    sigma <- (pars[2])
    if(mu < 0 | sigma < 0){
      logL <- -100000000
    }else logL <- dLOGNO(y, mu, sigma, log = T)
    ll <- -sum(logL)
    return(ll)
  }
  mllognormal <- nlm(f = LLlognormal, y = y, p = c(1, 2))
  NLLlognormal <- mllognormal$minimum  # - loglikelihood value
  AIClognormal <- 2*length(mllognormal$estimate) + 2*NLLlognormal
  BIClognormal <- log(length(y))*length(mllognormal$estimate) + 2*NLLlognormal
  c(NLLlognormal, AIClognormal, BIClognormal)
  
  
# =========================================================
# 2. Pareto distribution
# ==========================================================
  LLpareto <- function(pars, y){
    beta <- (pars[1])
    sigma <- (pars[2])
    if(beta<0 | sigma<0){
      logL <- -100000000
    }else logL <- log(beta) + beta*log(sigma) - (beta+1)*log(y+sigma)
    ll <- -sum(logL)
    return(ll)
  }
  mlpareto <- nlm(f = LLpareto, y = y, p = c(1, 2))
  NLLpareto <- mlpareto$minimum  # - loglikelihood value
  AICpareto <- 2*length(mlpareto$estimate) + 2*NLLpareto
  BICpareto <- log(length(y))*length(mlpareto$estimate) + 2*NLLpareto
  c(NLLpareto, AICpareto, BICpareto)

# =========================================================
# 3. Weibull distribution
# ========================================================== 
  LLweibull <- function(pars, y){
    a <- (pars[1])  # shape
    b <- (pars[2]) # scale
    if(b<0 | a<0){
      logL <- -10000000000
    }else{
      #logL <- log(a) - log(b)  + (a-1)*(log(y) - log(b)) - (y/b)^a
      logL <- dweibull(y, shape = a, scale = b, log = T)
    }
    return(-sum(logL))
  }
  mlweibull <- nlm(f = LLweibull, y = y, p = c(1, 1))
  mlweibull$estimate
  NLLweibull <- mlweibull$minimum  # - loglikelihood value
  AICweibull <- 2*length(mlweibull$estimate) + 2*NLLweibull
  BICweibull <- log(length(y))*length(mlweibull$estimate) + 2*NLLweibull
  c(NLLweibull, AICweibull, BICweibull)
# ==========================================================================  
# 4 Weibull–Pareto composite model proposed by Scollnik and Sun (2012).
# Scollnik(2012) - Modeling with Weibull Pareto Models
# ==========================================================================   
  lg.weibull.pareto <- function(x,par){
    alpha <- par[1]
    beta <- par[3]
    theta <- par[2]
    sigma <- par[4]
    # Bakar et al.(2015)引用Scollnik and Sun (2012)论文，符号转换的时候出错
    lambda = theta/((beta*theta-sigma)/(alpha*(sigma+theta))+1)^(1/alpha)
    r = (beta/alpha)/(beta/alpha+(sigma+theta)/(lambda*(exp(theta/lambda)-1)))
    f <- NULL
    for (i in 1:length(x)) {
      if (x[i] <= theta) {
        f[i] = log(r*dweibull(x[i],alpha,lambda)/pweibull(theta,alpha,lambda))
      }else{
        f[i] = log((1-r)*dpareto(x[i],beta,sigma)/(1-ppareto(theta, beta, sigma)))
      }
    }
    f <- - sum(f)
    return(f)
  }
  mlweibull.pareto <- nlm(lg.weibull.pareto, x = danish, p = c(15,1,2,0.5))
  summary(mlweibull.pareto)
  mlweibull.pareto
  NLLweibull.pareto <- mlweibull.pareto$minimum  # - loglikelihood value
  AICweibull.pareto <- 2*length(mlweibull.pareto$estimate) + 2*NLLweibull.pareto
  BICweibull.pareto <- log(length(y))*length(mlweibull.pareto$estimate) + 2*NLLweibull.pareto
  c(NLLweibull.pareto, AICweibull.pareto, BICweibull.pareto)
# ==========================================================================  
# 5 lognormal–Pareto composite model proposed by Scollnik and Sun (2007).
# Scollnik(2007) - On composite lognormal-Pareto models
# ==========================================================================  
  lg.lognormal.pareto <- function(y, par){
    theta <- par[1]
    alpha <- par[2]
    sigma <- par[3]

    r = ((2*pi)^0.5*alpha*sigma*pnorm(alpha*sigma)*exp(0.5*((alpha*sigma)^2)))/(((2*pi)^0.5*alpha*sigma*pnorm(alpha*sigma)*exp(0.5*((alpha*sigma)^2))) + 1)
    mu = log(theta) - alpha*sigma^2
    F1 = pnorm((log(theta) - mu)/sigma)
    
    f <- NULL
    for (i in 1:length(y)) {
      if(y[i] <= theta){
        f[i] = log(r) - 0.5*log(2*pi) - log(y[i]) - log(sigma) - 0.5*((log(y[i]) - mu)/sigma)^2 - log(F1);
        #f[i] = log(r) + dlnorm(y[i], meanlog = mu, sdlog = sigma, log = T) - log(F1);
      }else{
        f[i] = log(1-r) + log(alpha) + alpha*log(theta) - (alpha + 1)*log(y[i]);
        #f[i] = log(1-r) + dpareto1(y[i], shape = alpha, min = theta, log = T);
      }
    }
    f <- - sum(f)
    return(f)
  }
  mllognormal.pareto <- nlm(lg.lognormal.pareto, y = danish, p = c(1.207430, 1.328223, 0.196517))
  mllognormal.pareto
  NLLlognormal.pareto <- mllognormal.pareto$minimum  # - loglikelihood value
  AIClognormal.pareto <- 2*length(mllognormal.pareto$estimate) + 2*NLLlognormal.pareto
  BIClognormal.pareto <- log(length(y))*length(mllognormal.pareto$estimate) + 2*NLLlognormal.pareto
  c(NLLlognormal.pareto, AIClognormal.pareto, BIClognormal.pareto)
  
# ==========================================================================  
# 6 lognormal–bull model  composite model 
# ==========================================================================  
  lg.lognormal.bull <- function(y, par){
    sigma <- par[1]
    theta <- par[2]
    alpha <- par[3]
    beta <- par[4]
    s <- par[5]
    
    mu <- log(theta) - sigma^2*((alpha+1)*beta*theta^beta/(theta^beta + s^beta) - beta)
    F1 = pnorm((log(theta) - mu)/sigma)
    F2 <- pburr(theta, shape1 = alpha, shape2 = beta, scale = s)
    phi <- ((theta^beta + s^beta)*dnorm((log(theta) - mu)/sigma))/(sigma*alpha*beta*theta^beta*pnorm((log(theta) - mu)/sigma))
    r <- 1/(1 + phi)
    
    f <- NULL
    for (i in 1:length(y)) {
      if(y[i] <= theta){
        #f[i] = log(r) + dlnorm(y[i], meanlog = mu, sdlog = sigma, log = T) - log(F1);
        f[i] = log(r) - 0.5*log(2*pi) - log(y[i]) - log(sigma) - 0.5*((log(y[i]) - mu)/sigma)^2 - log(F1);
      }else{
        f[i] = log(1-r) + log(alpha) + log(beta) + beta*(log(y[i]) - log(s)) - log(y[i]) - (alpha + 1)*log(1 + (y[i]/s)^beta) + (alpha)*log(1 + (theta/s)^beta) 
        # f[i] = log(1-r) + dburr(y[i], shape1 = alpha, shape2 = beta, scale = s, log = T) - log(1 - F2)
      }
    }
    f <- - sum(f)
    return(f)
  }
  mllognormal.bull <- nlm(lg.lognormal.bull, y = danish, p = c(0.1636416, 1.0500002, 0.3461454, 4.1104656, 0.8825080))
  mllognormal.bull
  NLLlognormal.bull <- mllognormal.bull$minimum  # - loglikelihood value
  AIClognormal.bull <- 2*length(mllognormal.bull$estimate) + 2*NLLlognormal.bull
  BIClognormal.bull <- log(length(y))*length(mllognormal.bull$estimate) + 2*NLLlognormal.bull
  c(NLLlognormal.bull, AIClognormal.bull, BIClognormal.bull)
  
  

  
  
  