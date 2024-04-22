import os
import tensorflow.compat.v1 as tf
import matplotlib.pyplot as plt
import numpy as np
import math
from mpl_toolkits.mplot3d import Axes3D
import time

# Suppress TensorFlow logging
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

start = time.time()

# Generate data
x_train_1 = np.linspace(0, np.pi, 10)        # 10 points between 0 and pi
x_train_2 = np.linspace(0, np.pi, 10)        # 10 points between 0 and pi
input_num = []

# Create input dataset
for i in range(len(x_train_1)):
    for j in range(len(x_train_2)):
        input_num.append([x_train_1[i], x_train_2[j]])
input_num = np.array(input_num)               # Shape [100,2]
input_x1, input_x2 = np.expand_dims(input_num[:, 0], 1), np.expand_dims(input_num[:, 1], 1)   # Extract two [100,1] arrays

# Construct true solution for PDE
y_trail = np.exp(input_x1) + np.exp(input_x2)
X1, X2 = np.meshgrid(x_train_1, x_train_2)

# Plot the analytical solution
fig = plt.figure("Analytical Solution")
ax = fig.gca(projection='3d')
ax.plot_surface(X1, X2, y_trail.reshape(10, 10), rstride=1, cstride=1, cmap=plt.get_cmap('rainbow'))
plt.title('Analytic Solution')

# Define function for computing forward gradients
def fwd_gradients(Y, x):
    dummy = tf.ones_like(Y)
    G = tf.gradients(Y, x, grad_ys=dummy, colocate_gradients_with_ops=True)[0]
    Y_x = tf.gradients(G, dummy, colocate_gradients_with_ops=True)[0]
    return Y_x

# Define activation function
def act(x):
    return tf.nn.sigmoid(x)

# Disable eager execution for compatibility with TensorFlow 1.x
tf.compat.v1.disable_eager_execution()

# Placeholder for input
A = tf.placeholder("float", [None, 1])
B = tf.placeholder("float", [None, 1])

# Network weights and bias initialization
W1_1 = tf.Variable(tf.random_normal([1, 10]) * 0.01)
W1_2 = tf.Variable(tf.random_normal([1, 10]) * 0.01)
b = tf.Variable(tf.zeros([10]) + 0.01)

# Neural network layers
y1 = act(tf.matmul(A, W1_1) + tf.matmul(B, W1_2) + b)  # Apply sigmoid activation function
W2 = tf.Variable(tf.random_normal([10, 1]) * 0.01)
y = tf.matmul(y1, W2)  # Network output

# Construct true solution for nonhomogeneous right side
h1 = (np.exp(input_x1) - np.exp(3*input_x1)) / (1 + np.exp(2*input_x1))**2
h2 = np.exp(input_x1) + np.exp(input_x2) + h1

# Calculate gradients
dif_A = fwd_gradients(y, A)
dif_B = fwd_gradients(y, B)
dif_AA = fwd_gradients(dif_A, A)
dif_AAA = fwd_gradients(dif_AA, A)
dif_AAAA = fwd_gradients(dif_AAA, A)

# Differential equation parts
lq1 = dif_A / (1 + dif_A**2)
lq2 = fwd_gradients(lq1, A)

# Loss function for boundary parts/initial values
sum = 0
for i in range(10):
    sum += (y[i, 0] - 1 - np.exp(x_train_2[i]))**2
# Repeat for all boundary conditions

# Loss function for the differential equation part
t_loss = (dif_B + dif_AAAA + lq2 - h2)**2
loss = tf.reduce_mean(t_loss) + sum                             # Total loss function
train_step = tf.train.AdamOptimizer(0.05).minimize(loss)        # Adam optimizer
init = tf.global_variables_initializer()

# Begin TensorFlow session
sess = tf.Session()
sess.run(init)

# Training loop
for i in range(5000):
    sess.run(train_step, feed_dict={A: input_x1, B: input_x2})
    if i % 50 == 0:
        total_loss = sess.run(loss, feed_dict={A: input_x1, B: input_x2})
        print("Loss: {}".format(total_loss))

# Rest of the code for post-processing and plotting
