#!/bin/bash

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# This shell scripts reduces an effective pom to a                       +
# file that shows a GAV list: <artifacId>XXX                             +
# of all artifacts inside the <dependencyManagement>                     +
#                                                                        +
# IMPORTANT:                                                             +
# a file as "entry point" has to be defined and can be build with:       +
#                                                                        +
#          mvn help:effective-pom >> effectivePom.txt                    +
#                                                                        +
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

if [ $# != 2 ] ; then
    echo
    echo "Usage:"
    echo "  $0 input file output file"
    echo "For example:"
    echo "  $0 effectivePom.txt kie-p-w-d_GAV.txt"
    echo
    exit 1
fi

echo "the effective pom is: "$1
echo "the output file will be :" $2
echo -n "Is this ok? (Hit control-c if is not): "
read ok

EFFECTIVE_POM=$1
OUTPUT_FILE=$2

dos2unix $EFFECTIVE_POM

# removes superfluous information of effective pom, only keeps everyting in <dependencyManagement>
sed '/<dependencyManagement>/,/<\/dependencyManagement>/!d' $EFFECTIVE_POM > effectivePom-1.txt

# removes the very first two lines and the very last two lines [<dependencyManagement> <dependencies> ]
sed '1d;2d' effectivePom-1.txt > effectivePom-2.txt

# removes the two last lines [ </dependencies> </dependencyManagement> ]  
head --lines=-2 effectivePom-2.txt > effectivePom-3.txt

# removes all lines between and incl. <exclusions> and </exclusions>
sed '/<exclusions>/,/<\/exclusions>/d' effectivePom-3.txt > effectivePom-4.txt

# removes all lines beginning with <type>
sed '/<type>/d' effectivePom-4.txt > effectivePom-5.txt

# removes all lines beginning with <classifier>
sed '/<classifier>/d' effectivePom-5.txt > effectivePom-6.txt

# removes all lines beginning with <scope>
sed '/<scope>/d' effectivePom-6.txt > effectivePom-7.txt

# removes lines beginning with <version>
sed '/<version>/d' effectivePom-7.txt > effectivePom-8.txt

# removes all blank characters
sed -e 's/^[ \t]*//' -e 's/[ \t]*$//' effectivePom-8.txt > effectivePom-9.txt

# removes line starting woth <dependency> or </dependency>
sed '/<dependency>/d;/<\/dependency>/d' effectivePom-9.txt > effectivePom-10.txt

# moves GAV in one line
#sed 'N;N;N; s/\n/ /g' effectivePom-9.txt > effectivePom-10.txt
paste -d' ' - - < effectivePom-10.txt >> effectivePom-11.txt

# removes lines beginning with <groupId>org.drools <groupId>org.jbpm <groupId>org.guvnor <groupId>org.uberfire <groupId>org.optaplanner <groupId>org.dashbuilder <groupId>org.kie <groupId>org.jboss.dashboard-builder <groupId>org.optaweb
sed '/^<groupId>org.drools/d;/^<groupId>org.jbpm/d;/^<groupId>org.guvnor/d;/^<groupId>org.uberfire/d;/^<groupId>org.optaplanner/d;/^<groupId>org.dashbuilder/d;/^<groupId>org.kie/d;/^<groupId>org.jboss.dashboard-builder/d;/^<groupId>org.optaweb/d;' effectivePom-11.txt > effectivePom-12.txt

# removes lines with <dependencies> or <dependencyManagement>
sed '/<dependencies>/d' effectivePom-12.txt > effectivePom-13.txt
sed '/<\/dependencies>/d' effectivePom-13.txt > effectivePom-14.txt
sed '/<dependencyManagement>/d' effectivePom-14.txt > effectivePom-15.txt
sed '/<\/dependencyManagement>/d' effectivePom-15.txt > effectivePom-16.txt

# sorts file in alphabetical order
cat effectivePom-16.txt | sort > $OUTPUT_FILE

# remove all effectivePom- files
rm effectivePom-*.txt

