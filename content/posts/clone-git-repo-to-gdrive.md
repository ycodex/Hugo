+++
date = 2020-03-27T18:30:00Z
tag = ["git ", "drive"]
title = "Clone git repo to GDrive"

+++
**Author: Karthik**

This is a way to clone the repositories to the google drive. I used it because the repo was way too big.

Lets get to the point, we'll  be using git colab for this.a

## Access google drive from google colab

Go to google colab ,signin and open a new notebook. This is similar to Jupyter Notebook.In there type the below code.

    from google.colab import drive
    rootpath="/content/drive"
    drive.mount(rootpath)

These two lines will get acces to your drive. It will send an url .Click on that url and get the code and paste it back here.

## Changing Directory

Now change to Mydrive location using the following code.

    %cd 'My Drive'

After this change directory to your desired location where you want to clone repo

    %cd path/to/your/location

## Cloning repository

First we need to get some things like

* DRIVE_PATH
* GIT_USERNAME
* GIT__ACCESS__TOKEN
* GIT_REPO

Goto your github settings and go to Developer settings.

In there go to personal access token and Generate a new Token .Make sure that you tick the repo box.Copy the token.

In the next cell in notebook type these.

    # import join used to join ROOT path and MY_GOOGLE_DRIVE_PATH
    from os.path import join  
    
    # path to your project on Google Drive
    DRIVE_PATH = 'My Drive/MyDrive/your/desired/path' 
    # replace with your Github username 
    GIT_USERNAME = "your username" 
    # replace with your token
    GIT_ACCESS_TOKEN = "{YOUR_GITHUB_TOKEN}"  
     # to clone repository
    GIT_REPO = "repo-name" 
    
    PROJECT_PATH = join(ROOT, MY_GOOGLE_DRIVE_PATH)
    # In case we haven't created the folder already; we will create a folder in the project path 
    !mkdir "{PROJECT_PATH}"    
    GIT_PATH = "https://" + GIT_ACCESS_TOKEN + "@github.com/" + GIT_USERNAME + "/" + GIT_REPO + ".git"
    

After this go to your project path and clone the repo.

    %cd "{PROJECT_PATH}"
    !git clone "{GIT_PATH}"

And you have successfully cloned to google drive.