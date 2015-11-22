library(dplyr)

my.data.folder = "./UCI HAR Dataset/"

#remember user's working directory
user.folder = getwd()

#set working directory
setwd(my.data.folder)

#use files
file.features = "./features.txt"
file.act.labels = "./activity_labels.txt"
file.sub.train = "./train/subject_train.txt"
file.x.train = "./train/x_train.txt"
file.y.train = "./train/y_train.txt"
file.sub.test = "./test/subject_test.txt"
file.x.test = "./test/x_test.txt"
file.y.test = "./test/y_test.txt"

#get features
features = as.character(read.table(file.features,header=FALSE)[,2])

#create a filter for features and data to extract only the measurements on the mean and standard deviation
filter.for.features = grep(".*mean.*|.*std.*",features)

#label features, creating descriptive variable names 
features = features[filter.for.features]
features = gsub('-std', 'Std', features)
features = gsub('-mean', 'Mean', features)
features = gsub('\\()', '', features)
features = gsub('-', '', features)
features = gsub('^(t)', 'Time', features)
features = gsub('^(f)', 'Frequency', features)
features = gsub('([Gg]ravity)', 'Gravity', features)
features = gsub('[Mm]ag', 'Magnitude', features)
features = gsub('[Aa]cc', 'Accelerometer', features)
features = gsub('([Bb]ody[Bb]ody|[Bb]ody)', 'Body', features)
features = gsub('[Gg]yro', 'Gyro', features)

#get labels
labels = read.table(file.act.labels,header=FALSE,col.names=c("Activity.ID","Activity"))

#get activities
activities = rbind(read.table(file.y.train,header=FALSE,col.names=c("Activity.ID")),
                   read.table(file.y.test,header=FALSE,col.names=c("Activity.ID")))

#get subjects
subjects = rbind(read.table(file.sub.train,header=FALSE,col.names=c("Subject")),
                 read.table(file.sub.test,header=FALSE,col.names=c("Subject")))

#load and merge the training and the test datasets
init.data = rbind(read.table(file.x.train,header=FALSE),
                  read.table(file.x.test))[filter.for.features]

#set variable names
colnames(init.data) = features

tidy.data = cbind(subjects,activities,init.data) %>%  #create the final data set
            merge (labels,by="Activity.ID") %>% #add descriptive activity names
            group_by(Subject,Activity) %>% #group by subjects and activities
            summarize_each(funs(mean)) #create the tidy data set with the average of each variable for each activity and each subject
              
#save the tidy data set 
write.table(tidy.data,"../tidy.data.txt",row.names = FALSE)

#return to the user folder
setwd(user.folder)
