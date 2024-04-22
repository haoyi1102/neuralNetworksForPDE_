import torch
import torch.nn as nn
import numpy as np
import matplotlib.pyplot as plt

import torch.optim as optim
from torch.autograd import Variable
from matplotlib import cm
import scipy.io

import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import copy
fig = plt.figure()

#####################
import time
start = time.time()





#####################
T = 30#总时间
T_step = 1#步长
size = 200#样本数量

lr = 0.02#学习率

#####################
j = 5000#次数
loss_111 = 100.1
class Net(nn.Module):  #神经网络直接继承的python库
    def __init__(self, NL, NN):
        super(Net, self).__init__()
        self.input_layer = nn.Linear(1, NN) #一维
        self.hidden_layer = nn.ModuleList([nn.Linear(NN, NN) for i in range(NL)])
        self.output_layer = nn.Linear(NN, 1)

    def forward(self, x):
        o = self.act(self.input_layer(x))
        for i, li in enumerate(self.hidden_layer):
            o = self.act(li(o))
        out = self.output_layer(o)
        return out

    def act(self, x):
        return torch.tanh(x)

def sample(size):
    z = torch.linspace(0, 40, size).unsqueeze(-1)
    #z = (torch.rand([size, 1])) * 40
    x_boundary_1 = torch.ones([size, 1]) * 40 #边界的样本集
    x_boundary_2 = torch.zeros([size, 1]) #边界的样本集
    return z, x_boundary_1, x_boundary_2
#构造三个样本集 两个边界加一个用于方程的训练集

jj = j-1
epoch = 1
steps = T/T_step
alpha = 1611000
theta_s = 0.287
theta_r = 0.075
betta = 3.96
K_S = 0.00944
A1 = 1175000
gamma = 4.74
x_train, x_left, x_right = sample(size)
#h_solution = -1.02*z-20.7+(t*z*(z-10))/T
valueforplot = []
############以下修改
#########################初始条件1
y_train_1 = -61.5            #选择初始条件1的话要吧初始条件2注释掉
#########################初始条件1
loss = loss_111
i = 0
if __name__ == '__main__':

    for ii in range(int(T/T_step)): #最外层循环  是第几层神经网络的那种
        iii = ii + 1
        print('当前训练层数：T = %fs' % float(iii * T_step))
        net = Net(NL=1, NN=20) #构造神经网络 #每一层其实都是新的

        optimizer = optim.Adam(net.parameters(), lr)   #优化器
        loss_fn = nn.MSELoss(reduction='mean') #这个是定义损失函数

        #for i in range(j):
        while loss > 0.5:
            i = (i+1)
            x = Variable(x_train, requires_grad=True) #用torch.autograd.grad求导，要给数赋值requires_grad属性 梯度信息

            ############以下修改
            #########################初始条件2
            #if ii == 0:
             #   y_train_1 = -1.02*x-20.7     #第0层赋值
            #########################初始条件2
            y_train = net(x)# 每个batch必定执行的操作步骤
            #训练n+1神经网络 这个就是要求的
            d = torch.autograd.grad(y_train, x, grad_outputs=torch.ones_like(y_train), create_graph=True)#求导
            dx = d[0][:, 0].unsqueeze(-1)#提出第一列的 虽然现在总共也只有一列因为现在输入的是一维的 作为dx
            C_U = (alpha * (theta_s - theta_r) * betta * (abs(y_train_1) ** (betta - 1))) / (            #参数
                    (alpha + abs(y_train_1) ** betta) ** 2)                              #参数
            K_U = K_S * A1 / (A1 + abs(y_train_1) ** gamma)                            #参数
            K_U_dif = (K_S * A1 * gamma * abs(y_train_1) ** (gamma - 1)) / ((A1 + abs(y_train_1) ** gamma) ** 2) #参数


            #参数里面带入的是 y_train_1 也就是第n层 即为常数 不是未知数
            d1 = torch.autograd.grad(dx, x, grad_outputs=torch.ones_like(dx), create_graph=True)  #求导
            d1x = d1[0][:, 0].unsqueeze(-1)
            #K_U_TEMP = K_U * dx  # 参数
            #d1 = torch.autograd.grad(K_U_TEMP, x, grad_outputs=torch.ones_like(K_U_TEMP), create_graph=True)  #求导
            #d1x = d1[0][:, 0].unsqueeze(-1)
            optimizer.zero_grad() # 每个batch必定执行的操作步骤
            # 梯度初始化为零，把loss关于weight的导数变成0

            ###求loss# 每个batch必定执行的操作步骤
            loss1 = loss_fn(C_U * (y_train - y_train_1)/T_step, K_U_dif* (dx**2)+ d1x*K_U+ K_U_dif * dx)       * (10 ** 5) #原方程的误差
            #(y_train - y_train_1) / T_step  时间差分在这里

            xx =torch.ones([size, 1])

            ##我把式子的减号部分移到了逗号右边 因为 loss_fn 在77行定义的mseloss    意味着式子左右两边要相减，相减要保持维度一直 所以如果全在一边要新减同纬度的0
            loss2 = loss_fn(net(x_left), xx * -61 - 0.5)#边界的误差
            loss3 = loss_fn(net(x_right), xx * -20 - 0.7)#边界的误差
            loss = loss1 + loss2 + loss3

            loss.backward()# 每个batch必定执行的操作步骤
            ## backward：反向传播求梯度
            optimizer.step()# 每个batch必定执行的操作步骤
            # optimizer：更新所有参数

            #if i % 4999 == 0 and i>0:
        #print(i,loss)
        #############以下画图
        print(f'总共训练次数step: {i}  loss = {loss.item()}')
        loss = loss_111
                #print(loss1, loss2, loss3)
            #if i == jj:
        if iii == 10 or iii == 30 or iii == 60 or iii == 120 or iii == 360 or iii == 600  or iii ==1800 or iii ==3600:
        #if iii == 10 or iii == 30 or iii == 60 :
            # if iii == iii:  iii == int(T/T_step) or
            # if iii == 1 or iii == 2 or iii == 4 or iii == 5 or iii == 6:
            x11 = x.detach().cpu().numpy()
            y11111 = y_train.detach().cpu().numpy()
            valueforplot.append(y11111)
            #if iii == 10 or iii == 30:
                #plt.plot(x11, np.array(valueforplot)[0, :], label='T = 10s')
                #plt.plot(x11, np.array(valueforplot)[1, :], label='T = 30s')
            #print(np.array(valueforplot).shape)
                #plt.show()
        i = 0
        #############以上画图

