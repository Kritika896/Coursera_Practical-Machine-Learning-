# Practical Machine Learning Project Setup Script
# Run this script to install required packages and render the analysis

# Function to install packages if not already installed
install_if_missing <- function(packages) {
  new_packages <- packages[!(packages %in% installed.packages()[,"Package"])]
  if(length(new_packages)) {
    cat("Installing missing packages:", paste(new_packages, collapse=", "), "\n")
    install.packages(new_packages, repos='https://cran.rstudio.com/')
  } else {
    cat("All required packages are already installed.\n")
  }
}

# List of required packages
required_packages <- c(
  "rmarkdown", "knitr", "caret", "randomForest", 
  "rpart", "rpart.plot", "corrplot", "dplyr", 
  "ggplot2", "gbm", "reshape2"
)

# Install missing packages
cat("=== INSTALLING REQUIRED PACKAGES ===\n")
install_if_missing(required_packages)

# Load packages to verify installation
cat("\n=== VERIFYING PACKAGE INSTALLATION ===\n")
for(pkg in required_packages) {
  if(require(pkg, character.only = TRUE, quietly = TRUE)) {
    cat("✓", pkg, "loaded successfully\n")
  } else {
    cat("✗", pkg, "failed to load\n")
  }
}

# Render the R Markdown document
cat("\n=== RENDERING R MARKDOWN DOCUMENT ===\n")
if(file.exists("index.Rmd")) {
  rmarkdown::render("index.Rmd")
  cat("✓ R Markdown document rendered successfully!\n")
  cat("✓ Check 'index.html' for the compiled analysis.\n")
} else {
  cat("✗ index.Rmd not found in current directory.\n")
  cat("Make sure you're running this script from the 'practical machine learning' folder.\n")
}

cat("\n=== SETUP COMPLETE ===\n")
cat("You can now:\n")
cat("1. Open 'index.html' in your browser to view the analysis\n")
cat("2. Edit 'index.Rmd' and re-run this script to update\n")
cat("3. Check 'predictions.csv' for the final model predictions\n")
