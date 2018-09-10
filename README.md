# 产险精算定价

本课程适合风险管理、保险与精算等相关专业的**高年级学生**、研究人员参考。 本课程主要讨论了相应的风险模型及其应用，主要包括

- **风险度量**
- **损失次数、损失金额、累积损失模型**
- **极值理论与巨灾损失**
- **相依风险模型：copula及其应用**
- **损失预测模型：广义线性模型**
- **贝叶斯风险模型**


在实证研究中，以 **R 语言**为计算工具，提供了详细的程序代码，方便读者再现完整的编程和计算过程。


## 课程讲义
- [Week 1 - 课程简介](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/Lectures/01%20%E8%AF%BE%E7%A8%8B%E7%AE%80%E4%BB%8B.pptx)
- [Week 1,2 - 风险度量](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/Lectures/02%20%20%E9%A3%8E%E9%99%A9%E5%BA%A6%E9%87%8F.pptx)
	- VaR、TVaR、PH风险度量、Wang风险度量、 扭曲风险度量
	- 期望值原理、标准差原理、方差原理、指数原理、零效用原理
- [Week 3 - 损失金额模型](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/Lectures/02%20%20%E9%A3%8E%E9%99%A9%E5%BA%A6%E9%87%8F.pptx)


## R代码和数据集
-  [Week 1 - 风险度量](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/Codes/1.%20%E9%A3%8E%E9%99%A9%E5%BA%A6%E9%87%8F.r)
- [Week 1 - 损失模型]()
- [附：教材数据集](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/tree/master/%E3%80%8A%E9%A3%8E%E9%99%A9%E6%A8%A1%E5%9E%8B%E3%80%8B%E6%95%99%E6%9D%90%E6%95%B0%E6%8D%AE%E9%9B%86)
- [附：练习数据集](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/tree/master/%E3%80%8A%E9%A3%8E%E9%99%A9%E6%A8%A1%E5%9E%8B%E3%80%8B%E7%BB%83%E4%B9%A0%E6%95%B0%E6%8D%AE%E9%9B%86)

## 阅读文献
- [An extreme value approach for modeling operational risk losses depending on covariates](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/An%20extreme%20value%20approach%20for%20modeling%20operational%20risk%20losses%20depending%20on%20covariates.pdf)
- [Private information in healthcare utilization：specification of a copula-based hurdle model](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Peng(2015)%20-%20Private%20information%20in%20healthcare%20utilization%EF%BC%9Aspecification%20of%20a%20copula-based%20hurdle%20model.pdf)
- [Multivariate Frequency-Severity Regression Models in Insurance](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Frees(2016)%20-%20Multivariate%20Frequency-Severity%20Regression%20Models%20in%20Insurance.pdf)
- [Modeling loss data using composite models](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Bakar(2015)%20-%20Modeling%20loss%20data%20using%20composite%20models.pdf)
- [Bayesian multinomial latent variable modeling for fraud and abuse detection in health insurance](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Bayerstadler(2016)%20-%20Bayesian%20multinomial%20latent%20variable%20modeling%20for%20fraud%20and%20abuse%20detection%20in%20health%20insurance.pdf)
- [Full tails gamma distribution applied to model extreme values](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Castillo(2017)%20-%20Full%20tails%20gamma%20distribution%20applied%20to%20model%20extreme%20values.pdf)
- [Modelling insurance losses using contaminated generalised beta type II distribution.pdf	](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Chan(2018)%20-%20Modelling%20insurance%20losses%20using%20contaminated%20generalised%20beta%20type%20II%20distribution.pdf)
- [Insured Loss Inflation How Natural Catastrophes Affect Reconstruction Costs.pdf](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Deohrmann(2017)%20-%20Insured%20Loss%20Inflation%20How%20Natural%20Catastrophes%20Affect%20Reconstruction%20Costs.pdf)
- [Household Life Insurance Demand.pdf](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Frees(2012)%20-%20Household%20Life%20Insurance%20Demand.pdf)
- [Multivariate Frequency-Severity Regression Models in Insurance.pdf](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Frees(2016)%20-%20Multivariate%20Frequency-Severity%20Regression%20Models%20in%20Insurance.pdf)
- [The Impact of the Financial Crisis and Natural Catastrophes on CAT Bonds.pdf](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Gaurtler(2016)%20-%20The%20Impact%20of%20the%20Financial%20Crisis%20and%20Natural%20Catastrophes%20on%20CAT%20Bonds.pdf)
- [Loss data analysis: Analysis of the sample dependence in density reconstruction by maxentropic methods.pdf](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Goncalves%20(2016)%20-%20Loss%20data%20analysis%20-%20Analysis%20of%20the%20sample%20dependence%20in%20density%20reconstruction%20by%20maxentropic%20methods.pdf)
- [Dirichlet process mixture models for insurance loss data.pdf](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Hong(2017)%20-%20Dirichlet%20process%20mixture%20models%20for%20insurance%20loss%20data.pdf)
- [Model Selection and Averaging of Health Costs in Episode Treatment Groups.pdf](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Huang%20et%20al.(2016)%20-%20Model%20Selection%20and%20Averaging%20of%20Health%20Costs%20in%20Episode%20Treatment%20Groups.pdf)
- [Generalized Linear Mixed Models for Dependent Compound Risk Models.pdf](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Jeong%20et%20al.(2017)%20-%20Generalized%20Linear%20Mixed%20Models%20for%20Dependent%20Compound%20Risk%20Models.pdf)
- [Tail negative dependence and its applications for aggregate loss modeling.pdf](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Lei%20Hua(2015)%20-%20Tail%20negative%20dependence%20and%20its%20applications%20for%20aggregate%20loss%20modeling.pdf)
- [Managed Care and Health Care Utilization Specification of Bivariate Models Using Copulas.pdf](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Peng(2013)%20-%20Managed%20Care%20and%20Health%20Care%20Utilization%20Specification%20of%20Bivariate%20Models%20Using%20Copulas.pdf)
- [Private information in healthcare utilization：specification of a copula-based hurdle model.pdf](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Peng(2015)%20-%20Private%20information%20in%20healthcare%20utilization%EF%BC%9Aspecification%20of%20a%20copula-based%20hurdle%20model.pdf)
- [Risk measures in a quantile regression credibility framework with Fama and French data applications.pdf](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Pitselis(2016)%20-%20Risk%20measures%20in%20a%20quantile%20regression%20credibility%20framework%20with%20Fama%20and%20French%20data%20applications.pdf)
- [Ratemaking of Dependent Risks.pdf](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Silva(2017)%20-%20Ratemaking%20of%20Dependent%20Risks.pdf)
- [An extreme value approach for modeling operational risk losses depending on covariates.pdf](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Valerie(2016)%20-%20An%20extreme%20value%20approach%20for%20modeling%20operational%20risk%20losses%20depending%20on%20covariates.pdf)
- [Using Taiwan National Health Insurance Database to model cancer incidence and mortality rates.pdf](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Yue(2018)%20-%20Using%20Taiwan%20National%20Health%20Insurance%20Database%20to%20model%20cancer%20incidence%20and%20mortality%20rates.pdf)
- [Bayesian Analysis of Big Data in Insurance Predictive Modeling Using Distributed Computing.pdf](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Zhang(2017)%20-%20Bayesian%20Analysis%20of%20Big%20Data%20in%20Insurance%20Predictive%20Modeling%20Using%20Distributed%20Computing.pdf)


 ![](风险模型.jpg)