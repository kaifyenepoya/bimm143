# Class 7 : Machine Learning 1
KAIF YENEPOYA (PID: A17497464

- [Background](#background)
- [K-means clustering](#k-means-clustering)
- [Hierarchichal Clustering](#hierarchichal-clustering)
- [Principal Component Analysis
  (PCA)](#principal-component-analysis-pca)
- [Analysis of UK food data](#analysis-of-uk-food-data)
- [Data Import](#data-import)
- [PCA to the rescue](#pca-to-the-rescue)
- [Tidy the Data](#tidy-the-data)
- [Exporatory analysis](#exporatory-analysis)
- [PCA](#pca)

``` r
library(ggplot2)
```

## Background

Today we will explore some core machine learning methods that are very
popular in bioinformatics. These include **clustering** and
**dimensionallity reduction**

## K-means clustering

Th main fucntion in “base” R for K-means clsutering is called ‘kmeans()’

Before we go too deep let’s make up some “simple” data that we can
cluster and know if we are getteing a good answer or not. To do thus we
can use the ‘rnorm()’ function:

``` r
hist(rnorm(10000, mean=3))
```

![](CLASS07_files/figure-commonmark/unnamed-chunk-2-1.png)

``` r
x <- c(rnorm(30, -3), rnorm(30, +3))
```

``` r
z <- cbind(x=x, y=rev(x))
plot(z)
```

![](CLASS07_files/figure-commonmark/unnamed-chunk-4-1.png)

Now we can run ‘kmeans() on this input ’z’ and see what the reesults
look like.

``` r
km <- kmeans(z, centers = 2)
```

``` r
attributes(km)
```

    $names
    [1] "cluster"      "centers"      "totss"        "withinss"     "tot.withinss"
    [6] "betweenss"    "size"         "iter"         "ifault"      

    $class
    [1] "kmeans"

> How many points are in each clsuter?

``` r
km$size
```

    [1] 30 30

> Q. What “component of your result object details cluster assignemnt/
> membership?

km\$cluster

> Q . What “component of your result object details clauster center?

km\$centers

> Q . Plot ‘z’ colored by the kmeans cluster assignment and add cluster
> centers as blue points

``` r
plot(z, col = km$cluster)
points(km$centers, col = "blue", pch = 16, cex = 2)
```

![](CLASS07_files/figure-commonmark/unnamed-chunk-8-1.png)

> Q . Run a K-means clsutering and plot the results asking for 4
> clusters (K=4)?

``` r
km4 <- kmeans(z, centers = 4)

plot(z, col = km4$cluster)
points(km4$centers, col = "blue", pch = 16, cex = 2)
```

![](CLASS07_files/figure-commonmark/unnamed-chunk-9-1.png)

> **N.B. ** You need to tell K-means the number of clusters (i.e. set
> ‘centers=2’)!!

One approach is to try different values for ‘centers’ and then pick the
best…

``` r
ans <- NULL

for (i in 1:10) {
  km <- kmeans(z, centers = i)
  ans <- c(ans, km$tot.withinss)
}

plot(ans, type = "o",
     xlab = "Number of clusters",
     ylab = "Total Sum Of Square Distance")
```

![](CLASS07_files/figure-commonmark/unnamed-chunk-10-1.png)

## Hierarchichal Clustering

The main function in “base” R for Hierarchichal Clustering is called
‘hclust()’

This function deos nott ake your “raw” data for clustering. You must
first build a “distance matrix” from your data and pass this as input to
‘hclust()’

``` r
d <- dist(z)
hc <- hclust(d)
hc
```


    Call:
    hclust(d = d)

    Cluster method   : complete 
    Distance         : euclidean 
    Number of objects: 60 

There is a bespoke ‘plot()’ method for ‘hclust()’ result objects.

``` r
plot(hc)
abline(h=8, col="red")
```

![](CLASS07_files/figure-commonmark/unnamed-chunk-12-1.png)

Once we have our ‘hclust’ object (our “tree” of “cluster dndogram”) we
can **cut** the tree to reveal the clustering pattern.

``` r
cutree(hc, h=8)
```

     [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2
    [39] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2

> Q. Make a polt of ‘z’ with your hclust results(i.e colored by clsuter
> membership)

``` r
grps <- cutree(hc, h = 8)

plot(z,
     col = c("blue", "red")[grps],
     pch = 16,
     main = "Hierarchical Clustering Results")
```

![](CLASS07_files/figure-commonmark/unnamed-chunk-14-1.png)

## Principal Component Analysis (PCA)

PCA is a dimensionality reduction method that is popular for revealing
patterns in complex datasets

## Analysis of UK food data

Let’s look at some data on eating habits of folks from the UK to see if
there are patterns and trends thta have some regions being distinct from
others.

## Data Import

The data is made available in CSV format so we can use the ‘read.csv()’
function for import to R

``` r
url <- "https://tinyurl.com/UK-foods"
x <- read.csv(url, row.names = 1)

pca <- prcomp(t(x), scale. = TRUE)
```

> Q1. How many rows and columns are in your new data frame named x? What
> R functions could you use to answer this questions?

``` r
nrow(x)
```

    [1] 17

``` r
ncol(x)
```

    [1] 4

17 rows and 5 colunmns

> Q2. Which approach to solving the ‘row-names problem’ mentioned above
> do you prefer and why? Is one approach more robust than another under
> certain circumstances?

The second approach is better because it is more robust. Using x \<-
x\[, -1\] repeatedly will keep removing columns each time we are going
to run it, which can accidentally cause us to delete real data. Setting
row names directly is safer because it fixes the row-name issue without
changing the rest of the data.

> Q3: Changing what optional argument in the above barplot() function
> results in the following plot?

``` r
barplot(as.matrix(x), col = rainbow(nrow(x)))
```

![](CLASS07_files/figure-commonmark/unnamed-chunk-17-1.png)

> Q4: Changing what optional argument in the above ggplot() code results
> in a stacked barplot figure?

``` r
geom_col(position = "stack")
```

    geom_col: na.rm = FALSE, just = 0.5, lineend = butt, linejoin = mitre
    stat_identity: na.rm = FALSE
    position_stack 

Change position = “dodge” to position = “stack”

> \*\* Key-point\*\* : Even relatively small datasets can prove
> challenging to interpret

## PCA to the rescue

The main function in “base” R for PCA is called ‘prcomp()’. This
function wants the “observations” to be rows and the “variables” to be
columns.

So here we need to take the transpose of our ’x” input object

``` r
pca <- prcomp(t(x))
summary(pca)
```

    Importance of components:
                                PC1      PC2      PC3       PC4
    Standard deviation     324.1502 212.7478 73.87622 2.921e-14
    Proportion of Variance   0.6744   0.2905  0.03503 0.000e+00
    Cumulative Proportion    0.6744   0.9650  1.00000 1.000e+00

The return ‘pca’ object has components that we can sue to make our main
result figures:

``` r
attributes(pca)
```

    $names
    [1] "sdev"     "rotation" "center"   "scale"    "x"       

    $class
    [1] "prcomp"

The main result figure from thisd analysis is called a “PC score plot”
or “ordenation plot” “PC plot” or PC1 vs PC2 plot”.

This plot shows how samples (in this case countries) relate

``` r
library(ggplot2)
mycols <- c("orange", "red", "blue", "darkgreen")

ggplot(pca$x) +
  aes(PC1, PC2,) +
  geom_point(col=mycols)
```

![](CLASS07_files/figure-commonmark/unnamed-chunk-21-1.png)

``` r
pca$x
```

                     PC1         PC2        PC3           PC4
    England   -144.99315   -2.532999 105.768945 -9.152022e-15
    Wales     -240.52915 -224.646925 -56.475555  5.560040e-13
    Scotland   -91.86934  286.081786 -44.415495 -6.638419e-13
    N.Ireland  477.39164  -58.901862  -4.877895  1.329771e-13

``` r
library(ggplot2)

# colors for each point/label
mycols <- c("orange", "red", "blue", "darkgreen")

# make PCA scores a data frame
pca_df <- as.data.frame(pca$x)

# plot PC1 vs PC2 with point labels
ggplot(pca_df, aes(x = PC1, y = PC2)) +
  geom_point(color = mycols, size = 3) +
  geom_text(
    aes(label = rownames(pca_df)),
    color = mycols,
    vjust = -0.7,
    size = 4
  ) +
  labs(x = "PC1", y = "PC2") +
  theme_minimal()
```

![](CLASS07_files/figure-commonmark/unnamed-chunk-22-1.png)

``` r
pca$rotation
```

                                 PC1          PC2         PC3          PC4
    Cheese              -0.056955380  0.016012850  0.02394295 -0.409382587
    Carcass_meat         0.047927628  0.013915823  0.06367111  0.729481922
    Other_meat          -0.258916658 -0.015331138 -0.55384854  0.331001134
    Fish                -0.084414983 -0.050754947  0.03906481  0.022375878
    Fats_and_oils       -0.005193623 -0.095388656 -0.12522257  0.034512161
    Sugars              -0.037620983 -0.043021699 -0.03605745  0.024943337
    Fresh_potatoes       0.401402060 -0.715017078 -0.20668248  0.021396007
    Fresh_Veg           -0.151849942 -0.144900268  0.21382237  0.001606882
    Other_Veg           -0.243593729 -0.225450923 -0.05332841  0.031153231
    Processed_potatoes  -0.026886233  0.042850761 -0.07364902 -0.017379680
    Processed_Veg       -0.036488269 -0.045451802  0.05289191  0.021250980
    Fresh_fruit         -0.632640898 -0.177740743  0.40012865  0.227657348
    Cereals             -0.047702858 -0.212599678 -0.35884921  0.100043319
    Beverages           -0.026187756 -0.030560542 -0.04135860 -0.018382072
    Soft_drinks          0.232244140  0.555124311 -0.16942648  0.222319484
    Alcoholic_drinks    -0.463968168  0.113536523 -0.49858320 -0.273126013
    Confectionery       -0.029650201  0.005949921 -0.05232164  0.001890737

``` r
ggplot(pca$rotation) +
  aes(PC1, row.names(pca$rotation)) +
  geom_col()
```

![](CLASS07_files/figure-commonmark/unnamed-chunk-24-1.png)

The PCA scores plot shows clear dietary differences among the four UK
countries. Northern Ireland is separated strongly along PC1, suggesting
a distinct overall food consumption pattern compared with the other
countries. Scotland is separated mainly along PC2, while England lies
near the center, indicating a more average profile relative to the
group. Wales clusters closer to England on PC1 but differs on PC2.

The loadings plot helps explain these separations by showing which food
categories contribute most to the principal components. Fresh fruit has
a strong negative loading on PC1, while fresh potatoes and soft drinks
contribute positively to PC1. PC2 is influenced strongly by sugars and
soft drinks in the positive direction, whereas fresh fruit contributes
negatively. These variables appear to be the main drivers of variation
in dietary patterns across the countries.

## Tidy the Data

Fix anything that went wrong with data import

## Exporatory analysis

Make some plots to help make sense of obvioujs trends…

## PCA
