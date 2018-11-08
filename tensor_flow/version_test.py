import os
import sys
import tensorflow as tf

os.environ["TF_CPP_MIN_LOG_LEVEL"]='3'
hello = tf.constant("Hello")
sess = tf.Session()

print(sess.run(hello))
print(str(sess.run(hello), encoding="utf-8"))
print(sys.version)