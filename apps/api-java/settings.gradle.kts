rootProject.name = "api-java"

include("user-service", "auth-service", "common-lib")

project(":user-service").projectDir = file("user-service")
project(":auth-service").projectDir = file("auth-service")
project(":common-lib").projectDir = file("common-lib")
