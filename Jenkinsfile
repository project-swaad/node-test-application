def snapshot_id = "${BUILD_NUMBER}"

pipeline{
    stages('Checking Version of Dependencies'){
        steps{
            echo "Checking Git Version"
            bash "git --version"
        }
    }
}