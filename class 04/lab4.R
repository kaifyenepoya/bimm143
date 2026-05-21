source("http://thegrantlab.org/misc/cdc.R")
source("http://thegrantlab.org/misc/cdc.R")
> source("http://thegrantlab.org/misc/cdc.R")
> tail(cdc$weight, 20)
[1] 195 210 171 190 180 120 140 200 230 230 195 210 180 165 224 215 200
[18] 216 165 170
> plot(cdc$height, cdc$weight, xlab = "Height (inches)", ylab = "Weight (pounds)")
> cor(cdc$height, cdc$weight)
[1] 0.5553222
> hist(cdc$weight)
> hist(cdc$height)
> height_m <- cdc$height * 0.0254
> weight_kg <- cdc$weight * 0.454
> bmi <- weight_kg / (height_m^2)
> plot(cdc$height, bmi, xlab = "Height (inches)", ylab = "BMI")
> cor(cdc$height, bmi)
[1] 0.03251694
> head(bmi >= 30, 100)
[1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[12] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[23] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[34] FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[45]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[56] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE
[67] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE
[78] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[89]  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
[100] FALSE
> sum(bmi >= 30) / length(bmi)
[1] 0.19485
> (sum(bmi >= 30) / length(bmi)) * 100
[1] 19.485
> round((sum(bmi >= 30) / length(bmi)) * 100, 1)
[1] 19.5
> sum(bmi >= 30)
[1] 3897
> plot(cdc[1:100, "height"], cdc[1:100, "weight"], xlab = "Height (inches)", ylab = "Weight (pounds)")
> table(cdc$gender[bmi >= 30])

m    f 
1961 1936 
> table(cdc$gender[bmi >= 30])["m"]
m 
1961 
