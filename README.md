# AnalysisAssignment

The assignment is realized using only the script run_analysis.R, which downloads and processes the dataset.

For that, it extract the data of the training and the test sets, compiling the respective subjects, activities and observation, each coming from different files. Then it merges both sets, mixing them by sorting the subjects.

Only the measurements on the mean and standard deviation are retained for the preliminary tidy dataset, and the column names are cleared by trimming unnecessary "X"s, numbers and points. Also activities are sorted.

Finally, the submitted dataset is a result of calculating the average of each variable for each subject and each activity. Where all activities get a descriptive name instead of a number.
