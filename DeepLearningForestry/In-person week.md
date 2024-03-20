Dataset: 
1. leaf classification
	15 classes, [[Convolutional Neural Network (CNN)]] (maxpooling, dropout, data augmentation), add leaves from other trees
2. tree bark classification 
	images, ID, species, diameter. Maybe add it to an app? Like YOLOV :)
3. sth cover
4. UAV-collected data for tree segmentation
	preprocessing: correct lens effect, put in top of a map autorrectify is done
	there's a tree species mask that gives us the labels, so supervised learning
5. [[Unmanned Aerial Vehicle (UAV)]] vegetation height model + [[LIDAR]] data 
6. semantic land cover segmentation
	tells apart building, roads, water, barren, forest and agriculture
7. single tree obj detection
	small dataset
8. tree species classific
	descriptions in german, complex understanding, different sensors
9. tabular inventory data
	predict tree volume increment and decrease
	also 10: age of trees of a certain size

Network design
number of layers
number of neurons
basic model: subsampling, convolution, subsampling, 3x dense, gaussian connections
AlexNet: normalised input size, max pooling 5x, dense 2x 

# [[Explainable AI]]
- - -

[[Interpretable AI]]: by default some models are inherently interpretable, like [[Decision Tree]] or [[Random Forest]] and [[Linear Regression]]
[[GDPR]]: Right to an explanation 