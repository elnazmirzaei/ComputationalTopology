########################################################
##Sampling and Filtering and converting to point cloud##
########################################################

##choosing Data
f="C:/Users/lili/courses/ComputationalTopology/Project 1/Project01-data/Project01-data/MPEG7dataset/original"
fr=paste (f,"results", sep = "/")
list=list.files("C:/Users/lili/courses/ComputationalTopology/Project 1/Project01-data/Project01-data/MPEG7dataset/original")
length(list)

newlist=list[grep("-1.gif",list)]
newlist[1:10]

finallist=newlist[c(1,2,3,4,5,8,10,11,12,13)]

#Filtering the edge of each shape and writing the point cloud in a file

library(wvtool)
for(i in c(1:10)){

im=read.gif(paste (f,finallist[i], sep = "/"))

A=edge.detect(im$image)

z=which(A!=0,arr.ind = T)



loc=paste (fr,substr(finallist[i], 1, nchar(finallist[i])-4), sep = "/")
loc=paste (loc,"-PointCloud.txt", sep = "")
write.table(z,file=loc, row.names = FALSE,col.names = FALSE)

}



