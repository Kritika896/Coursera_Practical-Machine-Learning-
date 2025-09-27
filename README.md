# Practical Machine Learning: Exercise Quality Prediction

## Project Overview

This project uses machine learning techniques to predict the quality of barbell lifts based on accelerometer data from wearable devices. The goal is to classify exercises into one of five categories: one correct form and four common mistakes.

## Dataset

The data comes from the Weight Lifting Exercise Dataset, where 6 participants performed barbell lifts in 5 different ways:

- **Class A**: Exactly according to specification (correct)
- **Class B**: Throwing elbows to the front (mistake)
- **Class C**: Lifting dumbbell only halfway (mistake)
- **Class D**: Lowering dumbbell only halfway (mistake)
- **Class E**: Throwing hips to the front (mistake)

**Data Sources:**
- Training data: [pml-training.csv](https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv)
- Testing data: [pml-testing.csv](https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv)

## Analysis Summary

### Model Performance
- **Best Model**: Random Forest
- **Accuracy**: 99.2%
- **Out-of-Sample Error**: 0.8%
- **Cross-Validation**: 3-fold CV
- **Test Cases Predicted**: 20/20

### Key Methods Used
1. **Data Preprocessing**
   - Removed near-zero variance variables
   - Eliminated variables with >95% missing values
   - Removed identification variables

2. **Model Comparison**
   - Random Forest (Winner: 99.2% accuracy)
   - Gradient Boosting Machine (98.8% accuracy)
   - Decision Tree (74.5% accuracy)

3. **Validation Strategy**
   - 70/30 train/validation split
   - 3-fold cross-validation
   - Out-of-sample error estimation

## Files in This Directory

- `index.Rmd` - Main analysis R Markdown document
- `index.html` - Compiled HTML report (generated after knitting)
- `predictions.csv` - Final predictions for 20 test cases
- `README.md` - This documentation file

## How to Reproduce the Analysis

### Prerequisites
Make sure you have R installed with the following packages:
```r
install.packages(c(
  "caret", "randomForest", "rpart", "rpart.plot", 
  "corrplot", "dplyr", "ggplot2", "knitr", 
  "rmarkdown", "gbm"
))
```

### Running the Analysis
1. Open `index.Rmd` in RStudio
2. Click "Knit" to generate the HTML report
3. The analysis will automatically download the required datasets
4. Results will be saved to `predictions.csv`

### Expected Runtime
- **Data download**: ~30 seconds
- **Model training**: 5-10 minutes (depending on your machine)
- **Total runtime**: ~15 minutes

## Model Details

### Feature Engineering
- Started with 160 variables
- Reduced to 54 predictors after cleaning
- Most important predictors: `roll_belt`, `pitch_forearm`, `yaw_belt`

### Random Forest Configuration
- Number of trees: 100
- Cross-validation: 3-fold
- Variable selection: Automatic (mtry tuned)
- Out-of-bag error rate: <1%

## Results Interpretation

The Random Forest model successfully identifies exercise quality with high accuracy by analyzing accelerometer data patterns. The model can distinguish between correct form and specific types of mistakes, making it valuable for:

- **Fitness apps**: Real-time exercise form feedback
- **Physical therapy**: Movement quality assessment  
- **Sports training**: Performance optimization
- **Research**: Human activity recognition

## Reproducibility Notes

- Random seed set to 12345 for consistent results
- All code is provided in the R Markdown document
- Data sources are publicly available
- Analysis follows best practices for machine learning workflows

## Citation

If you use this analysis, please cite the original data source:

Velloso, E.; Bulling, A.; Gellersen, H.; Ugulino, W.; Fuks, H. **Qualitative Activity Recognition of Weight Lifting Exercises**. Proceedings of 4th International Conference in Cooperation with SIGCHI (Augmented Human '13). Stuttgart, Germany: ACM SIGCHI, 2013.

## Contact

**Author**: Kritika Sinha 
**Date**: September 27, 2025  
**Course**: Practical Machine Learning Project

---

*This project demonstrates the application of machine learning techniques to real-world fitness data, achieving high accuracy in exercise quality classification.*
