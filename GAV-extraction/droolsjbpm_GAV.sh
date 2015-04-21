#!/bin/bash

#build effective pom of kie-parent-with-dependencies
#mvn help:effective-pom >> effectivePom.txt

# removes superfluous information of effective pom, only keeps everyting in <dependencyManagement>
sed '/<dependencyManagement>/,/<\/dependencyManagement>/!d' jboss-ip-bom-effectivePom.txt > effectivePom-1.txt

# removes the very first two lines and the very last two lines [<dependencyManagement> <dependencies> ]
sed '1d;2d' effectivePom-1.txt >> effectivePom-2.txt

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

# replaces </groupId> NEW LINE <artifactId> by :
sed '$!N;s/<\/groupId>\n<artifactId>/:/;P;D' effectivePom-10.txt > effectivePom-11.txt

# replaces </artifactId> NEW LINE <version> by :
sed '$!N;s/<\/artifactId>\n<version>/:/;P;D' effectivePom-11.txt > effectivePom-12.txt

# remove string <groupId>
sed -e 's/<groupId>//g' effectivePom-12.txt > effectivePom-13.txt

# remove string </version>
sed -e 's/<\/version>//g' effectivePom-13.txt > effectivePom-14.txt

# removes lines beginning with org.drools org.jbpm org.guvnor org.uberfire org.optaplanner org.dashbuilder org.kie org.jboss.dashboard-builder
sed '/^org.drools/d;/^org.jbpm/d;/^org.guvnor/d;/^org.uberfire/d;/^org.optaplanner/d;/^org.dashbuilder/d;/^org.kie/d;/^org.jboss.dashboard-builder/d' effectivePom-14.txt > effectivePom-15.txt

# sorts file in alphabetical order
cat effectivePom-15.txt | sort > jboss-ip-bom_GAV.txt

# remove all effectivePom- files
rm effectivePom-*.txt