###############################################################

        y_train_1 = y_train.detach().cpu() #继承  把n用n+1替换  以此计算n+2  (n+2)-(n+1)

        #105 行 y_train - y_train_1
        #值得注意的是这里的y_train要用.detach()消去梯度信息
        #如果这里不用.detach()
        #产生错误RuntimeError: Trying to backward through the graph a second time  #该办法解决方法我找到的就是用.detach()最方便

    #############以下画图
    plt.close()
    end = time.time()  # 1657267201.6171696
    print('spend： %s second' % (end - start))
    valueforplot = np.array(valueforplot)
    """
    for b in range(size):
        plt.scatter(x11[b], y11111[b], s=3, c='r')
        #plt.plot(x11[b][0], y11111[b],c='r')"""
    plt.plot(x11, valueforplot[0,:], label='T = 10s' )
    plt.plot(x11, valueforplot[1, :], label='T = 30s' )
    #plt.plot(x11, valueforplot[2, :] , label='T = 1m' )
    #plt.plot(x11, valueforplot[3, :] , label='T = 2m')
    #plt.plot(x11, valueforplot[4, :] , label='T = 6m')
    #plt.plot(x11, valueforplot[5, :] , label='T = 10m')
    #plt.plot(x11, valueforplot[6, :] , label='T = 30m')
    #plt.plot(x11, valueforplot[7, :] , label='T = 1h')



    plt.xlabel('z')
    plt.ylabel('result')

    plt.title('Richards equation')
    #plt.title('T = %i' % iii)
    plt.legend(loc=0)
        # plt.savefig('img\'+y+'秒.jpg')
        # plt.savefig('t={}s.png'.format(y))
    plt.show()
        #print(iii)
        #h_solution = -1.02 * x.detach().cpu().numpy() - 20.7 + ((ii+1) * x.detach().cpu().numpy() * (x.detach().cpu().numpy() - 10)) / T

        #print('error:',np.mean(error))


    #print(list(net.parameters()),1111)