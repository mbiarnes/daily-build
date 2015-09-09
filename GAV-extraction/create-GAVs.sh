#!/bin/bash

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# This shell scripts reduces an effective pom to a                       +
# file that shows a GAV list: <groupId>:<artifacId>:<version>            +
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

# removes lines beginning with <dependency>
sed '/<dependency>/d' effectivePom-7.txt > effectivePom-8.txt

# removes lines beginning with </dependency>
sed '/<\/dependency>/d' effectivePom-8.txt > effectivePom-9.txt

# removes all blank characters
sed -e 's/^[ \t]*//' -e 's/[ \t]*$//' effectivePom-9.txt > effectivePom-10.txt

# replaces </groupId> + any whitespace + line break + <artifactId> by :
# sed '$!N;s/<\/groupId>\s\n<artifactId>/:/;P;D' effectivePom-10.txt > effectivePom-11.txt
# without strange characters- some mvn help:effective-pom have bot blank character as line endings
sed '$!N;s/<\/groupId>\n<artifactId>/:/;P;D' effectivePom-10.txt > effectivePom-11.txt

# replaces </artifactId> + any whitespace + line break +  <version> by :
# sed '$!N;s/<\/artifactId>\s\n<version>/:/;P;D' effectivePom-11.txt > effectivePom-12.txt
# without strange characters - some mvn help:effective-pom have got blank character as line endings
sed '$!N;s/<\/artifactId>\n<version>/:/;P;D' effectivePom-11.txt > effectivePom-12.txt

# remove string <groupId>
sed -e 's/<groupId>//g' effectivePom-12.txt > effectivePom-13.txt

# remove string </version>
sed -e 's/<\/version>//g' effectivePom-13.txt > effectivePom-14.txt

# removes lines beginning with org.drools org.jbpm org.guvnor org.uberfire org.optaplanner org.dashbuilder org.kie org.jboss.dashboard-builder
sed '/^org.drools/d;/^org.jbpm/d;/^org.guvnor/d;/^org.uberfire/d;/^org.optaplanner/d;/^org.dashbuilder/d;/^org.kie/d;/^org.jboss.dashboard-builder/d' effectivePom-14.txt > effectivePom-15.txt

# sorts file in alphabetical order
#cat effectivePom-15.txt | sort > jboss-ip-bom_GAV.txt
cat effectivePom-15.txt | sort > $OUTPUT_FILE

# remove all effectivePom- files
# rm effectivePom-*.txt

