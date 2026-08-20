---
layout: post
title: "Stateful dataflow graphs in tensorflow"
date: 2020-08-19 08:33:08 +0000
permalink: /blog/2020/08/basics-of-tensorflow/
tags: ["Machine Learning", "#docs"]
---

<p></p><p>TensorFlow is google’s second-generation system for the implementation and deployment of large-scale machine learning models. It is flexible enough to be used both in research and production. Computations in TensorFlow are expressed as stateful dataflow graphs.</p><h2 id="essential-vocabulary">Essential Vocabulary:</h2><p><strong><em>Basic computation model: </em></strong>Computations in tensor flow are represented by a directed graph which is composed of a set of <strong>nodes</strong><em>. </em>Each node has zero or more inputs and zero or more outputs and represents the instantiation of an <strong><em>operation</em></strong>. Graphs are constructed using supported front-end langauges(C++/Python)</p><figure class="kg-card kg-image-card"><img src="https://cdn-images-1.medium.com/max/1280/1*SphaGFPz9CDpbHbO-L2Ieg.png" class="kg-image" alt="" loading="lazy" width="530" height="534"></figure><p><strong><em>Control Dependency: </em></strong>They indicate that the source node must finish execution before the destination node begins execution.</p><p><em><strong>Variables:</strong> </em>A special kind of <em>operation</em> that returns a handle to a persistent mutable tensor that survives across executions of a graph.</p><p><strong><em>Tensors:</em></strong> They are the values that flow along the normal edges of the graph. A typed multi-dimensional array(e.g 8–64 bit signed or unsigned integers, IEEE float and double, complex number or a string type, which can be an arbitrary</p><p><em><strong>Session: </strong></em>A Session has to be created for executing the<em> dataflow graph<strong>. </strong></em>The execution may usually involve providing a set of inputs/outputs in batches. It supports two main functions:</p><blockquote><strong>Extend — </strong>used to add additional nodes to the dataflow model</blockquote><blockquote><strong>Run — </strong><em>Takes as argument a set of named nodes to be computed as well as an optional set of tensors to be used in place of certain node outputs. It then uses the graph to figure all node requires to compute the requested outputs, and performs them in a order that respects their dependenies.</em></blockquote><p><strong>Variables: </strong>A variable is a special kind of operation that returns a handle to a persistent mutable tensor that survives across executions of a graph.</p><p><em><strong>Operation:</strong> </em>It represents computations such as those shown in the table below:</p><figure class="kg-card kg-image-card kg-card-hascaption"><img src="https://cdn-images-1.medium.com/max/1280/1*6uYlomwCAKA89_QSiDcBiQ.png" class="kg-image" alt="" loading="lazy" width="1256" height="374"><figcaption><span style="white-space: pre-wrap;">Example Operation types&nbsp;[1]</span></figcaption></figure><p>An operation can have attributes and they must be provided or inferred at graph-construction time.</p><p><strong>Execution:</strong></p><ul><li><em><strong>Input: </strong>feed_dict</em> parameter in the <em>session.run</em> method is used to feed the input data. TensorFlow also supports reading tensors in directly from files.</li><li>When implementing a machine learning algorithms, we store the parameters of the model in tensors held in variables.</li><li>If you consider the basic scenario where it is executed on a single-device then the nodes of the graph(representing the computation) are executed in an order that respects the dependencies between nodes.</li></ul><p><strong><em>Implementation: </em></strong>TensorFlow System consists of client, master and worker processes. The client uses a session interface to communicate with the master and master schedules co-ordinates worker processes and relays results back to the client. Worker Processes are then responsible for maintaining access to devices such as CPU/GPU cores and execute graph nodes on their respective devices.</p><figure class="kg-card kg-image-card"><img src="https://cdn-images-1.medium.com/max/960/1*bTPbiW7_R8y-ca2yeowFMg.png" class="kg-image" alt="" loading="lazy" width="588" height="520"></figure><p><strong><em>Gradient Computations</em>:</strong> Gradient descent is one of the most popular algorithms to perform optimisation(usually involves minimising the cost function while training the ML model). Tensor-flow provides built-in support for gradient computations.</p><p><strong><em>Control Flow(if-conditionals and While-loops): </em></strong>Usually explicit control flow is not needed, but tensor flow does provide a few operators. For example switch and merge operators can be used to skip the execution of the entire subgraph(based on value of a boolean tensor). The Enter,Leave and NextIteration operators allow us to express iteration.</p><p><strong><em>Some Examples:</em></strong></p><ol><li><strong>Variables</strong>: They generally hold and update parameters used in training a ML model. Upon creation we pass a tensor as its initial value to the Variable() constructor and we have to specify the shape of the tensor.</li></ol><p><em>Example:</em></p><pre><code>state = tf.Variable(0, name="counter”)   #declare(pass value and name)   

update = tf.assign(state, new_value)     #update

with tf.Session() as sess: 

sess.run(tf.initialize_all_variables())        #initialize
print(sess.run(state))                        #execute graph(or in this                                                  #case retrieve value)            
                                        </code></pre><p>This is usually done inside the session.run() command</p><p>2. <strong><em>Add/Multiply Operations with</em></strong> <strong><em>Constants</em></strong>:</p><pre><code>input1 = tf.constant(3.0) 
input2 = tf.constant(2.0)
input3 = tf.constant(5.0)

intermed = tf.add(input2,input3)
mul = tf.mul(input1,intermed)

with tf.Session() as sess:
	result = sess.run([mul,intermed])     
	print(result)</code></pre><p><strong><em>3. Inputting data(placeholders and Feed Dictionaries):</em></strong></p><p>There are three methods of getting data into a TensorFlow program:</p><p>i. For small datasets we can pre-hold them in a constant or a variable</p><p>ii. Feeding: For example using feed_dict argument to a run() or eval() call</p><pre><code>#placeholder variables are dummy nodes that provide entry points for data to computational graph

input1 = tf.placeholder(tf.float32)      #pass type
input2 = tf.placeholder(tf.float32)

output = tf.mul(input1,input2) 

feed = {input1:[7.],input2:[2.]}

#feed data into the computational graph and fetch output 

with tf.Session() as sess: 
    print(sess.run([output],feed_dict=feed))

#Placeholders exist to serve as the target of feed.</code></pre><p></p><p>iii. Reading from files:</p><p>List of filenames can for example be read as:</p><pre><code>[(“file%d” % i) for i in range(2)])</code></pre><p>The filename queue can then be passed to reader’s read method. Readers are selected based on the input file format .</p><p><strong><em>4. Graph Execution: </em></strong>The computational graph expressed in Tensor flow has no numerical value until executed. We execute the graph by creating as session(which encapsulates the environment in which tensor objects are evaluated). A good way is to use the with statement.</p><pre><code>with tf.session() as sess: 
	print(sess.run(c)) 
	print(c.eval())</code></pre><p>where c is the dataflow graph we want to execute.</p><p><strong><em>5. Saving the model:</em></strong></p><p><strong>tf.train.Saver</strong> object can be used to save and restore a model.</p><p>Example:</p><pre><code>saver = tf.train.Saver()
...
save_path = saver.save(sess,"/temp/model.ckpt")
print("Model saved in file: %s" % save_path
...
.
saver.restore(sess,"/tmp/model.ckpt")
print("Model restored.")</code></pre><p></p><p>If you want more example of code, have a look at the following: </p><p><strong><em>Hello World Program: </em></strong><a href="https://www.tensorflow.org/versions/r0.7/tutorials/mnist/beginners/index.html" rel="nofollow noopener noopener">https://www.tensorflow.org/versions/r0.7/tutorials/mnist/beginners/index.html</a></p><p><a href="https://github.com/tflearn/tflearn/blob/master/tutorials/intro/quickstart.md" rel="nofollow noopener noopener">https://github.com/tflearn/tflearn/blob/master/tutorials/intro/quickstart.md</a></p>
