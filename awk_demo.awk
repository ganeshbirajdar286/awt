#!/bin/awk -f 
 

function add(x,y){
 print x+y
}

#Comment `
BEGIN{
  print "hello "
   name="Raju"
   age=20

   #array
   arr1[0]=1
   arr1[1]=2

   marks["english"]=50
   marks["maths"]=50

  # for loop
   for (i in arr1) print arr1[i]
   for(subject in marks) print"marsk in "subject, marks[subject]
}

# patter and action
{
}

#END

END{
print arr1[0],arr1[1]
add(arr1[0],arr1[1])
}
