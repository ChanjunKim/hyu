# -*- coding: utf-8 -*-
import os
import tensorflow as tf
import numpy as np

os.environ["TF_CPP_MIN_LOG_LEVEL"]='3'

x_source = np.array([[0,0],[1,0],[1,1],[0,0],[0,0],[0,1]])
y_source = np.array([[1,0,0], [0,1,0],[0,0,1],[1,0,0],[1,0,0],[0,0,1]])

X = tf.placeholder(tf.float32)
Y = tf.placeholder(tf.float32)
W = tf.Variable(tf.random_uniform([2, 3], -1., 1.))
b = tf.Variable(tf.zeros([3]))

L = tf.add(tf.matmul(X, W), b)
L = tf.nn.relu(L)
model = tf.nn.softmax(L)

cost = tf.reduce_mean(-tf.reduce_sum(Y * tf.log(model), axis=1))
optimizer = tf.train.GradientDescentOptimizer(learning_rate=0.01)
train_op = optimizer.minimize(cost)

with tf.Session() as sess:
    sess.run(tf.global_variables_initializer())

    for step in range(1000):
        sess.run(train_op, feed_dict={X: x_source, Y: y_source})

        if (step+1) % 10 == 0:
            print(step+1, sess.run(cost, feed_dict={X: x_source, Y: y_source}))
    prediction = tf.argmax(model, 1)
    target = tf.argmax(Y, 1)

    print("Prediction : ", sess.run(prediction, feed_dict={X: x_source}))
    print(("Result : ", sess.run(target, feed_dict={Y:y_source})))
    is_correct = tf.equal(prediction, target)
    accuracy = tf.reduce_mean(tf.cast(is_correct, tf.float32))
    print("accuracy : %.2f" %sess.run(accuracy*100, feed_dict={X:x_source, Y:y_source}))
