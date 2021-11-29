# 附录二：程序说明
本部分为程序包coding.zip的使用说明。
## a. 文件夹gams
使用gams（24.4）系统调用lindoglobal求解器。
1、SCAS.gms：最小化供应商总开销。
2、DEA.gms：最大化供应商总效率。
3、stage1.gms：第一阶段最优化程序（选取权重为0.5，0.5）。
4、stage2.gms：第二阶段最优化程序（使用第一阶段最优化结果）。
5、SCAStest.gms 新变量替换法测试，订单分配问题，选取供应商1，6，7，9。
6、SCAStest2.gms 原论文变量替换法测试，订单分配问题，选取供应商1，6，7，9。
7、SCAStest3.gms 新变量替换法测试，订单分配问题，选取供应商1，3，4，9，10。
## b. 文件夹matlab
使用MATLAB（2021a）实现基于遗传算法、分式规划、罚函数和梯度下降的第一阶段最优化算法。
1、punish_main.m：订单分配问题主函数，可单独测试罚函数法，可调整参数。
2、genetic_main.m：遗传算法主函数，可调整遗传算法相关参数。
3、parameters.m：自定义的参数类，用于实现复杂参数在各函数间的传递。
4、fitness.m：遗传算法适应度函数，可调整遗传算法中关于罚函数的参数。
5、gen_crossover.m：遗传算法实现交叉操作的函数。
6、gen_mutation.m：遗传算法实现变异操作的函数。
7、gen_selection.m：遗传算法实现选择操作的函数。
8、min_punish_function.m：实现罚函数迭代的函数，可以输出显示每一次罚函数迭代结果（见代码注释），可以自行利用draw_x和draw_con两个变量绘图。
9、gradient_descent.m：实现梯度下降的函数，可以输出显示每一步梯度（见代码注释）。
10、obj.m：计算目标函数值的函数。
11、obj_gradient.m：计算目标函数梯度的函数。
12、punish_function.m：计算罚函数值的函数。
13、punish_function_gradient.m：计算罚函数梯度的函数。
14、t.m：计算t值的函数。
15、t_gradient.m：计算t梯度的函数。
## c．使用建议
1、可以直接运行punish_main.m和genetic_main.m获得本文大部分自行设计算法部分的结果；
2、不建议在使用遗传算法时开启输出，因为遗传算法中使用了并行计算，若您不在意命令行的杂乱或已对本程序有充分了解则无妨。
3、建议修改测试的代码有：punish_main.m、genetic_main.m、fitness.m，其他代码不建议修改测试，若您对本文中涉及的公式以及本程序有充分的了解则无妨。
4、draw4_2_3.m并非核心函数，如果您想验证4.4.3中的绘图，可以参考，但由于版本和使用环境，不保证一定能运行成功（需要在min_punish_function.m中开启绘图相关代码）。
