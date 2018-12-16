node('docker') {
    stage('Checkout') {
        checkout scm
        env.VERSION = gitVersion()
        echo "Version = ${env.VERSION}"
        env.ISTAG = isTag()
        echo "Tag = ${env.ISTAG}"
    }

    stage('Image Name') {
        withCredentials([
            usernamePassword(credentialsId: 'docker public', 
            usernameVariable: 'USERNAME', 
            passwordVariable: 'PASSWORD')]) {
            def imageName = "${USERNAME}/alpine-devpi-client"
            env.DOCKERIMAGENAME = env.ISTAG ? "${imageName}:${env.VERSION}" : "${imageName}"
        }
        echo "Docker Image = ${env.DOCKERIMAGENAME}"
    }
    
    stage('Build Image') {
        def builtImage = docker.build(env.DOCKERIMAGENAME,".")
    }

    stage('Push Image') {
        docker.withRegistry('','docker public') {
            def builtImage = docker.build(env.DOCKERIMAGENAME,".")
            builtImage.push()
        }
    }
}

def getCommit() {
    return sh(script: 'git rev-parse HEAD', returnStdout: true)?.trim()
}

def gitVersion() {
    desc = sh(script: "git describe --tags --long --dirty", returnStdout: true)?.trim()
    parts = desc.split('-')
    assert parts.size() in [3, 4]
    dirty = (parts.size() == 4)
    tag = parts[0]
    count = parts[1]
    sha = parts[2]
    if (count == '0' && !dirty) {
        return tag
    }
    return sprintf( '%1$s.dev%2$s+%3$s', [tag, count, sha.substring(1)])
}

def isTag() {
    commit = getCommit()
    if (commit) {
        desc = sh(script: "git describe --tags --long ${commit}", returnStdout: true)?.trim()
        match = desc =~ /.+-[0-9]+-g[0-9A-Fa-f]{6,}$/
        result = !match
        match = null
        return result
    }
    return false
}