## Introduction
* Introduces fastText, a simple and highly efficient approach for text classification.
* At par with deep learning models in terms of accuracy though an order of magnitude faster in performance. 
* [Link to the paper](http://arxiv.org/abs/1607.01759v3)
* [Link to code](https://github.com/facebookresearch/fastText)

## Architecture

* Built on top of linear models 
* [[Rank constraint]]: The rank constraint is applied using hierarchical softmax, which organizes the classes in a binary tree structure. The rank constraint limits the number of classes considered during the softmax computation.

- [[Fast loss approximation]]: The fast loss approximation in fastText involves approximating the [Negative Log-Likelihood Loss (NLL Loss)](https://towardsdatascience.com/cross-entropy-negative-log-likelihood-and-all-that-jazz-47a95bd2e81) function during training, NLL loss has function $$- \frac{1}{N} \sum^N_{n=1} y_n \log (f(BAx_n))$$ where $f$ is the softmax function, $A$ is a look-up table over the words returning representations, $B$ is a weight matrix, $x_n$ is the normalised bag of features of the nth document, $y_n$ is the label. So basically we sum over all classes, the multiplication of the label by the probability distribution defined by the log of the softmax of the word embeddings present in the bag of features.
* Softmax layer to obtain a probability distribution over pre-defined classes.

* Start with word representations that are averaged into text representation and feed them to a linear classifier.
* Think of text representation as a hidden state that can be shared among features and classes.
* High computational complexity $O(kh)$, $k$ is the number of classes and $h$ is dimension of text representation.

### Hierarchical Softmax

* Based on Huffman Coding Tree
*  In a hierarchical softmax, each leaf node of the tree corresponds to a class, and internal nodes represent binary decisions that guide the traversal of the tree.
* Used to reduce complexity to $O(h \ log(k))$
* Top T results (from the tree) can be computed efficiently $O(logT)$ using a binary heap.

### N-gram Features
* No word order, uses a bag of n-grams (1-gram, 2-gram) to maintain efficiency without losing on accuracy (since n-grams keep partial local order information).
* To maintain fast and memory efficient mapping of the n-grams a common alternative to using dictionaries is the [hashing trick](https://arxiv.org/pdf/0902.2206.pdf), where words are mapped directly to indices with a hashing function

## Experiments

### Sentiment Analysis

* fastText benefits by using bigrams.
* Outperforms [char-CNN](http://arxiv.org/abs/1502.01710v5) and [char-CRNN](http://arxiv.org/abs/1602.00367v1) and performs a bit worse than [VDCNN](http://arxiv.org/abs/1606.01781v1).
* Order of magnitudes faster in terms of training time.
* Note: fastText does not use pre-trained word embeddings.

### Tag Prediction

* fastText with bigrams outperforms [Tagspace](http://emnlp2014.org/papers/pdf/EMNLP2014194.pdf).
* fastText performs upto 600 times faster at test time.