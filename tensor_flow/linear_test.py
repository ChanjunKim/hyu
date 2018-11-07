# -*- coding: utf-8 -*-
import os
import tensorflow as tf

os.environ["TF_CPP_MIN_LOG_LEVEL"]='3'

x_data = [1, 1.2, 1.7, 2.3, 2.5, 2.6, 2.8, 3.5, 3.2, 4, 4.7, 5.3, 5.8, 6, 6.3, 6.8, 7, 7.4, 7.9, 8.5]
y_data = [3000, 3400, 3800, 4100, 4400, 5000, 4300, 4600, 6000, 5800, 600, 5200, 6900, 7000, 7800, 8100, 8500, 8700, 9200, 10000]
print(len(x_data))
print(len(y_data))
W = tf.Variable(tf.random_uniform([1], -1, 1.0), name= "weight")
b = tf.Variable(tf.random_uniform([1]), name= "bias")

X = tf.placeholder(tf.float32, name="X")
Y = tf.placeholder(tf.float32, name="Y")

hypothesis = X*W + b

cost = tf.reduce_mean(tf.square(hypothesis - Y))
optimizer = tf.train.GradientDescentOptimizer(learning_rate=0.01)
train = optimizer.minimize(cost)

with tf.Session() as sess:
    sess.run(tf.global_variables_initializer())

    for step in range(1000):
        train_val, cost_val = sess.run([train, cost], feed_dict={X:x_data, Y:y_data})
        print(step, cost_val, sess.run(W), sess.run(b))

    print("-----------------")
    print("result :", sess.run(hypothesis, feed_dict={X: 5}))