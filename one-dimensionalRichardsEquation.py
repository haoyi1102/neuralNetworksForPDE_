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

# Timing execution
import time
start = time.time()

# Total simulation time and time step
T = 30  # Total time
T_step = 1  # Time step
size = 200  # Sample size

# Learning rate
lr = 0.02

# Number of iterations and initial loss
j = 5000
loss_111 = 100.1


## using thw finite difference method
## for each time step create a PINN 


# Defining the neural network architecture
class Net(nn.Module):
    # Inherits from the PyTorch Module
    def __init__(self, NL, NN):
        super(Net, self).__init__()
        self.input_layer = nn.Linear(1, NN)  # One-dimensional input
        self.hidden_layer = nn.ModuleList([nn.Linear(NN, NN) for i in range(NL)])
        self.output_layer = nn.Linear(NN, 1)

    def forward(self, x):
        # Forward pass through the network
        o = self.act(self.input_layer(x))
        for i, li in enumerate(self.hidden_layer):
            o = self.act(li(o))
        out = self.output_layer(o)
        return out

    def act(self, x):
        # Activation function
        return torch.tanh(x)

# Sampling function to generate training data
def sample(size):
    z = torch.linspace(0, 40, size).unsqueeze(-1)
    x_boundary_1 = torch.ones([size, 1]) * 40  # Samples at one boundary
    x_boundary_2 = torch.zeros([size, 1])  # Samples at the other boundary
    return z, x_boundary_1, x_boundary_2

# Training, initial conditions, and parameters
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

# Values to plot
valueforplot = []

# Starting conditions and loss
y_train_1 = -61.5  # Initial condition 1
loss = loss_111
i = 0

if __name__ == '__main__':
    for ii in range(int(T/T_step)):  # Loop over time steps
        iii = ii + 1
        print('Current training layer: T = %fs' % float(iii * T_step))
        net = Net(NL=1, NN=20)  # Create a new neural network for each time step

        optimizer = optim.Adam(net.parameters(), lr)  # Optimizer
        loss_fn = nn.MSELoss(reduction='mean')  # Loss function

        # Optimization loop
        while loss > 0.5:
            i = (i+1)
            x = Variable(x_train, requires_grad=True)  # Variable that requires gradient

            y_train = net(x)  # Neural network prediction
            d = torch.autograd.grad(y_train, x, grad_outputs=torch.ones_like(y_train), create_graph=True)
            dx = d[0][:, 0].unsqueeze(-1)

            # Calculate parameters
            C_U = (alpha * (theta_s - theta_r) * betta * (abs(y_train_1) ** (betta - 1))) / \
                  ((alpha + abs(y_train_1) ** betta) ** 2)
            K_U = K_S * A1 / (A1 + abs(y_train_1) ** gamma)
            K_U_dif = (K_S * A1 * gamma * abs(y_train_1) ** (gamma - 1)) / \
                      ((A1 + abs(y_train_1) ** gamma) ** 2)

            d1 = torch.autograd.grad(dx, x, grad_outputs=torch.ones_like(dx), create_graph=True)
            d1x = d1[0][:, 0].unsqueeze(-1)

            optimizer.zero_grad()

            # Calculate loss
            loss1 = loss_fn(C_U * (y_train - y_train_1)/T_step, K_U_dif* (dx**2)+ d1x*K_U+ K_U_dif * dx) * (10 ** 5)
            xx = torch.ones([size, 1])

            # Boundary losses
            loss2 = loss_fn(net(x_left), xx * -61 - 0.5)
            loss3 = loss_fn(net(x_right), xx * -20 - 0.7)
            loss = loss1 + loss2 + loss3

            loss.backward()  # Backpropagation
            optimizer.step()  # Parameter update

        print(f'Total training steps: {i}  loss = {loss.item()}')
        loss = loss_111

        # Update initial condition for the next time step
        y_train_1 = y_train.detach().cpu()

    # Plot results
    plt.close()
    end = time.time()
    print('Time spent: %s seconds' % (end - start))
    valueforplot = np.array(valueforplot)

    plt.plot(x11, valueforplot[0,:], label='T = 10s')
    plt.plot(x11, valueforplot[1, :], label='T = 30s')

    plt.xlabel('z')
    plt.ylabel('result')

    plt.title('Richards equation')
    plt.legend(loc=0)
    plt.show()
