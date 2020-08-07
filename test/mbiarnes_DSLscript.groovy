def javadk="kie-jdk1.8"
def javaToolEnv="KIE_JDK1_8"

def mailJob='''#!/bin/bash -e
echo "true";
'''

job("mailJob") {

    description("test job for attaching log to mail")

    logRotator {
        numToKeep(10)
    }
    label("kie-releases") 
  
    jdk("${javadk}")

    wrappers {
        timestamps()
        colorizeOutput()
        toolenv("${javaToolEnv}")
        preBuildCleanup()
    }

    publishers {
        extendedEmail {
            recipientList('mbiarnes@redhat.com')
            defaultSubject('$DEFAULT_SUBJECT')
            defaultContent('$DEFAULT_CONTENT')
            contentType('default')
            triggers {
                failure{
                    subject('PR build FAILED: $JOB_BASE_NAME')

                    content('\nPlease go to $BUILD_URL \n(IMPORTANT: you need have access to Red Hat VPN to access this link)') 
                       
                    attachBuildLog()

                    sendTo {
                        recipientList()
                    }
                }            
                unstable {
                    subject('PR build UNSTABLE: $JOB_BASE_NAME #$ghprbPullId')

                    content('\nPlease go to $BUILD_URL \n(IMPORTANT: you need have access to Red Hat VPN to access this link)') 
                        
                    attachBuildLog ()
   
                    sendTo {
                        recipientList()
                    }
                }
            }
        }
    }
  
    steps{   
        shell(mailJob)
    }   
}
