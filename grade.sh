# Create your grading script here
set -e
CPATH=".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar"
rm -rf student-submission
git clone $1 student-submission

# check file exist
if [[ -f "./student-submission/ListExamples.java" ]]
then 
    echo "correct file submitted"
else 
    echo "missing file"
fi

# copy the test & lib to student-submission
cp TestListExamples.java ./student-submission/
cp -r lib ./student-submission/
set +e
# compile the test & student code
cd student-submission
javac -cp $CPATH *.java
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples 1> stdout 

CHECK=$(grep -o "Failures" stdout)
PASS=$(grep -E -o ".{0,2}test.{0,0}" stdout)
FAILURE=$(grep -E -o "Failures.{0,3}" stdout)

# check how many passed tests
if [[ $CHECK ]]
    then
        echo "Total: 4 tests"
        echo "$FAILURE"
    else
        echo "Total: 4 tests"
        echo "You pass: $PASS"
fi 

if [[ $? -eq 0 ]]
then 
    exit
else    
    echo "test filed!"
fi

