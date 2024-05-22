TA 1PM f.voronine@student.rug.nl
How many sequences of 3 in the set {1,2,3,4,5} are non-decreasing
$A = \{x_1, x_2, x_3\} \in \{1, \dots, 5\}^3 : x_1 \leq x_2 \leq x_3\}$
$B= \{y_1, y_2, y_3\} \in \{1, \dots, 5\}^3 : y_1 < y_2 < y_3\}$
$f: \{x_1, x_2, x_3\} \in A \to \{y_1, y_2, y_3\} =  (x_1, x_2+1, x_3+2) \in B$

$|A|=|B|= \begin{pmatrix}5+2 \\ 3 \end{pmatrix} = \begin{pmatrix} 7 \\ 3 \end{pmatrix} = \frac{7!}{3!4!} = 35$

### Inclusion-exclusion formula
let $x$ be a finite set, $x_1, x_2, x_r \subset x$, what is the cardinality of the union of the subsets $$|\bigcup^r_{i=0} x_i| = \sum_{1 \leq i \leq r} |x_i|- \sum_{1 \leq i \leq r} |x_i \cap x_{i+1}| + \dots + (-1)^{r-1} \sum_{1 \leq i \leq r} |x_i \cap x_{i+1}\cap \dots \cap x_r| $$

dot inside $\bigcup$ says pairwise disjoint


Sampling
$$\begin{array}{c|c|c} & \text{With Replacement} & \text{Without Replacement} \\ \hline \text{With Order} & n^k & \frac{n!}{(n-k)!} \\ \text{Without Order} & \binom{n+k-1}{k} & \binom{n}{k} \\ \end{array}$$
order doesn't matter and balls go back in, indistinguishable because we don't really care about which one is out

n-1 zeros are allocated to separate n bins and we also have a total of k ones in this string. So the string length is n+k-1. 

