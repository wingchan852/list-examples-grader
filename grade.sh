# Create your grading script here
set -e
CPATH=".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar"
rm -rf student-submission > line4_out 2> line4_err
# echo $?
git clone $1 student-submission
echo $?
# check file exist
if [[ -f "./student-submission/ListExamples.java" ]]
then 
    echo "correct file submitted"
else 
    echo "missing file"
fi

# copy the test & lib to student-submission
cp TestListExamples.java ./student-submission/ > line17_out 2> line17_err
cp -r lib ./student-submission/ > line18_out 2> line18_err
set +e
# compile the test & student code
cd student-submission > line21_out 2> line21_err
javac -cp $CPATH *.java > line22_out 2> line22_err
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples 1> stdout 2>stderr

CHECK=$(grep -o "Failures" stdout)
PASS=$(grep -E -o ".{0,2}test.{0,0}" stdout)
FAILURE=$(grep -E -o "Failures.{0,3}" stdout)

# check how many passed tests
if [[ $CHECK ]]
    then
        echo "Total: 4 tests"
        grep "Failures" stdout
    else
        echo "Total: 4 tests"
        echo "You pass: $PASS"
fi 
echo $?
if [[ $? -eq 0 ]]
then 
    exit
else    
    echo "test filed!"
fi

