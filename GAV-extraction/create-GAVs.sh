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

dos2unix $EFFECTIVE_POM

# removes superfluous information of effective pom, only keeps everyting in <dependencyManagement>
sed '/<dependencyManagement>/,/<\/dependencyManagement>/!d' $EFFECTIVE_POM > effectivePom-1.txt

# removes lines with <dependencyManagement> and </dependencyManagement>
sed '/dependencyManagement/d' effectivePom-1.txt > effectivePom-2.txt

# removes lines with <dependencies> or </dependencies>
sed '/dependencies>/d' effectivePom-2.txt > effectivePom-3.txt

# removes lines with <dependency> or </dependency>
sed '/dependency>/d' effectivePom-3.txt > effectivePom-4.txt

# removes all lines between and incl. <exclusions> and </exclusions>
sed '/<exclusions>/,/<\/exclusions>/d' effectivePom-4.txt > effectivePom-5.txt

# removes all lines beginning with <type>
sed '/<type>/d' effectivePom-5.txt > effectivePom-6.txt

# removes all lines beginning with <classifier>
sed '/<classifier>/d' effectivePom-6.txt > effectivePom-7.txt

# removes all lines beginning with <scope>
sed '/<scope>/d' effectivePom-7.txt > effectivePom-8.txt

# removes all blank characters
sed -e 's/^[ \t]*//' -e 's/[ \t]*$//' effectivePom-8.txt > effectivePom-9.txt

# replaces </groupId> + any whitespace + line break + <artifactId> by :
# sed '$!N;s/<\/groupId>\s\n<artifactId>/:/;P;D' effectivePom-9.txt > effectivePom-10.txt
# without strange characters- some mvn help:effective-pom have got blank character as line endings
sed '$!N;s/<\/groupId>\n<artifactId>/:/;P;D' effectivePom-9.txt > effectivePom-10.txt

# replaces </artifactId> + any whitespace + line break +  <version> by :
# sed '$!N;s/<\/artifactId>\s\n<version>/:/;P;D' effectivePom-10.txt > effectivePom-11.txt
# without strange characters - some mvn help:effective-pom have got blank character as line endings
sed '$!N;s/<\/artifactId>\n<version>/:/;P;D' effectivePom-10.txt > effectivePom-11.txt

# remove string <groupId>
sed -e 's/<groupId>//g' effectivePom-11.txt > effectivePom-12.txt

# remove string </version>
sed -e 's/<\/version>//g' effectivePom-12.txt > effectivePom-13.txt

# removes lines beginning with org.drools org.jbpm org.guvnor org.uberfire org.optaplanner org.dashbuilder org.kie org.jboss.dashboard-builder
sed '/^org.drools/d;/^org.jbpm/d;/^org.guvnor/d;/^org.uberfire/d;/^org.optaplanner/d;/^org.dashbuilder/d;/^org.kie/d;/^org.jboss.dashboard-builder/d' effectivePom-13.txt > effectivePom-14.txt

# remove duplicates
sort effectivePom-14.txt | uniq -c > effectivePom-15.txt

# remove blank spaces at beginning of each line
sed 's/^ *//g' effectivePom-15.txt > effectivePom-16.txt
# remove leading tabs at beginning of each line
# sed 's/^[ \t]+//g' effectivePom-15.txt > effectivePom-16.txt

# cut until GAV starts ie [171 antlr:antlr:2.7.7] --> [antlr:antlr:2.7.7]
cut -d" " -f2 effectivePom-16.txt > effectivePom-17.txt

# sorts file in alphabetical order
cat effectivePom-17.txt | sort > $OUTPUT_FILE

# remove all effectivePom- files
rm effectivePom-*.txt

