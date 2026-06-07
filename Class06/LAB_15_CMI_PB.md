# Pertussis and the CMI-PB Project
KAIF YENEPOYA

- [Pertussis and the CMI-PB Project](#pertussis-and-the-cmi-pb-project)
  - [Setup](#setup)
- [1. Investigating pertussis cases by
  year](#1-investigating-pertussis-cases-by-year)
  - [Q1. With the help of the R “addin” package datapasta assign the CDC
    pertussis case number data to a data frame called `cdc` and use
    ggplot to make a plot of case numbers over
    time.](#q1-with-the-help-of-the-r-addin-package-datapasta-assign-the-cdc-pertussis-case-number-data-to-a-data-frame-called-cdc-and-use-ggplot-to-make-a-plot-of-case-numbers-over-time)
- [2. A tale of two vaccines: wP and
  aP](#2-a-tale-of-two-vaccines-wp-and-ap)
  - [Q2. Using the ggplot `geom_vline()` function add lines to your
    previous plot for the 1946 introduction of the wP vaccine and the
    1996 switch to aP vaccine. What do you
    notice?](#q2-using-the-ggplot-geom_vline-function-add-lines-to-your-previous-plot-for-the-1946-introduction-of-the-wp-vaccine-and-the-1996-switch-to-ap-vaccine-what-do-you-notice)
  - [Q3. Describe what happened after the introduction of the aP
    vaccine? Do you have a possible explanation for the observed
    trend?](#q3-describe-what-happened-after-the-introduction-of-the-ap-vaccine-do-you-have-a-possible-explanation-for-the-observed-trend)
- [3. Exploring CMI-PB data](#3-exploring-cmi-pb-data)
  - [Reading the subject data](#reading-the-subject-data)
  - [Q4. How many aP and wP infancy vaccinated subjects are in the
    dataset?](#q4-how-many-ap-and-wp-infancy-vaccinated-subjects-are-in-the-dataset)
  - [Q5. How many Male and Female subjects/patients are in the
    dataset?](#q5-how-many-male-and-female-subjectspatients-are-in-the-dataset)
  - [Q6. What is the breakdown of race and biological
    sex?](#q6-what-is-the-breakdown-of-race-and-biological-sex)
  - [Q7. Using this approach determine (i) the average age of wP
    individuals, (ii) the average age of aP individuals; and (iii) are
    they significantly
    different?](#q7-using-this-approach-determine-i-the-average-age-of-wp-individuals-ii-the-average-age-of-ap-individuals-and-iii-are-they-significantly-different)
  - [Q8. Determine the age of all individuals at time of
    boost.](#q8-determine-the-age-of-all-individuals-at-time-of-boost)
  - [Q9. With the help of a faceted boxplot or histogram, do you think
    these two groups are significantly
    different?](#q9-with-the-help-of-a-faceted-boxplot-or-histogram-do-you-think-these-two-groups-are-significantly-different)
  - [Reading specimen and antibody titer
    data](#reading-specimen-and-antibody-titer-data)
  - [Q9. Complete the code to join specimen and subject tables to make a
    new merged data frame containing all specimen records along with
    their associated subject
    details.](#q9-complete-the-code-to-join-specimen-and-subject-tables-to-make-a-new-merged-data-frame-containing-all-specimen-records-along-with-their-associated-subject-details)
  - [Q10. Now using the same procedure join meta with titer data so we
    can further analyze this data in terms of time of visit, aP/wP,
    male/female,
    etc.](#q10-now-using-the-same-procedure-join-meta-with-titer-data-so-we-can-further-analyze-this-data-in-terms-of-time-of-visit-apwp-malefemale-etc)
  - [Q11. How many specimens/entries in `abdata` do we have for each
    isotype?](#q11-how-many-specimensentries-in-abdata-do-we-have-for-each-isotype)
  - [Q12. What are the different `dataset` values in `abdata` and what
    do you notice about the number of rows for the most recent
    dataset?](#q12-what-are-the-different-dataset-values-in-abdata-and-what-do-you-notice-about-the-number-of-rows-for-the-most-recent-dataset)
- [4. Examine IgG Ab titer levels](#4-examine-igg-ab-titer-levels)
  - [Filtering for IgG antibody data](#filtering-for-igg-antibody-data)
  - [Q13. Complete the following code to make a summary boxplot of Ab
    titer levels for all
    antigens.](#q13-complete-the-following-code-to-make-a-summary-boxplot-of-ab-titer-levels-for-all-antigens)
  - [Q14. What antigens show differences in the level of IgG antibody
    titers recognizing them over time? Why these and not
    others?](#q14-what-antigens-show-differences-in-the-level-of-igg-antibody-titers-recognizing-them-over-time-why-these-and-not-others)
  - [Q15. Filter to pull out only two specific antigens for analysis and
    create a boxplot for
    each.](#q15-filter-to-pull-out-only-two-specific-antigens-for-analysis-and-create-a-boxplot-for-each)
  - [Q16. What do you notice about these two antigens time courses and
    the PT data in
    particular?](#q16-what-do-you-notice-about-these-two-antigens-time-courses-and-the-pt-data-in-particular)
  - [Q17. Do you see any clear difference in aP vs. wP
    responses?](#q17-do-you-see-any-clear-difference-in-ap-vs-wp-responses)
  - [Q18. Does this trend look similar for the 2020
    dataset?](#q18-does-this-trend-look-similar-for-the-2020-dataset)
- [5. Obtaining CMI-PB RNASeq data](#5-obtaining-cmi-pb-rnaseq-data)
  - [Reading RNASeq data for IGHG1](#reading-rnaseq-data-for-ighg1)
  - [Q19. Make a plot of the time course of gene expression for IGHG1
    gene, i.e. a plot of visit
    vs. TPM.](#q19-make-a-plot-of-the-time-course-of-gene-expression-for-ighg1-gene-ie-a-plot-of-visit-vs-tpm)
  - [Q20. What do you notice about the expression of this gene,
    i.e. when is it at its maximum
    level?](#q20-what-do-you-notice-about-the-expression-of-this-gene-ie-when-is-it-at-its-maximum-level)
  - [Q21. Does this pattern in time match the trend of antibody titer
    data? If not, why
    not?](#q21-does-this-pattern-in-time-match-the-trend-of-antibody-titer-data-if-not-why-not)

# Pertussis and the CMI-PB Project

## Setup

``` r
library(tidyverse)
```

    ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ✔ dplyr     1.2.1     ✔ readr     2.2.0
    ✔ forcats   1.0.1     ✔ stringr   1.6.0
    ✔ ggplot2   4.0.2     ✔ tibble    3.3.1
    ✔ lubridate 1.9.5     ✔ tidyr     1.3.2
    ✔ purrr     1.2.2     
    ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ✖ dplyr::filter() masks stats::filter()
    ✖ dplyr::lag()    masks stats::lag()
    ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

``` r
library(jsonlite)
```


    Attaching package: 'jsonlite'

    The following object is masked from 'package:purrr':

        flatten

``` r
library(lubridate)
library(datapasta)
```

# 1. Investigating pertussis cases by year

## Q1. With the help of the R “addin” package datapasta assign the CDC pertussis case number data to a data frame called `cdc` and use ggplot to make a plot of case numbers over time.

``` r
cdc <- tibble::tribble(
  ~Year, ~Cases,
  2025, 28783,
  2024, 43321,
  2023, 7063,
  2022, 3044,
  2021, 2116,
  2020, 6124,
  2019, 18617,
  2018, 15609,
  2017, 18975,
  2016, 17972,
  2015, 20762,
  2014, 32971,
  2013, 28639,
  2012, 48277,
  2011, 18719,
  2010, 27550,
  2009, 16858,
  2008, 13278,
  2007, 10454,
  2006, 15632,
  2005, 25616,
  2004, 25827,
  2003, 11647,
  2002, 9771,
  2001, 7580,
  2000, 7867,
  1999, 7298,
  1998, 7405,
  1997, 6564,
  1996, 7796,
  1995, 5137,
  1994, 4617,
  1993, 6586,
  1992, 4083,
  1991, 2719,
  1990, 4570,
  1989, 4157,
  1988, 3450,
  1987, 2823,
  1986, 4195,
  1985, 3589,
  1984, 2276,
  1983, 2463,
  1982, 1895,
  1981, 1248,
  1980, 1730,
  1979, 1623,
  1978, 2063,
  1977, 2177,
  1976, 1010,
  1975, 1738,
  1974, 2402,
  1973, 1759,
  1972, 3287,
  1971, 3036,
  1970, 4249,
  1969, 3285,
  1968, 4810,
  1967, 9718,
  1966, 7717,
  1965, 6799,
  1964, 13005,
  1963, 17135,
  1962, 17749,
  1961, 11468,
  1960, 14809,
  1959, 40005,
  1958, 32148,
  1957, 28295,
  1956, 31732,
  1955, 62786,
  1954, 60886,
  1953, 37129,
  1952, 45030,
  1951, 68687,
  1950, 120718,
  1949, 69479,
  1948, 74715,
  1947, 156517,
  1946, 109860,
  1945, 133792,
  1944, 109873,
  1943, 191890,
  1942, 191383,
  1941, 222202,
  1940, 183866,
  1939, 103188,
  1938, 227319,
  1937, 214652,
  1936, 147237,
  1935, 180518,
  1934, 265269,
  1933, 179135,
  1932, 215343,
  1931, 172559,
  1930, 166914,
  1929, 197371,
  1928, 161799,
  1927, 181411,
  1926, 202210,
  1925, 152003,
  1924, 165418,
  1923, 164191,
  1922, 107473
)

head(cdc)
```

    # A tibble: 6 × 2
       Year Cases
      <dbl> <dbl>
    1  2025 28783
    2  2024 43321
    3  2023  7063
    4  2022  3044
    5  2021  2116
    6  2020  6124

``` r
ggplot(cdc) +
  aes(x = Year, y = Cases) +
  geom_line() +
  geom_point() +
  labs(
    title = "U.S. Reported Pertussis Cases Over Time",
    x = "Year",
    y = "Number of Reported Cases"
  ) +
  theme_bw()
```

![](LAB_15_CMI_PB_files/figure-commonmark/unnamed-chunk-3-1.png)

Answer: Pertussis cases were very high from the 1920s to the 1940s.
After vaccination became common, cases dropped a lot and stayed low for
many years, but they began increasing again in more recent years.

# 2. A tale of two vaccines: wP and aP

## Q2. Using the ggplot `geom_vline()` function add lines to your previous plot for the 1946 introduction of the wP vaccine and the 1996 switch to aP vaccine. What do you notice?

``` r
ggplot(cdc) +
  aes(x = Year, y = Cases) +
  geom_line() +
  geom_point() +
  geom_vline(xintercept = 1946, linetype = "dashed") +
  geom_vline(xintercept = 1996, linetype = "dashed") +
  labs(
    title = "U.S. Reported Pertussis Cases with Vaccine Timeline",
    x = "Year",
    y = "Number of Reported Cases"
  ) +
  theme_bw()
```

![](LAB_15_CMI_PB_files/figure-commonmark/unnamed-chunk-4-1.png)

Answer: After the wP vaccine was introduced around 1946, pertussis cases
dropped strongly. After the switch to the aP vaccine around 1996, cases
began increasing again compared with the very low levels before.

## Q3. Describe what happened after the introduction of the aP vaccine? Do you have a possible explanation for the observed trend?

Answer: After the aP vaccine was introduced, pertussis cases started
increasing again over time. A possible explanation for this is that
immunity from the aP vaccine may not last as long as immunity from the
older wP vaccine.

# 3. Exploring CMI-PB data

## Reading the subject data

``` r
subject <- read_json("https://www.cmi-pb.org/api/subject", simplifyVector = TRUE)

head(subject, 3)
```

      subject_id infancy_vac biological_sex              ethnicity  race
    1          1          wP         Female Not Hispanic or Latino White
    2          2          wP         Female Not Hispanic or Latino White
    3          3          wP         Female                Unknown White
      year_of_birth date_of_boost      dataset
    1    1986-01-01    2016-09-12 2020_dataset
    2    1968-01-01    2019-01-28 2020_dataset
    3    1983-01-01    2016-10-10 2020_dataset

## Q4. How many aP and wP infancy vaccinated subjects are in the dataset?

``` r
table(subject$infancy_vac)
```


    aP wP 
    87 85 

Answer: There are 87 aP-vaccinated subjects and 85 wP-vaccinated
subjects in the dataset.

## Q5. How many Male and Female subjects/patients are in the dataset?

``` r
table(subject$biological_sex)
```


    Female   Male 
       112     60 

Answer: There are 112 female subjects and 60 male subjects in the
dataset.

## Q6. What is the breakdown of race and biological sex?

``` r
table(subject$race, subject$biological_sex)
```

                                               
                                                Female Male
      American Indian/Alaska Native                  0    1
      Asian                                         32   12
      Black or African American                      2    3
      More Than One Race                            15    4
      Native Hawaiian or Other Pacific Islander      1    1
      Unknown or Not Reported                       14    7
      White                                         48   32

Answer: The largest group is White females with 48 subjects, followed by
Asian females with 32 subjects and White males with 32 subjects. Other
groups have smaller numbers, including Black or African American, More
Than One Race, Native Hawaiian or Other Pacific Islander, American
Indian/Alaska Native, and Unknown/Not Reported.

## Q7. Using this approach determine (i) the average age of wP individuals, (ii) the average age of aP individuals; and (iii) are they significantly different?

``` r
subject <- subject %>%
  mutate(age = today() - ymd(year_of_birth))

subject %>%
  group_by(infancy_vac) %>%
  summarize(avg_age_years = mean(time_length(age, "years"), na.rm = TRUE))
```

    # A tibble: 2 × 2
      infancy_vac avg_age_years
      <chr>               <dbl>
    1 aP                   28.3
    2 wP                   37.1

``` r
t.test(time_length(age, "years") ~ infancy_vac, data = subject)
```


        Welch Two Sample t-test

    data:  time_length(age, "years") by infancy_vac
    t = -12.918, df = 104.03, p-value < 2.2e-16
    alternative hypothesis: true difference in means between group aP and group wP is not equal to 0
    95 percent confidence interval:
     -10.094058  -7.407351
    sample estimates:
    mean in group aP mean in group wP 
            28.32656         37.07726 

Answer: The average age of the aP group is 28.30 years, and the average
age of the wP group is 37.06 years. The groups are significantly
different because the p-value is less than 2.2e-16, which is much
smaller than 0.05.

## Q8. Determine the age of all individuals at time of boost.

``` r
subject <- subject %>%
  mutate(age_at_boost = ymd(date_of_boost) - ymd(year_of_birth))

head(subject)
```

      subject_id infancy_vac biological_sex              ethnicity  race
    1          1          wP         Female Not Hispanic or Latino White
    2          2          wP         Female Not Hispanic or Latino White
    3          3          wP         Female                Unknown White
    4          4          wP           Male Not Hispanic or Latino Asian
    5          5          wP           Male Not Hispanic or Latino Asian
    6          6          wP         Female Not Hispanic or Latino White
      year_of_birth date_of_boost      dataset        age age_at_boost
    1    1986-01-01    2016-09-12 2020_dataset 14767 days   11212 days
    2    1968-01-01    2019-01-28 2020_dataset 21342 days   18655 days
    3    1983-01-01    2016-10-10 2020_dataset 15863 days   12336 days
    4    1988-01-01    2016-08-29 2020_dataset 14037 days   10468 days
    5    1991-01-01    2016-08-29 2020_dataset 12941 days    9372 days
    6    1988-01-01    2016-10-10 2020_dataset 14037 days   10510 days

Answer: The new column `age_at_boost` shows each subject’s age at the
time they received the booster.

## Q9. With the help of a faceted boxplot or histogram, do you think these two groups are significantly different?

``` r
ggplot(subject) +
  aes(x = time_length(age_at_boost, "years"),
      fill = as.factor(infancy_vac)) +
  geom_histogram(show.legend = FALSE) +
  facet_wrap(vars(infancy_vac), nrow = 2) +
  xlab("Age in years") +
  theme_bw()
```

    `stat_bin()` using `bins = 30`. Pick better value `binwidth`.

![](LAB_15_CMI_PB_files/figure-commonmark/unnamed-chunk-11-1.png)

Answer: Yes, the two groups look different. The aP group is generally
younger, mostly around 18–30 years old, while the wP group is generally
older and more spread out. This matches the t-test result from Q7
showing a significant difference.

## Reading specimen and antibody titer data

``` r
specimen <- read_json("https://www.cmi-pb.org/api/specimen", simplifyVector = TRUE)

titer <- read_json("https://www.cmi-pb.org/api/plasma_ab_titer", simplifyVector = TRUE)
```

## Q9. Complete the code to join specimen and subject tables to make a new merged data frame containing all specimen records along with their associated subject details.

``` r
meta <- inner_join(specimen, subject)
```

    Joining with `by = join_by(subject_id)`

``` r
dim(meta)
```

    [1] 1503   15

``` r
head(meta)
```

      specimen_id subject_id actual_day_relative_to_boost
    1           1          1                           -3
    2           2          1                            1
    3           3          1                            3
    4           4          1                            7
    5           5          1                           11
    6           6          1                           32
      planned_day_relative_to_boost specimen_type visit infancy_vac biological_sex
    1                             0         Blood     1          wP         Female
    2                             1         Blood     2          wP         Female
    3                             3         Blood     3          wP         Female
    4                             7         Blood     4          wP         Female
    5                            14         Blood     5          wP         Female
    6                            30         Blood     6          wP         Female
                   ethnicity  race year_of_birth date_of_boost      dataset
    1 Not Hispanic or Latino White    1986-01-01    2016-09-12 2020_dataset
    2 Not Hispanic or Latino White    1986-01-01    2016-09-12 2020_dataset
    3 Not Hispanic or Latino White    1986-01-01    2016-09-12 2020_dataset
    4 Not Hispanic or Latino White    1986-01-01    2016-09-12 2020_dataset
    5 Not Hispanic or Latino White    1986-01-01    2016-09-12 2020_dataset
    6 Not Hispanic or Latino White    1986-01-01    2016-09-12 2020_dataset
             age age_at_boost
    1 14767 days   11212 days
    2 14767 days   11212 days
    3 14767 days   11212 days
    4 14767 days   11212 days
    5 14767 days   11212 days
    6 14767 days   11212 days

Answer: The `meta` data frame has 1503 rows and 15 columns. It joins
each specimen record with the matching subject information, including
vaccine type, sex, race, age, and boost information.

## Q10. Now using the same procedure join meta with titer data so we can further analyze this data in terms of time of visit, aP/wP, male/female, etc.

``` r
abdata <- inner_join(titer, meta)
```

    Joining with `by = join_by(specimen_id)`

``` r
dim(abdata)
```

    [1] 52576    22

Answer: The `abdata` data frame has 52,576 rows and 22 columns. It joins
antibody titer data with specimen and subject information, so antibody
levels can now be analyzed by visit, vaccine group, sex, race, age, and
other subject details.

## Q11. How many specimens/entries in `abdata` do we have for each isotype?

``` r
table(abdata$isotype)
```


      IgE   IgG  IgG1  IgG2  IgG3  IgG4 
     6698  5389 10117 10124 10124 10124 

Answer: The dataset has 6,698 IgE entries, 5,389 IgG entries, 10,117
IgG1 entries, 10,124 IgG2 entries, 10,124 IgG3 entries, and 10,124 IgG4
entries.

## Q12. What are the different `dataset` values in `abdata` and what do you notice about the number of rows for the most recent dataset?

``` r
table(abdata$dataset)
```


    2020_dataset 2021_dataset 2022_dataset 2023_dataset 
           31520         8085         7301         5670 

Answer: The dataset values are 2020_dataset, 2021_dataset, 2022_dataset,
and 2023_dataset. The most recent dataset is 2023_dataset, and it has
5,670 rows, which is fewer than the older 2020_dataset and 2021_dataset.

# 4. Examine IgG Ab titer levels

## Filtering for IgG antibody data

``` r
igg <- abdata %>% 
  filter(isotype == "IgG")

head(igg)
```

      specimen_id isotype is_antigen_specific antigen        MFI MFI_normalised
    1           1     IgG                TRUE      PT   68.56614       3.736992
    2           1     IgG                TRUE     PRN  332.12718       2.602350
    3           1     IgG                TRUE     FHA 1887.12263      34.050956
    4          19     IgG                TRUE      PT   20.11607       1.096366
    5          19     IgG                TRUE     PRN  976.67419       7.652635
    6          19     IgG                TRUE     FHA   60.76626       1.096457
       unit lower_limit_of_detection subject_id actual_day_relative_to_boost
    1 IU/ML                 0.530000          1                           -3
    2 IU/ML                 6.205949          1                           -3
    3 IU/ML                 4.679535          1                           -3
    4 IU/ML                 0.530000          3                           -3
    5 IU/ML                 6.205949          3                           -3
    6 IU/ML                 4.679535          3                           -3
      planned_day_relative_to_boost specimen_type visit infancy_vac biological_sex
    1                             0         Blood     1          wP         Female
    2                             0         Blood     1          wP         Female
    3                             0         Blood     1          wP         Female
    4                             0         Blood     1          wP         Female
    5                             0         Blood     1          wP         Female
    6                             0         Blood     1          wP         Female
                   ethnicity  race year_of_birth date_of_boost      dataset
    1 Not Hispanic or Latino White    1986-01-01    2016-09-12 2020_dataset
    2 Not Hispanic or Latino White    1986-01-01    2016-09-12 2020_dataset
    3 Not Hispanic or Latino White    1986-01-01    2016-09-12 2020_dataset
    4                Unknown White    1983-01-01    2016-10-10 2020_dataset
    5                Unknown White    1983-01-01    2016-10-10 2020_dataset
    6                Unknown White    1983-01-01    2016-10-10 2020_dataset
             age age_at_boost
    1 14767 days   11212 days
    2 14767 days   11212 days
    3 14767 days   11212 days
    4 15863 days   12336 days
    5 15863 days   12336 days
    6 15863 days   12336 days

## Q13. Complete the following code to make a summary boxplot of Ab titer levels for all antigens.

``` r
ggplot(igg) +
  aes(MFI_normalised, antigen) +
  geom_boxplot() + 
  xlim(0, 75) +
  facet_wrap(vars(visit), nrow = 2) +
  theme_bw()
```

    Warning: Removed 5 rows containing non-finite outside the scale range
    (`stat_boxplot()`).

![](LAB_15_CMI_PB_files/figure-commonmark/unnamed-chunk-18-1.png)

Answer: The boxplot shows IgG antibody titer levels for different
antigens across visits. Pertussis-related antigens such as PT, PRN, FHA,
and FIM2/3 show stronger changes over time compared with control
antigens like OVA.

## Q14. What antigens show differences in the level of IgG antibody titers recognizing them over time? Why these and not others?

Answer: PT, PRN, FHA, and FIM2/3 show differences in IgG antibody titers
over time because they are pertussis-related antigens that the immune
system responds to after vaccination. OVA does not show much change
because it is a control antigen and is not part of the pertussis vaccine
response.

## Q15. Filter to pull out only two specific antigens for analysis and create a boxplot for each.

``` r
filter(igg, antigen == "OVA") %>%
  ggplot() +
  aes(MFI_normalised, col = infancy_vac) +
  geom_boxplot(show.legend = FALSE) +
  facet_wrap(vars(visit)) +
  theme_bw()
```

![](LAB_15_CMI_PB_files/figure-commonmark/unnamed-chunk-19-1.png)

``` r
filter(igg, antigen == "FIM2/3") %>%
  ggplot() +
  aes(MFI_normalised, col = infancy_vac) +
  geom_boxplot(show.legend = FALSE) +
  facet_wrap(vars(visit)) +
  theme_bw()
```

![](LAB_15_CMI_PB_files/figure-commonmark/unnamed-chunk-20-1.png)

Answer: OVA stays low and does not show a strong response because it is
a control antigen. FIM2/3 shows more changes over time because it is
related to pertussis and can trigger a vaccine-related immune response.

## Q16. What do you notice about these two antigens time courses and the PT data in particular?

Answer: OVA stays low and does not show a strong time-course response
because it is a control antigen. FIM2/3 shows more change over time
because it is pertussis-related. PT is especially important because it
is a major pertussis toxin antigen and shows a clear booster-related
immune response.

## Q17. Do you see any clear difference in aP vs. wP responses?

Answer: There are some small differences between aP and wP responses,
but the boxplots do not show a very clear separation. More detailed
analysis would be needed to confirm strong differences between the two
vaccine groups.

## Q18. Does this trend look similar for the 2020 dataset?

``` r
abdata.21 <- abdata %>% 
  filter(dataset == "2021_dataset")

abdata.21 %>% 
  filter(isotype == "IgG", antigen == "PT") %>%
  ggplot() +
  aes(
    x = planned_day_relative_to_boost,
    y = MFI_normalised,
    col = infancy_vac,
    group = subject_id
  ) +
  geom_point() +
  geom_line() +
  geom_vline(xintercept = 0, linetype = "dashed") +
  geom_vline(xintercept = 14, linetype = "dashed") +
  labs(
    title = "2021 Dataset IgG PT",
    subtitle = "Dashed lines show day 0 and day 14"
  ) +
  theme_bw()
```

![](LAB_15_CMI_PB_files/figure-commonmark/unnamed-chunk-21-1.png)

``` r
abdata.20 <- abdata %>% 
  filter(dataset == "2020_dataset")

abdata.20 %>% 
  filter(isotype == "IgG", antigen == "PT") %>%
  ggplot() +
  aes(
    x = planned_day_relative_to_boost,
    y = MFI_normalised,
    col = infancy_vac,
    group = subject_id
  ) +
  geom_point() +
  geom_line() +
  geom_vline(xintercept = 0, linetype = "dashed") +
  geom_vline(xintercept = 14, linetype = "dashed") +
  labs(
    title = "2020 Dataset IgG PT",
    subtitle = "Dashed lines show day 0 and day 14"
  ) +
  theme_bw()
```

![](LAB_15_CMI_PB_files/figure-commonmark/unnamed-chunk-22-1.png)

Answer: Yes, the 2020 dataset shows a similar trend to the 2021 dataset.
IgG PT levels increase after the booster, with higher values around the
early post-boost time points, especially near day 14, and then they
decrease again over time.

# 5. Obtaining CMI-PB RNASeq data

## Reading RNASeq data for IGHG1

``` r
url <- "https://www.cmi-pb.org/api/v2/rnaseq?versioned_ensembl_gene_id=eq.ENSG00000211896.7"

rna <- read_json(url, simplifyVector = TRUE)

ssrna <- inner_join(rna, meta)
```

    Joining with `by = join_by(specimen_id)`

## Q19. Make a plot of the time course of gene expression for IGHG1 gene, i.e. a plot of visit vs. TPM.

``` r
ggplot(ssrna) +
  aes(visit, tpm, group = subject_id) +
  geom_point() +
  geom_line(alpha = 0.2) +
  labs(
    title = "IGHG1 Gene Expression Over Time",
    x = "Visit",
    y = "TPM"
  ) +
  theme_bw()
```

![](LAB_15_CMI_PB_files/figure-commonmark/unnamed-chunk-24-1.png)

Answer: The plot shows IGHG1 gene expression across visits for each
subject.

## Q20. What do you notice about the expression of this gene, i.e. when is it at its maximum level?

Answer: IGHG1 expression increases after the booster and reaches its
highest level around visit 4. After that, expression generally decreases
again at later visits.

## Q21. Does this pattern in time match the trend of antibody titer data? If not, why not?

Answer: The RNA expression pattern does not perfectly match the antibody
titer pattern. RNA levels rise quickly after vaccination and then drop,
while antibody protein levels can appear later and remain in the blood
longer.
