[[Near-infrared spectroscopy (NIR)]] , [[Ultra-violet (UV)]]

| Resolution | Revisit Frequency | Area coverage | Imaging bands | Active devices |
| ---- | ---- | ---- | ---- | ---- |
| 30cm- 30m | High | Large | RGB, UV, NIR | Copernicus - ESA's sentinel-2 30 color channels 6k km<br>Worldview 30cm resolution |
| 5-20cm | Low 1-2years | Medium | RGB, NIR | Airplanes :p 600-2k m |
| 1-5cm | On-demand | Small | RGB, (UV) | Drones (Ebee) |
|  |  |  |  | LIDAR |
Tasks: detecting (points/pounding boxes/polygons), classification, instance segmentation (pixel-wise classification), self-supervised learning

What is the difference between semantic segmentation and instance segmentation? Instance classifies appearances of different classes separately, instead of just classifying the pixel

Different PhD projects: 
1. Trees in pointclouds: Canopy high model tells apart different heights for different trees, then creates a from-above grid of trees. Problem: misses trees below
2. Crown bounding boxes in satellite images, DINO_SWIN was the best perform, [[DINO (self-distillation with no labels)]] is a self-supervised learning method that directly predicts the output of a teacher network - built with a momentum encoder - using a standard cross-entropy loss.
3. Species classification
4. Individual tree crown delineation in satellite and aerial images QGIS
5. Palms detection 
6. Self-supervised learning goal + unlabeled + loss function, masked autoencoders
