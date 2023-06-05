# Naive Bayes E-Mail Classifier


# Goal: 
Develop the system for email spam or ham classification using Naive Bayes Classifier

# Dataset: 
https://www.kaggle.com/datasets/venky73/spam-mails-dataset


# Assignment 1

Load the dataset and perform tokenization of words to create a dataset suitable for processing in ML model. It is necessary to perform following steps:
Create a dictionary of all words inside of the dataset. All email text should be tokenized into words. 
Stop words and special symbols should be removed from dictionary
Sort remaining words in the dictionary based on the frequency of occurrence and take the top 200 words as final dictionary
Perform feature extraction with simple boolean logic. For every sample record generate a feature based on that if the final dictionary word exists inside of the email text.


# Assignment 2

Once the dataset is preprocessed into matrix form with zeros and ones it is necessary to perform a split of data into train(70%) and test(30%) for model creation. Build the Naive Bayes Classifier using train data and validate it using test data. 
