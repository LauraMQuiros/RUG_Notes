A digital image pipeline has two steps: 
1. Image enhancement
	1. increase contrast or brightness, so that the images are visible. Transfer function $Y=ax+b$. The x axis is the input pixel value and the y is the output pixel value. Highest slope means high contrast.
	2. Image enhancement with normalisation. This way we cover the whole pixel intensity spectrum. [[Min-max normalisation]] is very popular in [[Machine Learning (ML)]] $$p'X = \frac{p_X - X_{min}}{X_max - X_{min}}$$ but we also can use the [[Z-score]] $$p'X = \frac{p_X - \mu}{\sigma}$$
	3. Non-uniform illumination by subtracting the background. We remove the baseline color spread through all the picture (all image is 50px darker). [Rolling ball](https://scikit-image.org/docs/stable/auto_examples/segmentation/plot_rolling_ball.html) (we roll ball and check baseline, depends on radius of ball), polynomial functions 
	4. Denoising w filters. We may use [[Impulse Noise]] or [[Gaussian noise]]. The principle of filters is convolution, the operation done to an area of the original image. Padding is done to increase the original image shape using the surrounding pixel values. Stride is the amount of pixels the image window is moving to the side
		denoising filters. 
			linear filter: mean 3x3 (smoothing filters), weighted mean ([[Gaussian blur]]), blurring effect doesn't keep edges
			non- linear filter: median 3x3 (rank filters): sorting + median

2. Segmentation: separating, splitting from [[Region of Interest (ROI)]] to background (Threshold, Edges, Clustering)
	1. Mathematical morphology for binary images: erosion (shrinking the size), dilation, closing, opening, fill holes, skeletonisation, watershed
	5. Analyse
		1. distance. [[Euclidean distance]], city-block, [[Manhattan Distance]], chessboard
		2. counting. we can make tables with values of the surrounding ROI and change it if they all of similar value. By dropping colours and letting them spread we can identify the number of objects. If obj are connected then they may be id'd as one
		3. bounding box-size
		4. ML Methods. Explore deeply the distribution in diff objects, classification obj