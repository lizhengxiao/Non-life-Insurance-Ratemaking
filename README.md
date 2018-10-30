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
- [Week 2 - 风险度量](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/Lectures/02%20%20%E9%A3%8E%E9%99%A9%E5%BA%A6%E9%87%8F.pptx)
	- VaR、TVaR、PH风险度量、Wang风险度量、 扭曲风险度量
	- 期望值原理、标准差原理、方差原理、指数原理、零效用原理
- [Week 3.4 - 损失金额模型](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/Lectures/03%20%20%E6%8D%9F%E5%A4%B1%E9%87%91%E9%A2%9D%E6%A8%A1%E5%9E%8B.pptx)
	- 伽马分布、逆高斯分布、Tweedie分布、对数正态分布、帕累托分布
	- 分布变换：线性变换、幂变换、指数变换
	- 混合分布
	- 组合分布
	- 参数估计方法：极大似然法、矩估计法、分位数配比法、最小距离法
- [Week 4.5 - 损失次数模型](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/Lectures/04%20%20%E6%8D%9F%E5%A4%B1%E6%AC%A1%E6%95%B0%E6%A8%A1%E5%9E%8B.pptx)
	- (a,b,0) 分布
	- 零截断和零调整分布（a, b, 1）分布
    - 零膨胀分布
    - 混合分布：混合泊松分布
    - 复合分布：复合泊松分布
    - 免赔额对索赔次数模型的影响
- [Week 6.7- 累积损失模型](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/Lectures/05%20%20%E7%B4%AF%E7%A7%AF%E6%8D%9F%E5%A4%B1%E6%A8%A1%E5%9E%8B.pptx)
	- 集体风险模型、个体风险模型
	- 近似法、卷积法、Panjer 递推法、快速傅里叶近似、蒙特卡罗模拟
	- 个体风险模型的复合泊松近似
- [Week 8.9- 相依风险模型](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/Lectures/06%20%20%E7%9B%B8%E4%BE%9D%E9%A3%8E%E9%99%A9%E6%A8%A1%E5%9E%8B.pptx)
	- Copula的定义、多元分布函数与 Sklar 定理、Copula 的性质
	- 常用的 Copula 函数
	- Copula 的随机模拟与参数估计
	- 应用：再保险定价

## 课后作业
1. 应用泊松和伽马的复合分布模拟损失数据, 用 Tweedie 分布进行拟合, 估计模型参数。使用 tweedie 程序包。
2. 偏正态和偏t分布在保险数据拟合中的应用。参考文献：
     - Fitting insurance claims to skewed distributions: Are the skew-normal and skew-student good models? IME,  2012. 51(2) , 239-248.
3. 拟合丹麦火灾数据。参考文献：
     - Scollnik DPM,  Sun C. Modeling with Weibull-Pareto Models [J]. North American Actuarial Journal,   2012,  16(2):260-272.

    **要求:用R编写程序代码。**

4. 假设被保险人的损失 X 服从伽马分布，参数为：shape = 2，scale = 1000。两份保单如下：

	（1）保单 A 的免赔额为100。

	（2）保单 B 的免赔额为100，赔偿限额为3000。（d=100，u=3100）
	- 分别计算保险公司对保单 A 和保单 B 的期望赔款（含零赔款在内）。
	- 如果发生 10% 的通货膨胀，上述结果将如何变化？
	- 如果通胀函数为 $1.1x^{0.5}$，上述结果将如何变化？
	
    **要求:用R编写程序代码。**
5. 假设N服从参数为(r=3, p=0.2)的负二项分布，X等于1, 2, 3的概率分别为0.5，0.3和0.2。求S的分布。（要求：先写出适用于（a， b， 0）分布类的一般迭代公式，再将其应用于本例）。

6. 假设N服从参数为(r=2,p=0.5)的零截断负二项分布，X服从参数为(r=4,p=0.7)的负二项分布。求S的分布。   （要求：先写出适用于（a， b， 1）分布类的一般迭代公式，再将其应用于本例）。

7. 把泊松-逆高斯混合分布表示为复合泊松分布的形式。

  	- 混合泊松分布的母函数：$P(z)=M_{\Theta}\left\[\lambda(z-1)\right\]$

 	- 复合泊松分布的母函数：$P(z)=\exp(\lambda(P_{2}(z)-1))$

8. 某团体意外伤害险保单在保险期间的事故次数服从负二项分布（size=1, p=0.1），假设每次事故导致的索赔次数服从泊松分布(lambda=2)或零膨胀泊松分布(lambda=2,  phi=0.3)，请计算该保单下的索赔次数的分布。
 
9. 损失次数服从零膨胀泊松（lambda =2,  p0=0.4）与负二项分布（r=2,  beta=0.8）的复合分布, 如果v=0.5，求索赔次数的分布。

10. 首分布为｛p0=0.1,  p1=0.3,  p2=0.3,  p3=0.2,  p4=0.1｝，次分布为｛q1=0.2,  q2=0.3,  q3=0.3,  q4=0.2｝，求复合分布的概率。
 
