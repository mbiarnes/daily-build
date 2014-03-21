daily-build
===========

##daily-build scripts and environment
 
###This document describes the environment and it's scripts used for displaying the results 

####server: `hp-dl380pg8-01.lab.eng.brq.redhat.com`
**RAM**: 24565792 kB   
**CPU**: Intel(R) Xeon(R) CPU E5-2620 0 @ 2.00GHz  (X 12 processors)   

###Table of contents

* **Users**
 * [kiereleaseuser](#a)
 * [jbpm-6.0-build](#b)
 * [jbpm-master-build](#c)
 * [jbpm-6.0-deploy-as7](#d)
 * [jbpm-6-0-deploy-eap-6-1](#e)
 * [jbpm-6-0-deploy-eap-modulesmas](#f)
 * [jbpm-6-0-deploy-tomcat-7](#g)
 * [jbpm-master-deploy-as7](#h)
 * [bpms-prod-eap-6.1.1](#i)
* [Where are the scripts located](#j) 
* [Resuming](#k)


<a name="a"></a>
###kiereleaseuser
This user is for doing releases on this server. This account doesn't interfere in no way the daily builds.

<a name="b"></a>
###jbpm-6.0-build 
On this account the 6.0.x branch is build twice a day (**_06:00 AM and 18:00 PM_**).  
The daily build routine works like:  

1. copies the scripts to execute from **/tmp/kieScr/...** directory   
SCRIPT: (**_/home/jbpm-6-0-build/scripts/copyFromTmp.sh_**)

2. removes the directory with all the repositories and parts of the **.m2/repository/**  
SCRIPT: (**_/home/jbpm-6-0-build/scripts/clean-local-maven.sh_**)

3. clones all repositories in the directory GIT and checksout to 6.0.x (uberfire = 0.3.x) branches  
SCRIPT: (**_/home/jbpm-6-0-build/scripts/clone-all.sh_**) 

4. builds all projects in the directory GIT using `mvn clean install -Dfull -DskipTests`   
SCRIPT: (**_/home/jbpm-6-0-build/scripts/full-build-src.sh_**)   
SCRIPT: (**_/home/jbpm-6-0-build/scripts/full-build-src-tests.sh_** (this script executes   
`mvn clean install -DskipTests -Dmaven.test.failure.ignore=true` ) executed only on saturdays and sundays of each week

5. copies all binaries to _/var/jbpm-artifacts/6.0.x/new_   
SCRIPT: (**_/home/jbpm-6-0-build/scripts/copy-artifacts.sh_**)

6. copies all binaries to filemgmt.jboss.org/drools/release/snapshots/6.0.x   
SCRIPT: (**_/home/jbpm-6-0-build/scripts/copyToFilemgmt.sh_**)

7. all scripts are executed in a "father"script via cronjob
SCRIPT: (**_/home/jbpm-6-0-build/daily_build.sh_** and **_/home/jbpm-6-0-build/daily-build-tests.sh_** )

If the build(s) was(were) successful or not - in either case the binaries are copied to  _/var/jbpm-artifacts/6.0.x/new_ and are displayed on: [http://hp-dl380pg8-01.lab.eng.brq.redhat.com/jbpm-artifacts/6.0.x/new/](http://hp-dl380pg8-01.lab.eng.brq.redhat.com/jbpm-artifacts/6.0.x/new/). **ONLY**  if the build was successful the articafts were copied from  _/var/jbpm-artifacts/6.0.x/new_ to  _/var/jbpm-artifacts/6.0.x/_ and displayed [here](http://hp-dl380pg8-01.lab.eng.brq.redhat.com/jbpm-artifacts/6.0.x/).   
[This link](http://hp-dl380pg8-01.lab.eng.brq.redhat.com/jbpm-artifacts/6.0.x/) shows the artifacts created  during the last successful build whereas the link to [.../new](http://hp-dl380pg8-01.lab.eng.brq.redhat.com/jbpm-artifacts/6.0.x/new/) shows the artifacts created during the last (successful or not successful) build. For this reason the content of [6.0.x](http://hp-dl380pg8-01.lab.eng.brq.redhat.com/jbpm-artifacts/6.0.x/) and [6.0.x/new](http://hp-dl380pg8-01.lab.eng.brq.redhat.com/jbpm-artifacts/6.0.x/new) doesn't have to be identical. Looking at the dates it is possible to see when was the last build (successful or not) and when was the last successful build.  

In either case a mail is sent automatically to several users to tell about the status of the last build, if successful or not. A log file is attached when the build wasn't successful to determine the reason for the failure. Since there are two builds, all repositories and especially the kie-wb-distribution/kie-eap-integration repository, two mails are send.

Looking at the [web](http://hp-dl380pg8-01.lab.eng.brq.redhat.com/jbpm-artifacts/6.0.x/) a listing of links to several JBoss and Tomcat instances can be seen, running on the server with the kie-wb-*, jbpm-dashboard-* artifacts deployed, as well as a listing of all binaries copied at the last successful build and the directories **/docs**, **/logs** and **/new/**.  
While **/new** contains all generated artifacts, docs and logs of the last build, the directory **/docs** contains the generated documents during the last successful build hence the directory **/logs** contains the logs of the last successful build. 

<a name="c"></a>
###jbpm-master-build  
On this account the **master** branch is build twice a day  (**_03:00 AM and 15:00 PM_**).  The whole environment and its scripts are identical with **jbpm-6.0-build**. The only difference is that the **master** branch serves for building.   
[to master artifacts](http://hp-dl380pg8-01.lab.eng.brq.redhat.com/jbpm-artifacts/master/)   

<a name="d"></a>
###jbpm-6.0-deploy-as7  
This account is for deploying **_kie-wb-*-jboss-as7.war_** and **_jbpm-dashboard-*-jboss-as7.war_** on a JBoss AS 7.1.1. The artifacts generated in the last successful build of **_jbpm-6.0.-build_** are deployed on a server instance JBoss AS 7.1.1   

The scripts are:
      
1. copies the scripts to execute from **_/tmp/kieScr/..._**   
SCRIPT: (**_/home/jbpm-6.0-deploy-as7/scripts/copyFromTmp.sh_**)

2. reinstalls the web server JBoss AS7 and all needed configuration files   
SCRIPT: (**_/home/jbpm-6.0-deploy-as7/scripts/reinstall-as7.sh_**)

3. deplyoes the kie-wb.war (BPMS) on the installed AS 7   
SCRIPT: (**_/home/jbpm-6.0-deploy-as7/scripts/deployArtifacts-a.sh_**)

4. deployes the dashboard.war (jbpm\_dashboard for AS7) on the installed AS7   
SCRIPT:(**_/home/jbpm-6.0-deploy-as7/scripts/deployArtifacts-b.sh_**)

5. start the JBoss AS7 server with the deployed artifacts   
SCRIPT: (**_/home/jbpm-6.0-deploy-as7/scripts/startServer.sh_**)

6. checks if the server started without error messages and send a mail   
SCRIPT: (**_/home/jbpm-6.0-deploy-as7/scripts/deployed.sh_**)

7. to see logs   
SCRIPT: (**_/home/jbpm-6.0-deploy-as7/scripts/logs.sh_**)

8. to stop the server   
SCRIPT: (**_/home/jbpm-6.0-deploy-as7/scripts/stopServer.sh_**)

9. all scripts are executed in a "father"script via cronjob   
SCRIPT: (**_/home/jbpm-6.0-deploy-as7/scripts/dailyServerInstall.sh_**)

Twice a day the script **_dailyServerInstall.sh_** is launched via cronjob, and all enumerated scripts are executed. To check if every script worked properly and the server was started and the artifacts deployed this [page](http://hp-dl380pg8-01.lab.eng.brq.redhat.com/jbpm-artifacts/) can be visited and the web servers can be accessed with admin/admin, katy/katy and root/root.

On Saturdays and Sundays all WEB servers are stopped given that users **_jbpm-6-0-build_** and **_jbpm-master-build_** execute a full build with unit tests. If not stopped, a lot of tests fail because of "already occupied ports".   

<a name="e"></a>
###jbpm-6.0-deploy-eap-6-1
In this account happens the same as in **_jbpm-6-0-deploy-as7_** but
   
* the JBoss server is a **_JBoss EAP 6.1.1_**   
* the artifacts are **_kie-wb-*-eap-6_1.war_** and **_jbpm-dashboard-*-jboss_as7.war_**
* it can be accessed by: [6.0.x on EAP 6.1.1](http://hp-dl380pg8-01.lab.eng.brq.redhat.com:8100/kie-wb/)

<a name="f"></a>
###jbpm-6.0-deploy-eap-modulesmas
In this account happens the same as in **_jbpm-6-0-deploy-eap-6-1_** but

* **_eap-modules-distributions-*-bpms-layer.zip_** has to be unzipped in the JBoss EAP 6.1.1 installation directory
* the artifacts are **_eap-modules-distributions-*-org.kie.kie-wb-webapp.war_** and **_eap-modules-distributions-*-org.jbpm.dashboard.jbpm-dashboard.war_**
* it can be accessed by: [eap modules of 6.0.x on EAP 6.1.1](http://hp-dl380pg8-01.lab.eng.brq.redhat.com:8140/kie-wb/)

<a name="g"></a>
###jbpm-6-0-deploy-tomcat-7
In this account happens the same as in **_jbpm-6-0-deploy-as7_** but

* the application server is **_Tomcat 7__**
* the artifacts are **_kie-wb-*-tomcat7.war _** and **_ jbpm-dashbuilder-*-tomcat-7.war_**
* it can be accessed by: [6.0.x on Tomcat 7](http://hp-dl380pg8-01.lab.eng.brq.redhat.com:8800/kie-wb/)

<a name="h"></a>
###jbpm-master-deploy-as7   
In this account happens the same as in **_jbpm-6-0-deploy-as7_** but   

* the artifacts are **_kie-wb-*-jboss-as7.war_** and **_jbpm-dashboard-*-jboss_as7.war_** but from **master** branch
* it can be accesed by: [master on AS7](http://hp-dl380pg8-01.lab.eng.brq.redhat.com:8210/kie-wb)

<a name="i"></a>
###bpms-prod-eap-6.1.1   
In this account, the completed and finished [product](http://dev138.mw.lab.eng.bos.redhat.com/candidate/bpms-6.0.0-ER7/jboss-bpms-6.0.0-redhat-7-deployable-eap6.x.zip) is fetched from [here](http://dev138.mw.lab.eng.bos.redhat.com/candidate/bpms-6.0.0-ER7) and deployed on a EAP 6.1.1.

<a name="j"></a>
###Where are the scripts located
There is a link to a github repository (now, March 2014 [here](https://github.com/mbiarnes/daily-build.git) ) where all scripts are located and stored.  
The workflow is, that via cronjob the scripts are copied from /home/kiereleaseuser/daily-build/... to the different user-directories. There the scripts are executed via cronjobs.   
The only scripts that are not in the github repository are:
* the **_/resources_** directories (*zips or *jar that install the JBoss, Tomcat servers)
* **_copyFromTmp.sh_** (script which copies all scripts from a /tmp directory)   

These scripts (or the **/resources** directory) will be found in /home/**user**/scripts.

<a name="k"></a>
###Resuming     
All web server can be accessed by this [page](http://hp-dl380pg8-01.lab.eng.brq.redhat.com/jbpm-artifacts/) and all created  master and 6.0.x artifacts could be downloaded from here, following the links.   
This server and it's accounts gives a good overview over the build success of the **master** and **6.0.x** branch as well as the deployments of created artifacts on different server (**_JBoss EAP 6.1.1, JBoss AS7, Tomcat 7_**). At any incidence during the build or the deployment users are notified immediately by email.   
This allows to fix bugs/errors in short term.