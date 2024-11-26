## Mathematical rep

## [[Digitization /Analog-Digital Conversion (ADC)]]

### Sampling & grid resolution 
### Quantisation & Value resolution

[[Quantisation]] refers to reducing the number of distinct intensity levels (or states) used to represent pixel values. "Adapting quantisation" aims to achieve this reduction while preserving visual quality, meaning the result should look as close to the original image as possible.
For example: **1-bit quantisation** uses 2 states (black and white), which is sufficient for binary images.

Stochastic perspective
- event/state: intensity of pixel $x$ 
- probability P of event $x$: May be uniform. Digital information is stored as binary numbers, base $b=2$ to express event $x$. reminders on how probability works: $P(X)=1, \forall x \in X, P(x_1+x_2)= P(x_1) + P(x_2)$ if $P(x_1 \cap x_2) = 0$.

[[Shannon's Information Theory]] quantifies the **amount of information** gained from observing an event $x$. The **information content** of an event is inversely related to its probability: the less likely an event, the more information it carries: $I(x) = -\log_2[P(x)]$ . If two x are equally likely then $I(x) = -\log_2(0.5)= 1$ but if one has $P(x)=1/8$, then $I(x)= -\log_2(1/8)= 3$
	The information content of an image is not the sum of information per each pixel event
[[Shannon's Entropy]] is the average information $H(x) = - \sum P(x) \log_2(P(x)), \forall x \in X$ 

If we use our knowledge of the [[Joint 2D Histogram]], we can make that 
Shannon entropy $H(X,Y) = - \sum^{|X|}_{x=0}  \sum^{|Y|}_{y=0} P(x,y) \log_2(P(x,y))$
mutual information $M(I_1, I_2) = H(I_1) + H(I_2) - H(I_1, I_2)$

### Adapting single-channel quantisation
**Subdivide or Reallocate the Value Space**: Decide how to divide the continuous or discrete range of pixel intensities (e.g., 0–255 for 8-bit images) into a smaller number of quantisation levels while maintaining perceptual quality.

We can make a [[Look-Up Table (LUT)]] that for x-axis pixel intensity gives us frequency of that intensity. We assign indexes $i=0...7$ to the peaks of the distribution.
```
// Initialize an array of new quantization levels, based on histogram peak levels
Initialize nlevels[0..k-1] via histogram peak levels // k is the number of quantization levels

// Create a Look-Up Table (LUT) to map original intensity levels to new quantized levels
Initialize array LUT[0..p-1], p = # original levels // For 8-bit images, p = 256

// Initialize the first peak and the second peak to start the mapping process
thispeak = nlevels[0]            // Set the first peak as the current peak
nextpeak = nlevels[1]            // Set the second peak as the next peak
thispeak_index = 0               // Start with the first quantized level

// Iterate through all original intensity levels to populate the LUT
For i in levels // Loop over all possible intensity levels (0 to 255 for 8-bit)
    dist_current = abs(i - thispeak) // Compute distance of i to the current peak
    dist_next = abs(i - nextpeak)   // Compute distance of i to the next peak

    // Decide which quantization level to assign based on proximity
    If dist_next < dist_current      // If i is closer to the next peak
        LUT[i] = thispeak_index + 1  // Map i to the next quantization level
    Else                             // Otherwise,
        LUT[i] = thispeak_index      // Map i to the current quantization level

    // Check if we have reached the next peak and update peak indices
    If i == nextpeak and i < max(levels) // If i is the current next peak and not the last level
        thispeak = nextpeak               // Move to the next peak
        thispeak_index += 1               // Increment the quantized level index
        nextpeak = nlevels[thispeak_index + 1] // Update nextpeak to the subsequent peak

// Apply the LUT to the image for quantization
For x, y in image                  // Loop over all pixels in the image
    f(x, y) = LUT[f(x, y)]         // Replace each pixel value with its corresponding quantized level

```

However this plain subdivision is not efficient when we have RGB instead of greyscale. We can use [[K-Means Clustering]] for this.

### Adapting image resolution
Interpolation
- [[Nearest Neighbour Interpolation]]: value of the closest pixel 
- [[Bilinear Interpolation]]: weighted average of 4 neighbouring pixels
- [[Higher-order Interpolation]]: [[Bicubic Interpolation]] pros smoother pixel gradient
where $w_{11}=(1-\alpha)(1-\beta), w_{12}= (1-\alpha) \beta, w_{21}=\alpha (1- \beta), w_{22}=\alpha \beta$ then $I(x=0.5, y=1)= I(x_0, y_0) w_{11} + I(x_0,y_0 + 1) w_{12} + I(x_0 + 1,y_0) w_{21} + I(x_0+1,y_0+1) w_{22}$ 

downsampling, upsampling (zooming in)