11. 假设损失次数服从负二项（r=2, beta=0.5）- 零截断负二项（ r=3, beta=0.1）的复合分布，损失金额小于500的概率为0.1, 如果免赔额为500，求索赔次数的分布。
 
12. 模拟1000个来自泊松-对数正态分布的随机数，并用负二项、泊松-逆高斯、泊松-对数正态、混合负二项分布进行拟合，比较拟合效果。

## R代码和数据集
-  [Week 1 - 风险度量](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/Codes/1.%20%E9%A3%8E%E9%99%A9%E5%BA%A6%E9%87%8F.r)
-  [Week 2 - 损失金额模型](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/Codes/2.%20%E6%8D%9F%E5%A4%B1%E9%87%91%E9%A2%9D%E6%A8%A1%E5%9E%8B.r)
-  [Week 3 - 损失次数模型](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/Codes/3.%20%E7%B4%A2%E8%B5%94%E6%AC%A1%E6%95%B0%E6%A8%A1%E5%9E%8B.r)
-  [Week 4 - Danish data](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/Codes/Danish%20data.r)
-  [Week 5 - 累积损失模型](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/Codes/4.%20%E7%B4%AF%E7%A7%AF%E6%8D%9F%E5%A4%B1%E6%A8%A1%E5%9E%8B.r)


---
- [附：教材数据集](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/tree/master/%E3%80%8A%E9%A3%8E%E9%99%A9%E6%A8%A1%E5%9E%8B%E3%80%8B%E6%95%99%E6%9D%90%E6%95%B0%E6%8D%AE%E9%9B%86)
- [附：练习数据集](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/tree/master/%E3%80%8A%E9%A3%8E%E9%99%A9%E6%A8%A1%E5%9E%8B%E3%80%8B%E7%BB%83%E4%B9%A0%E6%95%B0%E6%8D%AE%E9%9B%86)

## 阅读文献
1. [Modelling loss data using mixtures of distributions](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Tatjana(2016)%20-%20Modeling%20loss%20data%20using%20mixtures%20of%20distributions.pdf)
	- 混合分布
2. [Modeling loss data using composite models](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Bakar(2015)%20-%20Modeling%20loss%20data%20using%20composite%20models.pdf)
	- 组合分布
3. [New composite models for the Danish fire data](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Nadarajah(2014)%20-%20New%20composite%20models%20for%20the%20Danish%20fire%20data.pdf)
	- 组合分布
4. [Modeling with Weibull-Pareto Models](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Scollnik(2012)%20-%20Modeling%20with%20Weibull-Pareto%20Models.pdf)
	- 组合分布
5. [Fitting insurance claims to skewed distributions - Are the skew-normal and skew-student good models](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Eling(2012)%20-%20Fitting%20insurance%20claims%20to%20skewed%20distributions%20-%20Are%20the%20skew-normal%20and%20skew-student%20good%20models%EF%BC%9F.pdf)
	- 偏正态分布和偏 T 分布
6. [Modelling insurance losses using contaminated generalised beta type II distribution.pdf	](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Chan(2018)%20-%20Modelling%20insurance%20losses%20using%20contaminated%20generalised%20beta%20type%20II%20distribution.pdf)
	- GB2 分布
- [Compound unimodal distributions for insurance losses](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Punzo(2018)%20-%20Compound%20unimodal%20distributions%20for%20insurance%20losses.pdf)
	- 复合单峰分布
- [Private information in healthcare utilization：specification of a copula-based hurdle model](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Peng(2015)%20-%20Private%20information%20in%20healthcare%20utilization%EF%BC%9Aspecification%20of%20a%20copula-based%20hurdle%20model.pdf)
	- GB2 分布
	- 相依风险
- [Pair Copula Constructions for Insurance Experience Rating](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Peng(2017)%20-%20Pair%20Copula%20Constructions%20for%20Insurance%20Experience%20Rating.pdf)
	- GB2 分布
	- 相依风险
- [An extreme value approach for modeling operational risk losses depending on covariates](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/An%20extreme%20value%20approach%20for%20modeling%20operational%20risk%20losses%20depending%20on%20covariates.pdf)
- [Multivariate Frequency-Severity Regression Models in Insurance](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Frees(2016)%20-%20Multivariate%20Frequency-Severity%20Regression%20Models%20in%20Insurance.pdf)
- [Bayesian multinomial latent variable modeling for fraud and abuse detection in health insurance](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Bayerstadler(2016)%20-%20Bayesian%20multinomial%20latent%20variable%20modeling%20for%20fraud%20and%20abuse%20detection%20in%20health%20insurance.pdf)
- [Full tails gamma distribution applied to model extreme values](https://github.com/lizhengxiao/Non-life-Insurance-Ratemaking/blob/master/%E9%98%85%E8%AF%BB%E6%9D%90%E6%96%99/Castillo(2017)%20-%20Full%20tails%20gamma%20distribution%20applied%20to%20model%20extreme%20values.pdf)
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