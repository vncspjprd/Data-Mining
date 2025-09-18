#Even Numbers
nums <- c(2,4,5,8)
if(all(nums %% 2 == 0)){
    print("All numbers are even")
} else {
    print("At least one number is even")
}

#Exam Pass/Fail
scores <- c(75,82,60,95,40)

if (all(scores >= 60)){
    print("All students passed")
} else {
    print("At least one student failed")
}

#Temperature Check
temp <- c(32, 35, 29, 40, 38)

if (all(temp >= 30)) {
    print("All days were hot")
} else {
    print("Any day was below 30")
}

