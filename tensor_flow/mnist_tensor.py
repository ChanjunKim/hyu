# -*- coding: utf-8 -*-
import os
import tensorflow as tf
import numpy as np
from tensorflow.examples.tutorials.mnist import input_data

# 제약사항
# 손글씨 이미지가 28x28 행렬데이터로 제공

os.environ["TF_CPP_MIN_LOG_LEVEL"]='3'

mnist = input_data.read_data_sets("./mnist/data/", one_hot=True)

X = tf.placeholder(tf.float32, [None, 784])
Y = tf.placeholder(tf.float32, [None, 10])

W1 = tf.Variable(tf.random_normal([784,256], stddev=0.01))
L1 = tf.nn.relu(tf.matmul(X, W1))

W2 = tf.Variable(tf.random_normal([256,256], stddev=0.01))
L2 = tf.nn.relu(tf.matmul(L1, W2))

W3 = tf.Variable(tf.random_normal([256,10], stddev=0.01))

model = tf.matmul(L2, W3)

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
            train_op_val, cost_val = sess.run([train_op, cost], feed_dict={X: batch_xs, Y: batch_ys})
            total_cost += cost_val
        print("Epoch : ", epoch+1, "Avg.cost = {:.3f}".format(total_cost/total_batch))

    is_correct = tf.equal(tf.arg_max(model, 1), tf.arg_max(Y, 1))
    accuracy = tf.reduce_mean(tf.cast(is_correct, tf.float32))
    print("Accuracy : ", sess.run(accuracy, feed_dict={X: mnist.test.images, Y: mnist.test.labels}))