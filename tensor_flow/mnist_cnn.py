# -*- coding: utf-8 -*-
import os
import tensorflow as tf
import numpy as np
from tensorflow.examples.tutorials.mnist import input_data

# 제약사항
# 손글씨 이미지가 28x28 행렬데이터로 제공

os.environ["TF_CPP_MIN_LOG_LEVEL"]='3'

mnist = input_data.read_data_sets("./mnist/data/", one_hot=True)

X = tf.placeholder(tf.float32, [None, 28, 28, 1])
Y = tf.placeholder(tf.float32, [None, 10])
keep_prob = tf.placeholder(tf.float32)

W1 = tf.Variable(tf.random_normal([3, 3, 1, 32], stddev=0.01))
L1 = tf.nn.conv2d(X, W1, strides=[1,1,1,1], padding="SAME")
L1 = tf.nn.relu(L1)
L1 = tf.nn.max_pool(L1, ksize=[1, 2, 2, 1], strides=[1, 2, 2, 1], padding="SAME")

W2 = tf.Variable(tf.random_normal([3,3, 32, 64], stddev=0.01))
L2 = tf.nn.conv2d(L1, W2, strides=[1, 1, 1, 1], padding="SAME")
L2 = tf.nn.relu(L2)
L2 = tf.nn.max_pool(L2, ksize=[1, 2, 2, 1], strides=[1, 2, 2, 1], padding="SAME")

W3 = tf.Variable(tf.random_normal([7*7*64, 256], stddev=0.01))
L3 = tf.reshape(L2, [-1, 7*7*64])
L3 = tf.matmul(L3, W3)
L3 = tf.nn.relu(L3)
L3 = tf.nn.dropout(L3, keep_prob)

W4 = tf.Variable(tf.random_normal([256, 10], stddev=0.01))
model = tf.matmul(L3, W4)

softmax_logits = tf.nn.softmax_cross_entropy_with_logits(logits=model, labels=Y)
cost = tf.reduce_mean(softmax_logits)
optimizer = tf.train.AdamOptimizer(learning_rate=0.01)
train_op = optimizer.minimize(cost)

with tf.Session() as sess:
    sess.run(tf.global_variables_initializer())

    batch_size = 100
    total_batch = int(mnist.train.num_examples / batch_size)

    for epoch in range(15):
        total_cost = 0
        for i in range(total_batch):
            batch_xs, batch_ys = mnist.train.next_batch(batch_size)
            batch_xs = batch_xs.reshape([-1, 28, 28, 1])

            train_op_val, cost_val = sess.run([train_op, cost], feed_dict= {X: batch_xs, Y: batch_ys, keep_prob : 0.7})
            total_cost += cost_val
        print("Epoch : ", epoch + 1, "Avg.cost = {:.3f}".format(total_cost / total_batch))

    is_correct = tf.equal(tf.arg_max(model, 1), tf.arg_max(Y, 1))
    accuracy = tf.reduce_mean(tf.cast(is_correct, tf.float32))
    print("Accuracy : ", sess.run(accuracy, feed_dict={X: mnist.test.images.reshapes([-1, 28, 28, 1]), Y: mnist.test.labels, keep_prob: 1}))